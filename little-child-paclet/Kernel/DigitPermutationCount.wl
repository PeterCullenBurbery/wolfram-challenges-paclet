BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`DigitPermutationCount;

Begin["`Private`"];

(* Define your public and private symbols here. *)

DigitPermutationCount//ClearAll
DigitPermutationCount[number_Integer?Positive] := 
 Multinomial @@ Values[Counts[IntegerDigits[number]]]

End[]; (* End `Private` *)

EndPackage[];