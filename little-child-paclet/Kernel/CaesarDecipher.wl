BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecipher;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[caesarrules, CaesarDecipher]

SetAttributes[CaesarDecipher, {Listable}]

caesarrules[n_] := caesarrules[n] =
  Join[Thread[CharacterRange["a", "z"] -> RotateRight[CharacterRange[
    "a", "z"], n]], Thread[CharacterRange["A", "Z"] -> RotateRight[CharacterRange[
    "A", "Z"], n]]];

CaesarDecipher::usage = "CaesarDecipher[s] decrypts the string s using the Caesar cipher with a shift of 13. CaesarDecipher[s, n] decrypts the string s using the Caesar cipher with a shift of n. CaesarDecipher[n][s] decrypts the string s using the Caesar cipher with a shift of n."

(* CaesarDecipher[s_?ListQ] :=
  CaesarDecipher /@ s *)

CaesarDecipher[s_?StringQ] :=
  CaesarDecipher[s, 13]

CaesarDecipher[s_?StringQ, n_?IntegerQ] :=
  StringReplace[s, caesarrules[n]]

(* CaesarDecipher[s_?ListQ, n_?IntegerQ] :=
  CaesarDecipher[#, n]& /@ s *)

CaesarDecipher[n_?IntegerQ][s_?StringQ] :=
  CaesarDecipher[s, n]

(* CaesarDecipher[n_?IntegerQ][s_?ListQ] :=
  CaesarDecipher[#, n]& /@ s *)

CaesarDecipher[args___] :=
  Null /; CheckArguments[CaesarDecipher[args], {1, 2}]

End[]; (* End `Private` *)

EndPackage[];
