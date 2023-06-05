BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`WordListLookup;

Begin["`Private`"];

(* Define your public and private symbols here. *)

WordListLookup[stringpattern_?(StringPatternQ)]:=Select[StringMatchQ[stringpattern]][WordList[]]
End[]; (* End `Private` *)

EndPackage[];