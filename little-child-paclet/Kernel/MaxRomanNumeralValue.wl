BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue

Begin["`Private`"];

(* Define your public and private symbols here. *)

MaxRomanNumeralValue[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    TakeLargestElements[Array[RomanNumeral, n], 1, Order[StringLength[
        #1], StringLength[#2]]&]

End[]; (* End `Private` *)

EndPackage[];
