BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecipher;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[CaesarDecipher]

SetAttributes[CaesarDecipher, {Listable}]

CaesarDecipher::usage = "CaesarDecipher[s] decrypts the string s using the Caesar cipher with a shift of 13. CaesarDecipher[s, n] decrypts the string s using the Caesar cipher with a shift of n. CaesarDecipher[{s1,s2,...},n] deciphers each string si. CaesarDecipher[n] represents an operator form that can be applied to an expression."

(* CaesarDecipher[s_?ListQ] :=
  CaesarDecipher /@ s *)(*The function is Listable so this isn't needed.*)

CaesarDecipher[s_?StringQ] :=
  CaesarDecipher[s, 13]

CaesarDecipher[s_?StringQ, n_ ? (IntegerQ[#]&)] :=
  StringReplace[s, CaesarDecipherRules[n]]

(* CaesarDecipher[s_?ListQ, n_?(IntegerQ[#]&)] :=
  CaesarDecipher[#, n]& /@ s *)(*The function is Listable so this isn't needed.*)

CaesarDecipher[n_ ? (IntegerQ[#]&)] :=
  OperatorApplied[CaesarDecipher, {2, 1}][n]

(* CaesarDecipher[n_?(IntegerQ[#]&)][s_?ListQ] :=
  CaesarDecipher[#, n]& /@ s *) (*The function is Listable so this isn't needed.*)

CaesarDecipher[args___] :=
  Null /; CheckArguments[CaesarDecipher[args], {1, 2}]

End[]; (* End `Private` *)

EndPackage[];
