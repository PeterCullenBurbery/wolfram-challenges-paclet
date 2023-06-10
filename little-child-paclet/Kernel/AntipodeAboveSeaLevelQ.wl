BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AntipodeAboveSeaLevelQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)
(*I saw how someone else solved this challenge so this isn't my idea.*)
AntipodeAboveSeaLevelQ // ClearAll
AntipodeAboveSeaLevelQ::usage="AntipodeAboveSeaLevelQ[loc] returns True if the antipode of loc is above sea level, False otherwise."
AntipodeAboveSeaLevelQ[loc_] := 
 GeoElevationData@GeoAntipode@loc > 0 Quantity@"m"
 AntipodeAboveSeaLevelQ[args___] :=
  Null /; CheckArguments[AntipodeAboveSeaLevelQ[args], 1]
End[]; (* End `Private` *)

EndPackage[];