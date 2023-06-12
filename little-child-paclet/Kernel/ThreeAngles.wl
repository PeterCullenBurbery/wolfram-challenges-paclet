
BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`ThreeAngles

Begin["`Private`"];

(* Define your public and private symbols here. *)
ClearAll[ThreeAngles]

ThreeAngles@{p_, q_, r_} := 
 Sort[PolygonAngle[
    Polygon[{{1, 2, 0}, {2, 1, 0}, {0, 1, 2}}]] 180/\[Pi]]



End[]; (* End `Private` *)

EndPackage[];