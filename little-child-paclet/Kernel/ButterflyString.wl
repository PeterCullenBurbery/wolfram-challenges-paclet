BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)
ClearAll[ButterflyString]
ButterflyString::usage="ButterflyString[input] returns the input string with its reverse appended to it."
SetAttributes[ButterflyString,{Listable}]
ButterflyString[input_?StringQ]:=StringJoin[input,StringReverse[input]]
ButterflyString[args___] :=
  Null /; CheckArguments[ButterflyString[args], 1]

End[]; (* End `Private` *)

EndPackage[];