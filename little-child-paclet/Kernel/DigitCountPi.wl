BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`DigitCountPi;

Begin["`Private`"];

(* Define your public and private symbols here. *)

DigitCountPi // ClearAll

DigitCountPi[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    BinCounts[First[RealDigits[Pi, 10, n]], {0, 10, 1}]
DigitalCountPi[args___]:=Null/;CheckArguments[]
End[]; (* End `Private` *)

EndPackage[];
