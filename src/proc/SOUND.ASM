;bY BamboOS^CruX

; thiz one for compatibility with other players

; Returns like in Cubic Tiny Gus Player


SoundPlay       PROC
                if UseMXM                ; P
                xor eax,eax              ; L
                call    xmpPlay_         ; A
                endif                    ; Y
                                         ; S
                if UseUsl                ; O
                mov     eax,offset TimerProc
                mov     ebx,TimerSpeed/70
                call    Timer_Start
                jc      SError
                mov     esi,offset Module; U
                call    USMP_StartPlay   ; N
                                         ; D
                mov     ErrorCode,7
                endif
                ret
SoundPlay       ENDP

if UseUsl
TimerProc       PROC
                Inc     TimerValue
                ret
TimerProc       ENDP
endif

SoundStop       PROC
                if UseMXM
                call    xmpStop_
                endif
                if UseUsl
                mov     ErrorCode,7
                call    USMP_StopPlay
                mov     eax,offset TimerProc
                call    Timer_Stop
                jc      SError
                endif
                ret
SoundStop       ENDP

; ret : timer in eax
SoundGetTimer   PROC
                if UseMXM
                call    xmpGetTimer_
                endif
                if UseUsl
                mov     eax,TimerValue
                endif
                ret
SoundGetTimer   ENDP

; ret : pos in ah and al
SoundGetPos     PROC
                if UseMXM
                call    xmpGetPos_
                endif
                if UseUsl
                push    bx
                mov     ax,_Order
                mov     bx,_Row
                shl     ax,8
                xchg    al,bl
                pop     bx
                endif
                ret
SoundGetPos     ENDP