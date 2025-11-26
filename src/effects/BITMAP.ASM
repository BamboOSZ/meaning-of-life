;codeeed by baMBOos^crUX
;   תתתתתתתתשששששששש----======[Add 2 effects]=====------שששששששששתתתתתתתתת
; in
;  esi  -  Effect 1
;  ebp  -  Effect 2
;  edi  -  Buffer 2 Write
;
AddEff          PROC
                LOCALS
                mov     ecx,200
              @@Inte2ndTunel:
                push    ecx
                mov     ecx,320
              @@Inte2ndTunelIn:
                mov     eax,[ebp]
                mov     ebx,[esi]
                add     eax,ebx
                mov     [edi],eax
                lea     ecx,[ecx-1]
                lea     ebp,[ebp+4]
                lea     esi,[esi+4]
                lea     edi,[edi+4]
                test    ecx,ecx
                jnz     @@Inte2ndTunelIn
                pop     ecx
                lea     ecx,[ecx-1]
                lea     ebp,[ebp+320*4]
                lea     esi,[esi+320*4]
                lea     edi,[edi+320*4]
                test    ecx,ecx
                jnz     @@Inte2ndTunel
                NOLOCALS
                ret
AddEff          ENDP

;   תתתתתתתתשששששששש----======[Sub 2 effects]=====------שששששששששתתתתתתתתת
; in
;  esi  -  Effect 1
;  ebp  -  Effect 2
;  edi  -  Buffer 2 Write
;
SubEff          PROC
                LOCALS
                mov     ecx,200
              @@Inte2ndTunel:
                push    ecx
                mov     ecx,320
              @@Inte2ndTunelIn:
                mov     eax,[ebp]
                mov     ebx,[esi]
                sub     eax,ebx
                mov     [edi],eax
                lea     ecx,[ecx-1]
                lea     ebp,[ebp+4]
                lea     esi,[esi+4]
                lea     edi,[edi+4]
                test    ecx,ecx
                jnz     @@Inte2ndTunelIn
                pop     ecx
                lea     ecx,[ecx-1]
                lea     ebp,[ebp+320*4]
                lea     esi,[esi+320*4]
                lea     edi,[edi+320*4]
                test    ecx,ecx
                jnz     @@Inte2ndTunel
                NOLOCALS
                ret
SubEff          ENDP

; SinuSide
; in
;  ebx  -  amplitude
;  ecx  -  ferqency czy jakos tak :)
; out:
;  ValX -  Sinus
SinuSide        PROC
                call    SoundGetTimer
                mov     ValX,ebx
                fild    ValX
                mov     ValX,eax
                fild    ValX
                mov     ValX,ecx
                fild    ValX
                fdiv
                fild    TimerMax
                fdiv
                fsin
                fmul
                fistp   ValX
                ret
SinuSide        ENDP

; get screen 2 texure
; in : nothing
ModifyTexture   PROC
                LOCALS
                mov     edi,BufferAdd
                add     edi,60*4+320*4*20
                mov     esi,Textu0Add
                add     esi,256*28*4+28*4
                mov     ecx,200
              @@MTLoop:
                mov     edx,200
              @@MTLoopIn:
                mov     eax,[edi]
                mov     [esi],eax
                lea     edx,[edx-1]
                lea     edi,[edi+4]
                lea     esi,[esi+4]
                test    edx,edx
                jnz     @@MTLoopIn
                lea     ecx,[ecx-1]
                lea     edi,[edi+120*4]
                lea     esi,[esi+56*4]
                test    ecx,ecx
                jnz     @@MTLoop
                NOLOCALS
                ret
ModifyTexture   ENDP
