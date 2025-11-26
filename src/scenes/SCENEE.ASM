;bY BamboOS^CruX

                mov     ecx,320*240
                mov     edi,BufferAdd
                call    ClearB

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     FadeFlag,0

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE E]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              SceneELoop:

                mov     esi,offset mini
                mov     edi,BufferAdd
                add     edi,320*86*4+86*4
                mov     ecx,48
              PutEndLogoLoop:
                push    ecx
                mov     ecx,144
              PutEndLogoLoopIn:
                xor     eax,eax
                mov     al,[esi]
                mov     ah,al
                shl     eax,8
                mov     al,ah
                mov     [edi],eax
                lea     esi,[esi+1]
                lea     ecx,[ecx-1]
                lea     edi,[edi+4]
                test    ecx,ecx
                jnz     PutEndLogoLoopIn
                pop     ecx
                add     edi,176*4
                lea     ecx,[ecx-1]
                test    ecx,ecx
                jnz     PutEndLogoLoop

;        תתתתתתתתשששששששש----======[Fade In]=====------שששששששששתתתתתתתתת

                mov     ecx,320*200*4
                mov     ebx,100
                mov     esi,BufferAdd
                add     esi,320*20*4
                call    FadeIn

;       תתתתתתתתשששששששש----======[Fade Out]=====------שששששששששתתתתתתתתת

                mov     ecx,320*200*4
                mov     ebx,100
                mov     esi,BufferAdd
                add     esi,320*20*4
                mov     dx,1348h
                call    FadeOut

                mov     esi,BufferAdd      ; \
                Buffer2Screen              ;  = Put Buffer on Screen
                Inc     FrameCounter       ; /

                mov     ErrorCode,4+80000000h
                in      al,96
                cmp     al,1
                je      SError

                call    SoundGetPos
                cmp     ax,135dh
                jl      SceneELoop