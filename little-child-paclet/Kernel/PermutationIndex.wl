BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

PermutationFromIndex[
    index_ ?
        (
            Function[{number},
                IntegerQ[number]
            ]
        )
    ,
    length_ ?
        (
            Function[{number},
                IntegerQ[number]
            ]
        )
] :=
    PermutationFromLehmerCode[LehmerCodeFromIndex[index, length]];

LehmerCodeFromIndex[
    index_ ?
        (
            Function[{number},
                IntegerQ[number]
            ]
        )
    ,
    length_ ?
        (
            Function[{number},
                IntegerQ[number]
            ]
        )
] :=
    Reverse[Last /@ FoldList[{Floor[#1[[1]] / #2], Mod[#1[[1]], #2]}&,
         {index - 1, 0}, Range[2, length]]];

PermutationFromLehmerCode[lehmercode_List] :=
    Module[{vals, result},
        vals = Range[Length[lehmercode]];
        result = Table[0, {Length[lehmercode]}];
        Do[
            result[[n]] = vals[[lehmercode[[n]] + 1]];
            vals = Drop[vals, {lehmercode[[n]] + 1}]
            ,
            {n, 1, Length[lehmercode]}
        ];
        result
    ];

PermutationIndex[
    order_ ?
        (
            Function[{number},
                PositiveIntegerQ[number]
            ]
        )
    ,
    index_ ?
        (
            Function[{number},
                PositiveIntegerQ[number]
            ]
        )
] :=
    PermutationFromIndex[index, order]

End[]; (* End `Private` *)

EndPackage[];
