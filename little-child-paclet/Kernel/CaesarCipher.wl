BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarCipher;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[CaesarCipher]

CaesarCipher::usage = "CaesarCipher[s] returns the string s with each letter shifted by 13 places in the alphabet. CaesarCipher[s, n] returns the string s with each letter shifted by n places in the alphabet. CaesarCipher[n] represents an operator form that may be applied to an expression."

SetAttributes[CaesarCipher, {Listable}]

CaesarCipher[s_ ? (StringQ[#]&)] :=
    CaesarCipher[s, 13]
CaesarCipher[s_ ? (StringQ[#]&),Language->Automatic] :=


    CaesarCipher[s, 13,Language->LanguageIdentify[s]]
    
CaesarCipher[s_ ? (StringQ[#]&), n_ ? (IntegerQ[#]&)] :=
    StringReplace[s, CaesarEncipherRules[n]]

CaesarCipher[n_ ? (IntegerQ[#]&)] :=
    OperatorApplied[CaesarCipher, {2, 1}][n]

CaesarCipher[args___] :=
    Null /; CheckArguments[CaesarCipher[args], 1]

End[]; (* End `Private` *)

EndPackage[];
