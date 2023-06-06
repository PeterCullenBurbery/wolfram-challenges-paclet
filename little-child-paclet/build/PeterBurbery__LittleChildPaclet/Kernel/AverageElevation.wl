BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AverageElevation;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AverageElevation // ClearAll
AverageElevation[lat_ /; -90 <= lat <= 90] := 
 QuantityMagnitude@
  Round[Mean[
    GeoElevationData[GeoPosition[Array[{lat, #} &, 361, {-180, 180}]],
      "QuantityArray"]], 100]

End[]; (* End `Private` *)

EndPackage[];