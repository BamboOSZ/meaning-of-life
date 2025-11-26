;       תתתתתתתתשששששששש----======[Effects]=====------שששששששששתתתתתתתתת

                mov     edi,Tab4TAdd
                mov     ebx,2
                call    nTunel
                mov     edi,Tab5TAdd
                call    nTunel
                mov     edi,Tab6TAdd
                call    nTunel
                mov     edi,Tab7TAdd
                call    nTunel

;    תתתתתתתתשששששששש----======[Set Variables]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     TunelMov,0
                mov     TunelMov2,0
                mov     FadeFlag,0

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE 2]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              Scene2Loop:

; תתתתתתתתשששששששש----======[Bitmap Effects]=====------שששששששששתתתתתתתתת

                mov     esi,Tab4TAdd
                add     esi,640*4*100+160*4
                mov     ebx,100               ; sin X
                mov     ecx,5
                call    SinuSide
                shl     ValX,2
                add     esi,ValX
                mov     ebx,90                ; sin Y
                mov     ecx,6
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     esi,ValX

                mov     ebp,Tab5TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,80               ; sin X
                mov     ecx,4
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,70                ; sin Y
                mov     ecx,3
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     ebp,ValX

                mov     edi,Buffer2Add
                call    SubEff

                mov     ebp,Tab6TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,100               ; sin X
                mov     ecx,5
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,50                ; sin Y
                mov     ecx,4
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     ebp,ValX

                mov     esi,Buffer2Add
                mov     edi,Buffer2Add
                call    AddEff

                mov     ebp,Tab7TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,100               ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,90                ; sin Y
                mov     ecx,4
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     ebp,ValX

                mov     esi,Buffer2Add
                mov     edi,Buffer2Add
                call    SubEff

;     תתתתתתתתשששששששש----======[Lets Fun]=====------שששששששששתתתתתתתתת

                mov     ebp,Buffer2Add
                mov     esi,Textu0Add
                mov     edi,BufferAdd
                add     edi,320*4*20
                call    LetsFun

;    תתתתתתתתשששששששש----======[Modify Texture]=====------שששששששששתתתתתתתתת

                call    ModifyTexture

;       תתתתתתתתשששששששש----======[Rectangles]=====------שששששששששתתתתתתתתת

                mov     edi,offset Rects3
                call    PutRectS

;      תתתתתתתתשששששששש----======[Put Text]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ah,4
                je      @@NoT
                call    PutText
              @@NoT:
                NOLOCALS


;        תתתתתתתתשששששששש----======[Fade In]=====------שששששששששתתתתתתתתת

                mov     ecx,320*200*4
                mov     ebx,90
                mov     esi,BufferAdd
                add     esi,320*20*4
                call    FadeIn

;       תתתתתתתתשששששששש----======[Fade Out]=====------שששששששששתתתתתתתתת

                mov     ecx,320*200*4
                mov     ebx,150
                mov     esi,BufferAdd
                add     esi,320*20*4
                mov     dx,0330h
                call    FadeOut

;   תתתתתתתתשששששששש----======[Put All on Scr]=====------שששששששששתתתתתתתתת

                mov     esi,BufferAdd      ; \
                Buffer2Screen              ;  = Put Buffer on Screen
                Inc     FrameCounter       ; /

;     תתתתתתתתשששששששש----======[Ch4 4 Escape]=====------שששששששששתתתתתתתתת

                mov     ErrorCode,4+80000000h
                in      al,96
                cmp     al,1
                je      SError

;    תתתתתתתתשששששששש----======[Ch4 4 Eof Scene]=====------שששששששששתתתתתתתתת

                call    SoundGetPos
                cmp     ax,0400h
                jl      Scene2Loop