;CODE By bAMBOos^CruX
;    תתתתתתתתשששששששש----======[Precalc Tunel]=====------שששששששששתתתתתתתתת

Tunel           PROC
                LOCALS
                mov     edx,400
              @@PrecLoopY:             ;       F P U   Status
                mov     ecx,640
              @@PrecLoopX:

                push    ecx
                push    edx
                lea     ecx,[ecx-320]
                lea     edx,[edx-200]
                mov     TSize,15000
                fild    TSize
                mov     ValX,ecx        ;
                fild    ValX            ;  VX   |      |
                fmul    st,st           ;  VX‎  |      |
                mov     ValY,edx        ;
                fild    ValY            ;  VY   | VX‎  |
                fmul    st,st           ;  VY‎  | VX‎  |
                fadd                    ; Y‎+X‎ |      |
                fabs                    ;  ____
                fsqrt                   ; ûY‎+X‎|
                fdiv
                mov     ValY,65536
                fild    ValY
                fmul
                fistp   dword ptr[edi]
                pop     edx
                pop     ecx

                lea     edi,[edi+4]     ;   Make Loop
                lea     ecx,[ecx-1]     ;
                test    ecx,ecx
                jnz     @@PrecLoopX    ;
                lea     edx,[edx-1]     ;
                test    edx,edx
                jnz     @@PrecLoopY    ;
                NOLOCALS
                ret
Tunel           ENDP
;      תתתתתתתתשששששששש----======[Eo Tunel]=====------שששששששששתתתתתתתתת
