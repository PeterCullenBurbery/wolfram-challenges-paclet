BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`FlipPrimeQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)

FlipPrimeQ//ClearAll
FlipPrimeQ[n_?PositiveIntegerQ] := 
 ContainsNone[{4, 6, 7, 9}][IntegerDigits[n]] && 
  PrimeQ[FromDigits[IntegerDigits[n] /. {2 -> 5, 5 -> 2}]]

End[]; (* End `Private` *)

EndPackage[];