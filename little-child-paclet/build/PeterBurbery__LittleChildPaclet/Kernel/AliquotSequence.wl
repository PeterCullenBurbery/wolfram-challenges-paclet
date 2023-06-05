BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AliquotSequence;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AliquotSequence // ClearAll
AliquotSequence[num_?PositiveIntegerQ] := 
 Catenate[
  FindTransientRepeat[
   NestWhileList[DivisorSigma[1, #] - # &, num, 
     DivisorSigma[1, #] - # != # &, 1, 99] /. {list___, 0} -> {list}, 
   2]]

End[]; (* End `Private` *)

EndPackage[];