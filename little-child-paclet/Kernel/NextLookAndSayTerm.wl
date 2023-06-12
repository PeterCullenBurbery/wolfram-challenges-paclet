BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

LookAndSay[
        n_ ?
            (
                Function[{number},
                    NonNegativeIntegerQ[number]
                ]
            )
    ] /;  :=
    FromDigits[Flatten[{Length[#], First[#]}& /@ Split[IntegerDigits[
        n]]]]

End[]; (* End `Private` *)

EndPackage[];
