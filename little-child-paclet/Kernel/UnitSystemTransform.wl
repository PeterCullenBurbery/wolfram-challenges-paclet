BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`TwoAndThreePointers;

Begin["`Private`"];

(* Define your public and private symbols here. *)

TwoAndThreePointers[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    Sort[Sort /@ IntegerPartitions[n, All, {2, 3}]]

End[]; (* End `Private` *)

EndPackage[];
