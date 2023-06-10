BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AverageElevation;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AverageElevation // ClearAll
AverageElevation::usage="AverageElevation[lat] returns the average elevation of the Earth at latitude lat."
AverageElevation[lat_?RealValuedNumericQ /; -90 <= lat <= 90] := 
 QuantityMagnitude@
  Round[Mean[
    GeoElevationData[GeoPosition[Array[{lat, #} &, 361, {-180, 180}]],
      "QuantityArray"]], 100]
AverageElevation[args___] :=
  Null /; CheckArguments[AverageElevation[args], 1]
End[]; (* End `Private` *)

EndPackage[];