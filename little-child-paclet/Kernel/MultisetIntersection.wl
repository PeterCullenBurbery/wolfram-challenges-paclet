BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue

Begin["`Private`"];

(* Define your public and private symbols here. *)

expr :
    MultisetIntersection[
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
                                    ___ ?(
                                                Function[{number},
                                                    NonNegativeIntegerQ[number]
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
                Message[MultisetIntersection::nocnt, {a}[[p]], p];
                Throw[HoldForm[expr]]
            ];
            msetIntersection[{a}]
        ]
    ]

expr : MultisetIntersection[] :=
    (
        Message[MultisetIntersection::argm, MultisetIntersection, 0, 
            1];
        HoldForm[expr]
    )

expr : MultisetIntersection[a___] :=
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
                Message[MultisetIntersection::normal, p, HoldForm[expr
                    ]];
                Throw[HoldForm[expr]]
            ];
            h = Head /@ {a};
            If[!MatchQ[h, {(x_)...}],
                p = 1 + First[FirstPosition[Rest[h], i_ /; i =!= First[
                    h], {Null}, {1}, Heads -> False]];
                Message[MultisetIntersection::heads, First[h], h[[p]],
                     1, p];
                Throw[HoldForm[expr]]
            ];
            counts = msetIntersection[Counts /@ Apply[List, {a}, {1}]
                ];
            countsToBag[counts, {a}, h]
        ]
    ]

msetIntersection[
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
        (KeySort[DeleteCases[#1, 0]]&)[Merge[counts, Min]]
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
