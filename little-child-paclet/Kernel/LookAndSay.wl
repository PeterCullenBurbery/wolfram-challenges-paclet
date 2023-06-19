BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`LookAndSay;

Begin["`Private`"];

(* Define your public and private symbols here. *)

LookAndSay // ClearAll

LookAndSay[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    FromDigits /@
        Flatten /@
            NestList[
                Function[list,
                    {Length[#], First[#]}& /@ Split[Flatten @ list]
                ]
                ,
                {1}
                ,
                n - 1
            ]

End[]; (* End `Private` *)

EndPackage[];
