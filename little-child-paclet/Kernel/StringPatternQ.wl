BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`StringPatternQ

Begin["`Private`"];

(* Define your public and private symbols here. *)

Internal`ArgumentCountRegistry[StringPatternQ] ^= {1, 1}

StringPatternQ[_String] :=
    True

StringPatternQ[GeneralUtilities`Strings`PackagePrivate`x_] :=
    GeneralUtilities`Strings`PackagePrivate`spq[GeneralUtilities`Strings`PackagePrivate`x
        ]

Developer`Private`LHS$_StringPatternQ :=
    RuleCondition[
        Developer`CheckArgumentCount[Developer`Private`LHS$, 1, 1];
        Fail
    ]

End[]; (* End `Private` *)

EndPackage[];
