BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue

Begin["`Private`"];

(* Define your public and private symbols here. *)

expr :
    MultisetInclusionQ[
        a_ ?
            (
                Function[{hashmap},
                    AssociationQ[hashmap]
                ]
            )
        ,
        b_ ?
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
                        Values /@ {a, b}
                        ,
                        v_ /;
                            !MatchQ[
                                v
                                ,
                                {
                                    ___ ?
                                            (
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
                Message[MultisetInclusionQ::nocnt, {a, b}[[p]], p];
                Throw[HoldForm[expr]]
            ];
            msetInclusionQ[a, b]
        ]
    ]

expr : MultisetInclusionQ[a_, b_] :=
    Catch[
        Module[{p, h},
            p = First[FirstPosition[{a, b}, _?AtomQ, {Null}, {1}, Heads
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
                Message[MultisetInclusionQ::normal, p, HoldForm[expr]
                    ];
                Throw[HoldForm[expr]]
            ];
            h = Head /@ {a, b};
            If[!MatchQ[h, {(x_)...}],
                p = 1 + First[FirstPosition[Rest[h], i_ /; i =!= First[
                    h], {Null}, {1}, Heads -> False]];
                Message[MultisetInclusionQ::heads, First[h], h[[p]], 
                    1, p];
                Throw[HoldForm[expr]]
            ];
            msetInclusionQ @@ Counts /@ Apply[List, {a, b}, {1}]
        ]
    ]

expr : MultisetInclusionQ[a___] :=
    (
        Message[MultisetInclusionQ::argrx, MultisetInclusionQ, Length[
            {a}], 2];
        HoldForm[expr]
    )

msetInclusionQ[a_, b_] :=
    With[{counts = KeyUnion[{b, a}, 0&]},
        And @@ Merge[counts, LessEqual @@ #1&]
    ]

End[]; (* End `Private` *)

EndPackage[];
