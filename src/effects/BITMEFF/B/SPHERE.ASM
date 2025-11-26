;codee by me :)
;    תתתתתתתתשששששששש----======[Precalc Sphere]=====------שששששששששתתתתתתתתת
Sphere          PROC
                LOCALS
                mov     edx,400
              @@PrecLoopY:             ;       F P U   Status
                mov     ecx,640
              @@PrecLoopX:

                push    ecx
                push    edx
                lea     ecx,[ecx-320]
                cmp     ebx,1
                je      @@NoSub
                lea     edx,[edx-200]
              @@NoSub:

                mov     TSize,-90
                fild    TSize
                fldpi
                mov     TSize,500
                fild    TSize
                mov     ValX,ecx
                fild    ValX
                fmul    st,st
                mov     ValY,edx
                fild    ValY
                fmul    st,st
                fadd
                fsqrt
                fdiv
                fdiv

                fcos

                fdiv

                fistp   ValY
                shl     ValY,16
                mov     eax,ValY
                mov     dword ptr[edi],eax
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
Sphere          ENDP
;     תתתתתתתתשששששששש----======[Eo Sphere]=====------שששששששששתתתתתתתתת
