BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AntipodeAboveSeaLevelQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)
(*I saw how someone else solved this challenge so this isn't my idea.*)
AntipodeAboveSeaLevelQ // ClearAll
AntipodeAboveSeaLevelQ[loc_] := 
 GeoElevationData@GeoAntipode@loc > 0 Quantity@"m"
End[]; (* End `Private` *)

EndPackage[];