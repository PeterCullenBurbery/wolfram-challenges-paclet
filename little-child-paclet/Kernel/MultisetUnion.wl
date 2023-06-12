BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue

Begin["`Private`"];

(* Define your public and private symbols here. *)

expr :
    MultisetUnion[
        a__ ?
            (
                Function[{hashmap},
                    AssociationQ[hashmap]
                ]
            )
    ] :=
    Catch[
        Module[{p},
            p =
                First[
                    FirstPosition[
                        Values /@ {a}
                        ,
                        v_ /;
                            !MatchQ[
                                v
                                ,
                                {
                                    ___ ?
                                        (
                                            Function[{number},
                                                NonNegativeIntegerQ[number
                                                    ]
                                            ]
                                        )
                                }
                            ]
                        ,
                        {Null}
                        ,
                        {1}
                        ,
                        Heads -> False
                    ]
                ];
            If[MatchQ[
                p
                ,
                _ ?
                    (
                        Function[{number},
                            IntegerQ[number]
                        ]
                    )
            ],
                Message[MultisetUnion::nocnt, {a}[[p]], p];
                Throw[HoldForm[expr]]
            ];
            msetUnion[{a}]
        ]
    ]

expr : MultisetUnion[a___] :=
    Catch[
        Module[{p, h, counts},
            p = First[FirstPosition[{a}, _?AtomQ, {Null}, {1}, Heads 
                -> False]];
            If[MatchQ[
                p
                ,
                _ ?
                    (
                        Function[{number},
                            IntegerQ[number]
                        ]
                    )
            ],
                Message[MultisetUnion::normal, p, HoldForm[expr]];
                Throw[HoldForm[expr]]
            ];
            h = Head /@ {a};
            If[!MatchQ[h, {(x_)...}],
                p = 1 + First[FirstPosition[Rest[h], i_ /; i =!= First[
                    h], {Null}, {1}, Heads -> False]];
                Message[MultisetUnion::heads, First[h], h[[p]], 1, p]
                    ;
                Throw[HoldForm[expr]]
            ];
            counts = msetUnion[Counts /@ Apply[List, {a}, {1}]];
            countsToBag[counts, {a}, h]
        ]
    ]

MultisetUnion::nocnt = "Argument `1` at position `2` is not an Association of counts.";

msetUnion[
    a :
        {
            ___ ?
                (
                    Function[{hashmap},
                        AssociationQ[hashmap]
                    ]
                )
        }
] :=
    With[{counts = KeyUnion[a, 0&]},
        (KeySort[DeleteCases[#1, 0]]&)[Merge[counts, Max]]
    ]

countsToBag[counts_, a_, h_] :=
    (
        Switch[a,
            {__},
                First[h] @@ #1
            ,
            _,
                #1
        ]&
    )[Join @@ KeyValueMap[ConstantArray, counts]]

End[]; (* End `Private` *)

EndPackage[];
