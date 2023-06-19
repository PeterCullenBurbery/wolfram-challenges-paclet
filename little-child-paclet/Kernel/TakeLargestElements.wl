BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`TakeLargestElements

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[TakeLargestElements]

TakeLargestElements[list_ ? (ListQ[#]&)] :=
  Module[{positionLargest},
    positionLargest = PositionLargest[list];
    Extract[list, List /@ positionLargest]
  ]

TakeLargestElements[list_ ? (ListQ[#]&), n_ ? (Function[{x}, PositiveIntegerQ[
  x], {}])] :=
  Module[{positionLargest},
    positionLargest = PositionLargest[list, n];
    Extract[list, List /@ positionLargest]
  ]

TakeLargestElements[list_ ? (ListQ[#]&), n_ ? (Function[{x}, PositiveIntegerQ[
  x], {}]), orderfun_] :=
  Module[{positionLargest},
    positionLargest = PositionLargest[list, n, orderfun];
    Extract[list, List /@ positionLargest]
  ]

End[]; (* End `Private` *)

EndPackage[];
