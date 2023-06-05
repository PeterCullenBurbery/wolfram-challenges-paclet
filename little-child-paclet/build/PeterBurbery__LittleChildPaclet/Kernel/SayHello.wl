BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`SayHello

Begin["`Private`"];

(* Define your public and private symbols here. *)


SayHello[name_? StringQ] := "Hello " <> name <> "!";


End[]; (* End `Private` *)

EndPackage[];