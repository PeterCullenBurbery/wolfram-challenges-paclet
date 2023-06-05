BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`NonNegativeIntegerQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)

NonNegativeIntegerQ[n_]:=TrueQ[n\[Element]NonNegativeIntegers]


End[]; (* End `Private` *)

EndPackage[];