;       תתתתתתתתשששששששש----======[Effects]=====------שששששששששתתתתתתתתת

                mov     edi,Tab4TAdd
                call    Tunel
                mov     edi,Tab5TAdd
                call    Tunel
                mov     edi,Tab6TAdd
                call    Tunel
                mov     edi,Tab7TAdd
                mov     ebx,1
                call    nTunel

;    תתתתתתתתשששששששש----======[Set Variables]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     LastVR,eax
                mov     TunelMov,0
                mov     TunelMov2,0
                mov     FadeFlag,0
                mov     CorX,60
                mov     CorY,-100
                mov     CorZ,600
                mov     AngXf,0
                mov     AngYf,0
                mov     AngZf,0
                mov     Timer1,0
                mov     Timer2,0

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE 4]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              Scene4Loop:

;   תתתתתתתתשששששששש----======[Move Some Things]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                sub     eax,TimerS
                mov     ValX,100
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                mov     TunelMov2,al

; תתתתתתתתשששששששש----======[Bitmap Effects]=====------שששששששששתתתתתתתתת

                mov     esi,Tab4TAdd
                add     esi,640*4*100+160*4
                mov     ebx,100                ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     esi,ValX
                mov     ebx,60                ; sin Y
                mov     ecx,2
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     esi,ValX

                mov     ebp,Tab5TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,110               ; sin X
                mov     ecx,4
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,30                ; sin Y
                mov     ecx,3
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     ebp,ValX

                mov     edi,Buffer2Add
                call    AddEff

                mov     ebp,Tab6TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,50                ; sin X
                mov     ecx,5
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,50                ; sin Y
                mov     ecx,2
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
                mov     ebx,40               ; sin X
                mov     ecx,2
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

                mov     esi,Buffer2Add
                mov     edi,Buffer2Add
                call    SubEff

;     תתתתתתתתשששששששש----======[Lets Fun]=====------שששששששששתתתתתתתתת

                mov     ebp,Buffer2Add
                mov     esi,Textu1Add
                mov     edi,BufferAdd
                add     edi,320*4*20
                call    LetsFun

;   תתתתתתתתשששששששש----======[Mov CPS]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ah,08h
                jne     @@No
                cmp     Timer1,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer1,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer1
                mov     ValX,30
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                add     CorY,eax
                cmp     CorY,85
                jl      @@No
                mov     CorY,85
              @@No:
                NOLOCALS

              przertrsaadfad2:

                LOCALS
                call    SoundGetPos
                cmp     ax,0930h
                jl      @@No
                cmp     Timer2,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer2,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer2
                mov     ValX,50
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                add     CorY,eax
                cmp     CorY,480
                jl      @@No
                mov     CorY,480
              @@No:
                NOLOCALS

;  תתתתתתתתשששששששש----======[Jump box]=====------שששששששששתתתתתתתתת

                LOCALS
                mov     CorZ,400
                call    SoundGetPos
                mov     ecx,12
                mov     edi,offset scene2f
                repne   scasb
                jne     @@ttyy
                mov     CorZ,300
                @@ttyy:
                NOLOCALS

;        תתתתתתתתשששששששש----======[Rotates]=====------שששששששששתתתתתתתתת

                mov     esi,PBoxAdd
                mov     edi,CPSDAdd
                mov     ebx,3                ; Angle X 
                mov     ecx,32               ; Angle Y 
                mov     edx,12               ; Angle Z 
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
                cmp     ah,0ah
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
                mov     dx,0930h
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
                cmp     ax,0a00h
                jl      Scene4Loop