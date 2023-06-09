BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AntipodeAboveSeaLevelQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)
(*I saw how someone else solved this challenge so this isn't my idea.*)
AntipodeAboveSeaLevelQ // ClearAll
AntipodeAboveSeaLevelQ[loc_] := 
 GeoElevationData@GeoAntipode@loc > 0 Quantity@"m"
 AlmostPalindrome[args___] :=
  Null /; CheckArguments[AlmostPalindrome[args], 1]
End[]; (* End `Private` *)

EndPackage[];