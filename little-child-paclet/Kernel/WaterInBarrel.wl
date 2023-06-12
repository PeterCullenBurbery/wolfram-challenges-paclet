BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

WaterInBarrel[R_, L_, h_] /; 0 <= h <= 2 R && L >= 0 :=
    RegionMeasure[RegionIntersection[Cuboid[{-R, -R, 0}, {R, h - R, L
        }], Cylinder[{{0, 0, 0}, {0, 0, L}}, R]]]

End[]; (* End `Private` *)

EndPackage[];
