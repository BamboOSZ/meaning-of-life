;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;       UniversE GrafX Engine v0.8ב on VESA
;
;       bY BamboOS of UniversE 21.12.1999
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[Extrns]=====------שששששששששתתתתתתתתת

Extrn UXEChkMode : proc   ;  \
Extrn UXEInit : proc      ;   \  Procedures
Extrn UXEDeinit : proc    ;   /
Extrn UXEFindMode : proc  ;  /

Extrn ScreenX : word      ; \
Extrn ScreenY : word      ;  \
Extrn ScrDepth : byte     ;   \
Extrn VesaOff : dword     ;    \ Variables
Extrn VesaSize : dword    ;    /
Extrn RPos : byte         ;   /
Extrn GPos : byte         ;  /
Extrn BPos : byte         ; /
Extrn APos : byte         ;/

Extrn UXEPrompt : byte    ; >   String '[UXE]

;    תתתתתתתתשששששששש----======[EoExtrns]=====------שששששששששתתתתתתתתת