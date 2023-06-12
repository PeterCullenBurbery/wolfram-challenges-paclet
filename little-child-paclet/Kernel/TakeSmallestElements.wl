BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`TakeSmallestElements

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[TakeSmallestElements]

TakeSmallestElements[list_?ListQ] :=
  Module[{positionSmallest},
    positionSmallest = PositionSmallest[list];
    Extract[list, List /@ positionSmallest]
  ]

TakeSmallestElements[list_?ListQ, n_ ? (PositiveIntegerQ[#]&)] :=
  Module[{positionSmallest},
    positionSmallest = PositionLargest[list, n];
    Extract[list, List /@ positionSmallest]
  ]

TakeSmallestElements[list_?ListQ, n_ ? (PositiveIntegerQ[#]&), orderfun_
  ] :=
  Module[{positionSmallest},
    positionSmallest = PositionSmallest[list, n, orderfun];
    Extract[list, List /@ positionSmallest]
  ]

End[]; (* End `Private` *)

EndPackage[];
