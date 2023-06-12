BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CollatzLength;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CollatzLength // ClearAll

CollatzLength::usage = "CollatzLength[n] gives the number of steps required to reach 1 from n using the Collatz function.";

SetAttributes[CollatzLength, Listable];

CollatzLength[n_ ? (PositiveIntegerQ[#]&)] :=
  Length @ Collatz[n]

CollatzLength[args___] :=
  Null /; CheckArguments[CollatzLength[args], {1, 2}]

End[]; (* End `Private` *)

EndPackage[];
