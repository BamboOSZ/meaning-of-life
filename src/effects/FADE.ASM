;code bY BamboOS of UniversE 2k

; Fade

; in esi - buffer
;    ebx - fadeval
;    ecx - size
Fade            PROC
                xor     eax,eax
              FadeInLoop:
                mov     al,[esi+ecx]
                sub     eax,ebx
                test    eax,80000000h
                je      FIOki
                xor     eax,eax
              FIOki:
                mov     [esi+ecx],al
                lea     ecx,[ecx-1]
                test    ecx,ecx
                jnz     FadeInLoop
                mov     al,[esi+ecx]
                sub     eax,ebx
                test    eax,80000000h
                je      FIOki2
                xor     eax,eax
              FIOki2:
                mov     [esi+ecx],al
                ret
Fade            ENDP

; in ebx - fadein multiple
;    esi - buffer 2 fade
;    ecx - buffer size in bytes

FadeIn          PROC
                cmp     FadeFlag,0
                jg      FadeInNeverAgain

                call    SoundGetTimer
                sub     eax,TimerS

                mov     ValX,ebx
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   FadeCounter
                mov     ebx,FadeCounter
                mov     eax,255
                sub     eax,ebx
                cmp     eax,0
                jl      NoFadeIn

                mov     ebx,eax
                call    Fade
              FadeInNeverAgain:
                ret
              NoFadeIn:
                mov     FadeFlag,1
                ret
FadeIn          ENDP

; ebx - fadeout multipler
; esi - buffer to fade out
; ecx - buffer size in bytes
;  dh - module pos
;  dl /

FadeOut         PROC
                cmp     FadeFlag,2
                je      FadeOutNow
                call    SoundGetPos
                cmp     ax,dx
                jl      NoFadeDown
                mov     FadeFlag,2
                call    SoundGetTimer
                mov     TimerE,eax
              FadeOutNow:
                call    SoundGetTimer
                sub     eax,TimerE
                mov     ValX,ebx
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   FadeCounter
                mov     ebx,FadeCounter
                call    Fade
              NoFadeDown:
                ret
FadeOut         ENDP