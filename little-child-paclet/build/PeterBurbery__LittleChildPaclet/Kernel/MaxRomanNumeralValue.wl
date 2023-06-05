BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`MaxRomanNumeralValue
Begin["`Private`"];

(* Define your public and private symbols here. *)
MaxRomanNumeralValue[n_?PositiveIntegerQ]:=Module[{data},data=Array[RomanNumeral,n];Extract[data,List/@PositionLargest[data,1,Order[StringLength[#1],StringLength[#2]]&]]]


End[]; (* End `Private` *)

EndPackage[];