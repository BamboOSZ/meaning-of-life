;CODE By bAMBOos^CruX
;    תתתתתתתתשששששששש----======[Precalc Waves]=====------שששששששששתתתתתתתתת

Waves           PROC
                LOCALS
                mov     edx,400
              @@PrecLoopY:             ;       F P U   Status
                mov     ecx,640
              @@PrecLoopX:

                push    ecx
                push    edx
                lea     ecx,[ecx-320]
                lea     edx,[edx-200]

                mov     TSize,128       ;  st0     1      2      3
                fild    TSize           ;  TSiz |      |      |      |
                fldpi                   ;  ד    |      |      |      |
                fdiv                    ; TS/ד  |      |      |      |
                mov     ValX,ecx        ;       |      |      |      |
                fild    ValX            ;  ValX | TS/ד |      |      |
                mov     ValY,edx        ;       |      |      |      |
                fild    ValY            ;  ValY | ValX | TS/ד |      |
                fpatan                  ;  ATan | TS/ד |
                fmul                    ;  AT/T |      |
                                        ;  OfTX | - ready offset of texture
                fsin

                mov     ValY,65536
                fild    ValY
                fmul
                fistp   dword ptr[edi]
                pop     edx
                pop     ecx

                lea     edi,[edi+4]     ;   Make Loop
                lea     ecx,[ecx-1]
                test    ecx,ecx
                jnz     @@PrecLoopX
                lea     edx,[edx-1]
                test    edx,edx
                jnz     @@PrecLoopY
                NOLOCALS
                ret
Waves           ENDP
;     תתתתתתתתשששששששש----======[Eo  Waves]=====------שששששששששתתתתתתתתת
