

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Bomber;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Bomber//ClearAll
Bomber[pts_?MatrixQ] := BoundingRegion[pts, "MinDisk"]

End[]; (* End `Private` *)

EndPackage[];