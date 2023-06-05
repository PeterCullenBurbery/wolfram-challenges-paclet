BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`SameStartEndWords
Begin["`Private`"];

(* Define your public and private symbols here. *)
SameStartEndWords[char_?StringQ]:=WordListLookup[(char~~___~~char)|char]


End[]; (* End `Private` *)

EndPackage[];