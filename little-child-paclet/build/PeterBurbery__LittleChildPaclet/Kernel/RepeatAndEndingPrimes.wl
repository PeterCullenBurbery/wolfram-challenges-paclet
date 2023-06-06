BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`RepeatandEndingPrimes
Begin["`Private`"];

(* Define your public and private symbols here. *)
RepeatandEndingPrimes//ClearAll
RepeatandEndingPrimes[r_, e_] := 
 Select[PrimeQ]@
  Table[FromDigits[Join[ConstantArray[r, i], {e}]], {i, 30}]


End[]; (* End `Private` *)

EndPackage[];