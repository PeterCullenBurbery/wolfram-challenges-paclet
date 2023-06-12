BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`DigitCountPi;

Begin["`Private`"];

(* Define your public and private symbols here. *)

DigitCountPi // ClearAll

DigitCountPi[n_?PositiveIntegerQ] :=
    BinCounts[First[RealDigits[Pi, 10, n]], {0, 10, 1}]

End[]; (* End `Private` *)

EndPackage[];
