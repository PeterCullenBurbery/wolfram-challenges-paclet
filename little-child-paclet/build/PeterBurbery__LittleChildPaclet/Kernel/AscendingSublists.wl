BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AscendingSublists;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AscendingSublists // ClearAll

AscendingSublists::usage = "AscendingSublists[vector] finds the maximal ascending sublists of at least two contiguous elements in the given unsorted list vector."

AscendingSublists[list : {___?IntegerQ}] :=
  Select[Length[#] > 1&][Split[list, Less]]

AscendingSublists[args___] :=
  Null /; CheckArguments[AscendingSublists[args], 1]

End[]; (* End `Private` *)

EndPackage[];
