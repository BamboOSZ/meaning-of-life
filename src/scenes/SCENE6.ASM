;       תתתתתתתתשששששששש----======[Effects]=====------שששששששששתתתתתתתתת

                mov     edi,Tab4TAdd
                mov     ebx,4
                call    nTunel
                mov     edi,Tab5TAdd
                mov     ebx,4
                call    nTunel
                mov     edi,Tab6TAdd
                mov     ebx,4
                call    nTunel

;    תתתתתתתתשששששששש----======[Set Variables]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     TunelMov,0
                mov     TunelMov2,0
                mov     FadeFlag,0
                mov     CorX,160
                mov     CorY,110
                mov     CorZ,100
                mov     AngXf,0
                mov     AngYf,0
                mov     AngZf,0
                mov     Timer1,0
                mov     Timer2,0
                mov     eax,FoVSA
                mov     FoViewX,eax
                mov     FoViewY,eax


;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE 6]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              Scene6Loop:

                mov     edi,BufferAdd
                mov     ecx,320*20
                call    ClearB

; תתתתתתתתשששששששש----======[Bitmap Effects]=====------שששששששששתתתתתתתתת

                mov     esi,Tab4TAdd
                add     esi,640*4*100+160*4
                mov     ebx,140                ; sin X
                mov     ecx,2
                call    SinuSide
                shl     ValX,2
                add     esi,ValX
                mov     ebx,100                ; sin Y
                mov     ecx,3
                call    SinuSide
                mov     eax,ValX
                shl     ValX,9
                shl     eax,11
                add     ValX,eax
                add     esi,ValX

                mov     ebp,Tab5TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,160               ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,100                ; sin Y
                mov     ecx,2
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
                mov     ebx,150                ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     ebp,ValX
                mov     ebx,80                ; sin Y
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

;     תתתתתתתתשששששששש----======[Lets Fun]=====------שששששששששתתתתתתתתת

                mov     ebp,Buffer2Add
                mov     esi,Textu1Add
                mov     edi,BufferAdd
                add     edi,320*4*20
                call    LetsFunB

;   תתתתתתתתשששששששש----======[Mov CPS]=====------שששששששששתתתתתתתתת

              przertrsaadfad4431232:

                LOCALS
                call    SoundGetPos
                cmp     ah,0eh
                jl      @@No
                cmp     Timer2,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer2,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer2
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                mov     ValX,2
                fild    ValX
                fdiv
                fistp   ValX
                mov     eax,ValX
                add     CorZ,eax
                cmp     CorZ,2000
                jl      @@No
                mov     CorZ,2000
              @@No:
                NOLOCALS

;        תתתתתתתתשששששששש----======[Rotates]=====------שששששששששתתתתתתתתת

                mov     esi,GalactAdd
                mov     edi,CPSDAdd
                mov     ebx,2                ; Angle X 
                mov     ecx,4                ; Angle Y 
                mov     edx,1                ; Angle Z 
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
                cmp     ah,10h
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
                mov     dx,0f30h
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
                cmp     ax,1000h
                jl      Scene6Loop