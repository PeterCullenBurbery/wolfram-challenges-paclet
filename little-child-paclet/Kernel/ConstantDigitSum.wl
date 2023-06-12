BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ConstantDigitSum;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ConstantDigitSum // ClearAll

ConstantDigitSum::usage = "ConstanDigitSum[m,n,s] returns all integers in the range m to n whose digits sum to s."

ConstantDigitSum[m_ ? (PositiveIntegerQ[#]&), n_ ? (PositiveIntegerQ[
    #]&), s_ ? (PositiveIntegerQ[#]&)] :=
    Select[Total[IntegerDigits[#]] == s&][Range[m, n]]

ConstantDigitSum[args___] :=
    Null /; CheckArguments[ConstantDigitSum[arguments], {3, 3}]

End[]; (* End `Private` *)

EndPackage[];
