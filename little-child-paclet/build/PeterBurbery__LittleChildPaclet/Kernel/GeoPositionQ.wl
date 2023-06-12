BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`GeoPositionQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)

GeoPositionQ // ClearAll

GeoPositionQ::usage = "GeoPositionQ[pos] returns True when pos is a valid geo position."

GeoPositionQ[pos_] :=
    Quiet[MatchQ[Partition[Flatten[LatitudeLongitude[GeoPosition[pos]
        ]], {2}], {{Quantity[_, "AngularDegrees"], Quantity[_, "AngularDegrees"
        ]}...}] || ((Head[LatitudeLongitude[#]] === QuantityArray&)[pos])]

GeoPositionQ[args___] :=
    Null /; CheckArguments[GeoPositionQ[args], 1]

End[]; (* End `Private` *)

EndPackage[];
