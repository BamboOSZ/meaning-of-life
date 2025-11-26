;coode by bamboos of cruX
;    תתתתתתתתשששששששש----======[Precalc Lands]=====------שששששששששתתתתתתתתת

Land            PROC
                LOCALS
                mov     edx,400
              @@PrecLoopY:             ;       F P U   Status
                mov     ecx,640
              @@PrecLoopX:

                push    ecx
                push    edx
                lea     ecx,[ecx-320]
                lea     edx,[edx-200]
                mov     TSize,30000
                fild    TSize
                mov     ValY,edx        ;
                fild    ValY            ;  VY   | VX‎  |
                fabs                    ;  ____
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
Land            ENDP
;    תתתתתתתתשששששששש----======[Eo Lands]=====------שששששששששתתתתתתתתת
