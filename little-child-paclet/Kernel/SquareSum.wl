BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`SquareSum

Begin["`Private`"];

(* Define your public and private symbols here. *)

SquareSum[n_ ? (PositiveIntegerQ[#]&)] :=
    Fold[(#1 + #2) ^ 2&, 1, Rest @ Range @ n]

End[]; (* End `Private` *)

EndPackage[];
