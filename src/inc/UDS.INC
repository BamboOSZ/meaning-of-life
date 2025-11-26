;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;       UniversE Demo System 32 v0.6ב
;
;       bY BamboOS of CruX 21.02.2000
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;    תתתתתתתתשששששששש----======[Externals]=====------שששששששששתתתתתתתתת

Include Mac32\Mac32.Inc
Extrn  w32p : proc
Extrn  wnump : proc
Extrn  Hex2Str : proc

Extrn  UDSPrompt : byte
Extrn  Ln : byte
Extrn  NumTab : byte
Extrn  RegOff : dword

extrn   _eax:dword, _ebx:dword, _ecx:dword, _edx:dword
extrn   _esi:dword, _edi:dword, _ebp:dword
extrn   _ah:byte,   _al:byte,   _bh:byte, _bl:byte
extrn   _ch:byte,   _cl:byte,   _dh:byte, _dl:byte
extrn   _ax:word,   _bx:word,   _cx:word, _dx:word
extrn   _si:word,   _di:word,   _bp:word
extrn   _ds:word,   _es:word,   _fs:word, _gs:word

;   תתתתתתתתשששששששש----======[EoExternals]=====------שששששששששתתתתתתתתת