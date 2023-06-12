BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecipherRules;

Begin["`Private`"];

(* Define your public and private symbols here. *)

CaesarDecipherRules // ClearAll

SetAttributes[CaesarDecipherRules, Listable];

CaesarDecipherRules::usage = "CaesarDecipherRules[n] gives the rules to decipher a string with the Caesar cipher for a shift of n.";

Options[CaesarDecipherRules] = {Language -> "English"};

CaesarDecipherRules[n_?(IntegerQ[#]&), OptionsPattern[]] := CaesarDecipherRules[n] =
    Join[Thread[Alphabet[OptionValue[Language]] -> RotateRight[Alphabet[
        OptionValue[Language]], n]], Thread[ToUpperCase[Alphabet[OptionValue[
        Language]]] -> RotateRight[ToUpperCase[Alphabet[OptionValue[Language]
        ]], n]]];


CaesarDecipherRules[args___] :=
    Null /; CheckArguments[CaesarDecipherRules[args], {1, 1}]

End[]; (* End `Private` *)

EndPackage[];
