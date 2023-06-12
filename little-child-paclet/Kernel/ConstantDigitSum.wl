BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ConstantDigitSum;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ConstantDigitSum // ClearAll

ConstantDigitSum[m_ ? (PositiveIntegerQ[#]&), n_ ? (PositiveIntegerQ[
    #]&), s_ ? (PositiveIntegerQ[#]&)] :=
    Select[Total[IntegerDigits[#]] == s&][Range[m, n]]

End[]; (* End `Private` *)

EndPackage[];
