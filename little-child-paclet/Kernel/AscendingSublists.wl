BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AscendingSublists;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AscendingSublists // ClearAll
AscendingSublists[list : {___Integer}] :=
 Select[Length[#] > 1 &][Split[list, Less]]
AlmostPalindrome[args___] :=
  Null /; CheckArguments[AlmostPalindrome[args], 1]
End[]; (* End `Private` *)

EndPackage[];