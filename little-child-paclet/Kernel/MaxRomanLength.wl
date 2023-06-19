BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaxRomanLength

Begin["`Private`"];

(* Define your public and private symbols here. *)

MaxRomanLength[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    Max[StringLength[Array[RomanNumeral, n]]]

End[]; (* End `Private` *)

EndPackage[];
