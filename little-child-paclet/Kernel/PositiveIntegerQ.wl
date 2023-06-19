BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`PositiveIntegerQ

Begin["`Private`"];

(* Define your public and private symbols here. *)

PositiveIntegerQ // ClearAll

PositiveIntegerQ[n_] :=
    And @@ {IntegerQ[n], TrueQ[n \[Element] PositiveIntegers]}

End[]; (* End `Private` *)

EndPackage[];
