BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CollatzLength;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CollatzLength//ClearAll
CollatzLength::usage="CollatzLength[n] gives the number of steps required to reach 1 from n using the Collatz function.";
SetAttributes[CollatzLength,Listable];
CollatzLength[_?PositiveIntegerQ] /; n > 0 := 
 Length@NestWhileList[If[EvenQ[#], Quotient[#, 2], 3 # + 1] &, 
   n, #1 != 1 &, 1, Infinity, -1]
CollatzLength[args___] :=
  Null /; CheckArguments[CollatzLength[args], {1,2}]
End[]; (* End `Private` *)

EndPackage[];