BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecrypt;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[caesarrules, CaesarDecrypt]
SetAttributes[CaesarDecrypt, {Listable}]
caesarrules[n_] := caesarrules[n] =
  Join[Thread[CharacterRange["a", "z"] -> RotateRight[CharacterRange[
    "a", "z"], n]], Thread[CharacterRange["A", "Z"] -> RotateRight[CharacterRange[
    "A", "Z"], n]]];
CaesarDecrypt::usage="CaesarDecrypt[s] decrypts the string s using the Caesar cipher with a shift of 13. CaesarDecrypt[s, n] decrypts the string s using the Caesar cipher with a shift of n. CaesarDecrypt[n][s] decrypts the string s using the Caesar cipher with a shift of n."
(* CaesarDecrypt[s_?ListQ] :=
  CaesarDecrypt /@ s *)

CaesarDecrypt[s_?StringQ] :=
  CaesarDecrypt[s, 13]

CaesarDecrypt[s_?StringQ, n_?IntegerQ] :=
  StringReplace[s, caesarrules[n]]

(* CaesarDecrypt[s_?ListQ, n_?IntegerQ] :=
  CaesarDecrypt[#, n]& /@ s *)

CaesarDecrypt[n_?IntegerQ][s_?StringQ] :=
  CaesarDecrypt[s, n]

(* CaesarDecrypt[n_?IntegerQ][s_?ListQ] :=
  CaesarDecrypt[#, n]& /@ s *)
CaesarDecrypt[args___] :=
  Null /; CheckArguments[CaesarDecrypt[args],{1,2}]
End[]; (* End `Private` *)

EndPackage[];
