BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AntipodalCity::usage = "AntipodalCity[city] returns the antipodal city of city.";

Begin["`Private`"];

(* Define your public and private symbols here. *)

AntipodalCity // ClearAll

AntipodalCity::"usage" = "AntipodalCity[pos] finds the city that is closest to the antipode of pos on Earth.";

AntipodalCity[loc_?GeoPositionQ] :=
  GeoNearest["City", GeoAntipode @ loc][[1]]

AntipodalCity[args___] :=
  Null /; CheckArguments[AntipodalCity[args], 1]

End[]; (* End `Private` *)

EndPackage[];
