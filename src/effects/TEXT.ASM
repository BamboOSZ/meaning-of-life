PutText         PROC
                call    SoundGetTimer
                sub     eax,LastVal
                mov     ValX,100
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   TFadeCounter
                mov     ecx,320*16
                mov     ebx,TFadeCounter
                mov     esi,TextsAdd
                call    Fade

                call    SoundGetTimer
                mov     LastVal,eax

                call    SoundGetPos
                xor     edx,edx
                mov     dl,ah
                shl     edx,2
                mov     edi,offset Texts
                add     edi,edx
                mov     esi,[edi]
                mov     edi,TextsAdd
                add     edi,8
                mov     ebp,offset Font
                call    WriteT

                mov     esi,TextsAdd
                mov     edi,BufferAdd
                add     edi,320*224*4
                mov     ecx,320*16
                xor     eax,eax
              Text2Screen:
                mov     al,[esi+ecx]
                mov     ah,al
                shl     eax,8
                mov     al,ah
                mov     [edi+ecx*4],eax
                lea     ecx,[ecx-1]
                test    ecx,ecx
                jnz     Text2Screen

                ret
PutText         ENDP