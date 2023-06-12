BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Bomber;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Bomber // ClearAll

Bomber::usage = "Bomber[pts] returns the smallest disk that contains all the points in pts."

Bomber[pts_?MatrixQ] :=
    BoundingRegion[pts, "MinDisk"]

Bomber[args___] :=
    Null /; CheckArguments[Bomber[args], 1]

End[]; (* End `Private` *)

EndPackage[];
