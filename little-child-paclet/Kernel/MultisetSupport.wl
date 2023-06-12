BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue

Begin["`Private`"];

(* Define your public and private symbols here. *)

expr :
    MultisetSupport[
        a_ ?
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
                Message[MultisetSupport::nocnt, {a}[[p]], p];
                Throw[HoldForm[expr]]
            ];
            Union[Keys[DeleteCases[a, 0]]]
        ]
    ]

expr : MultisetSupport[a_] :=
    Catch[
        Module[{p},
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
                Message[MultisetSupport::normal, p, HoldForm[expr]];
                Throw[HoldForm[expr]]
            ];
            Union[a]
        ]
    ]

expr : MultisetSupport[a___] :=
    (
        Message[MultisetSupport::argx, MultisetSupport, Length[{a}]];
            
        HoldForm[expr]
    )

End[]; (* End `Private` *)

EndPackage[];
