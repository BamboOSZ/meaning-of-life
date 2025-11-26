;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;                        Eye (O) Vesa System v1.0
;
;                     bY BamboOS of CruX 18.04.2000
;
;    תתתתתתתתשששששששש----======[Procedures]=====------שששששששששתתתתתתתתת
;
;     .oO  EVSChkMode   -  check Vesa mode
;           in:
;             ax = vesa Mode
;           out:
;             if carry then eax = ErrorCode
;
;     .oO  EVSInit      -  init EVS
;           in:
;             ax = vesa Mode
;           out:
;             nothing
;
;     .oO  EVSDeinit    -  deinit EVS (back to text 80x25)
;           in:
;             nothing
;           out:
;             nothing
;
;     .oO  EVSFindMode
;           in:
;             cx = Screen X
;             dx = Screen Y
;             bl = Color Depth
;           out:
;             if carry then eax = ErrorCode
;             else ax = vesa Mode
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[Extrns]=====------שששששששששתתתתתתתתת

Extrn EVSChkMode : proc   ;  \
Extrn EVSInit : proc      ;   \  Procedures
Extrn EVSDeinit : proc    ;   /
Extrn EVSFindMode : proc  ;  /

Extrn ScreenX : word      ; \
Extrn ScreenY : word      ;  \
Extrn ScrDepth : byte     ;   \
Extrn VesaOff : dword     ;    \ Variables
Extrn VesaSize : dword    ;    /
Extrn RPos : byte         ;   /
Extrn GPos : byte         ;  /
Extrn BPos : byte         ; /
Extrn APos : byte         ;/

Extrn EVSPrompt : byte    ; >   String '[EVS]

;    תתתתתתתתשששששששש----======[EoExtrns]=====------שששששששששתתתתתתתתת