BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecrypt;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[caesarrules, CaesarDecrypt]

caesarrules[n_] := caesarrules[n] =
  Join[Thread[CharacterRange["a", "z"] -> RotateRight[CharacterRange[
    "a", "z"], n]], Thread[CharacterRange["A", "Z"] -> RotateRight[CharacterRange[
    "A", "Z"], n]]];

CaesarDecrypt[s_?ListQ] :=
  CaesarDecrypt /@ s

CaesarDecrypt[s_?StringQ] :=
  CaesarDecrypt[s, 13]

CaesarDecrypt[s_?StringQ, n_?IntegerQ] :=
  StringReplace[s, caesarrules[n]]

CaesarDecrypt[s_?ListQ, n_?IntegerQ] :=
  CaesarDecrypt[#, n]& /@ s

CaesarDecrypt[n_?IntegerQ][s_?StringQ] :=
  CaesarDecrypt[s, n]

CaesarDecrypt[n_?IntegerQ][s_?ListQ] :=
  CaesarDecrypt[#, n]& /@ s

End[]; (* End `Private` *)

EndPackage[];
