;       תתתתתתתתשששששששש----======[Effects]=====------שששששששששתתתתתתתתת

                mov     edi,Tab4TAdd
                call    Tunel
                mov     edi,Tab5TAdd
                mov     ebx,0
                call    Sphere
                mov     edi,Tab6TAdd
                call    Tunel
                mov     edi,Tab7TAdd
                call    Land

;    תתתתתתתתשששששששש----======[Set Variables]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     LastVR,eax
                mov     TunelMov,0
                mov     TunelMov2,0
                mov     FadeFlag,0
                mov     CorX,-160
                mov     CorY,120
                mov     CorZ,400
                mov     AngXf,0
                mov     AngYf,0
                mov     AngZf,0
                mov     Timer1,0
                mov     Timer2,0

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE 3]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              Scene3Loop:

; תתתתתתתתשששששששש----======[Bitmap Effects]=====------שששששששששתתתתתתתתת

                mov     esi,Tab4TAdd
                add     esi,640*4*100+160*4
                mov     ebx,150                ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     esi,ValX
                mov     ebx,100                ; sin Y
                mov     ecx,4
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     esi,ValX

                mov     ebp,Tab5TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,120               ; sin X
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
                mov     ebx,160                ; sin X
                mov     ecx,5
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,60                ; sin Y
                mov     ecx,2
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     ebp,ValX

                mov     esi,Buffer2Add
                mov     edi,Buffer2Add
                call    SubEff

                mov     ebp,Tab7TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,150               ; sin X
                mov     ecx,2
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,90                ; sin Y
                mov     ecx,3
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
                mov     esi,Textu2Add
                mov     edi,BufferAdd
                add     edi,320*4*20
                call    LetsFun

;   תתתתתתתתשששששששש----======[Mov CPS]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ax,0700h
                jg      @@No
                cmp     ax,0600h
                jl      @@No
                cmp     Timer1,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer1,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer1
                mov     ValX,50
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                add     CorX,eax
                cmp     CorX,160
                jl      @@No
                mov     CorX,160
              @@No:
                NOLOCALS

              przertrsaadfad:

                LOCALS
                call    SoundGetPos
                cmp     ax,0730h
                jl      @@No
                cmp     Timer2,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer2,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer2
                mov     ValX,100
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                add     CorX,eax
                cmp     CorX,480
                jl      @@No
                mov     CorX,480
              @@No:
                NOLOCALS

;  תתתתתתתתשששששששש----======[Jump Sphere]=====------שששששששששתתתתתתתתת

                LOCALS
                mov     CorZ,350
                call    SoundGetPos
                cmp     ah,06h
                jne     @@ttyy
                mov     ecx,12
                mov     edi,offset scene2f
                repne   scasb
                jne     @@ttyy
                mov     CorZ,300
                @@ttyy:
                NOLOCALS

;        תתתתתתתתשששששששש----======[Rotates]=====------שששששששששתתתתתתתתת

                mov     esi,SphereAdd
                mov     edi,CPSDAdd
                mov     ebx,12               ; Angle X 
                mov     ecx,25               ; Angle Y 
                mov     edx,7                ; Angle Z 
                call    Rotate

;          תתתתתתתתשששששששש----======[CPS]=====------שששששששששתתתתתתתתת
;                           CruX's Particle System

                mov     esi,CPSDAdd
                call    CPSDraw

;       תתתתתתתתשששששששש----======[Rectangles]=====------שששששששששתתתתתתתתת

                mov     edi,offset Rects1
                call    PutRectS

;      תתתתתתתתשששששששש----======[Put Text]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ah,8
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
                mov     dx,0730h
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
                cmp     ax,0800h
                jl      Scene3Loop