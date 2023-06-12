BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarEncipherRules;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CaesarEncipherRules // ClearAll

SetAttributes[CaesarEncipherRules, Listable];

Options[CaesarEncipherRules] = {Language -> "English"};

CaesarEncipherRules::usage = "CaesarEncipherRules[n] gives the rules to encipher a string with the Caesar cipher for a shift of n.";

CaesarEncipherRules[n_ ? (IntegerQ[#]&), OptionsPattern[]] := CaesarEncipherRules[
    n] =
    Join[Thread[Alphabet[OptionValue[Language]] -> RotateLeft[Alphabet[
        OptionValue[Language]], n]], Thread[ToUpperCase[Alphabet[OptionValue[
        Language]]] -> RotateLeft[ToUpperCase[Alphabet[OptionValue[Language]]
        ], n]]];

CaesarEncipherRules[args___] :=
    Null /; CheckArguments[CaesarEncipherRules[args], {1, 1}]

End[]; (* End `Private` *)

EndPackage[];
