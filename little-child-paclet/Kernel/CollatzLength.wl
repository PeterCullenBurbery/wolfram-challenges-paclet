BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CollatzLength;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CollatzLength//ClearAll
CollatzLength[_?PositiveIntegerQ] /; n > 0 := 
 Length@NestWhileList[If[EvenQ[#], Quotient[#, 2], 3 # + 1] &, 
   n, #1 != 1 &, 1, Infinity, -1]

End[]; (* End `Private` *)

EndPackage[];