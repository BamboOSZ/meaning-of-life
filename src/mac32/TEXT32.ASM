;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;       UniversE Demo System 32 v0.3ב
;
;       bY BamboOS of CruX 19.12.1999
;
;       MacrosList
;        w32  TextTab                 ---    write text on screen
;        cts                          ---    Clear Text Screen
;        wnum Num,Tab                 ---    Convert Number 2 String
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;       תתתתתתתתשששששששש----======[Macs]=====------שששששששששתתתתתתתתת

w32     MACRO TextTab
        push edx
        mov  edx,offset TextTab  ; get offset of message in protected mode
        call w32p
        pop  edx
        ENDM

wnum    MACRO Num,Tab
        pusha
        push ds
        pop  es
        mov  edi,offset Tab
        mov  ax,Num
        call wnump
        popa
        ENDM

w3n     MACRO Num
        wnum Num,NumTab
        w32  NumTab
        ENDM
w3h             MACRO eaxval
                pusha
                mov     edi,offset NumTab
                mov     eax,eaxval
                call    Hex2Str
                w32     NumTab
                popa
                ENDM

;     תתתתתתתתשששששששש----======[EoMacs]=====------שששששששששתתתתתתתתת
