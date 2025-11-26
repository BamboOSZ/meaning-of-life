;       תתתתתתתתשששששששש----======[Effects]=====------שששששששששתתתתתתתתת

                mov     edi,Tab4TAdd
                mov     ebx,2
                call    nTunel
                mov     edi,Tab5TAdd
                mov     ebx,2
                call    nTunel
                mov     edi,Tab6TAdd
                call    Waves

;    תתתתתתתתשששששששש----======[Set Variables]=====------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     TimerS,eax
                mov     LastVal,eax
                mov     TunelMov,0
                mov     TunelMov2,0
                mov     FadeFlag,0
                mov     CorX,260
                mov     CorY,260
                mov     CorZ,100
                mov     AngXf,0
                mov     AngYf,0
                mov     AngZf,0
                mov     eax,FoVS5
                mov     FoViewX,eax
                mov     FoViewY,eax
                mov     Timer1,0
                mov     Timer2,0

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[SCENE 5]=====------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[MAIN LOOP]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

              Scene5Loop:

; תתתתתתתתשששששששש----======[Bitmap Effects]=====------שששששששששתתתתתתתתת

                mov     esi,Tab4TAdd
                add     esi,640*4*100+160*4
                mov     ebx,140                ; sin X
                mov     ecx,3
                call    SinuSide
                shl     ValX,2
                add     esi,ValX
                mov     ebx,100                ; sin Y
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
                call    SubEff

                mov     ebp,Tab6TAdd
                add     ebp,640*4*100+160*4
                mov     ebx,150                ; sin X
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
                call    SubEff

;     תתתתתתתתשששששששש----======[Lets Fun]=====------שששששששששתתתתתתתתת

                mov     ebp,Buffer2Add
                mov     esi,Textu0Add
                mov     edi,BufferAdd
                add     edi,320*4*20
                call    LetsFun

;    תתתתתתתתשששששששש----======[Modify Texture]=====------שששששששששתתתתתתתתת

                call    ModifyTexture

;   תתתתתתתתשששששששש----======[Mov CPS]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ah,0ah
                jne     @@No
                cmp     Timer1,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer1,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer1
                mov     ValX,5
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                sub     CorY,eax
                cmp     CorY,170
                jg      @@No
                mov     CorY,170
              @@No:
                NOLOCALS

              przertrsaadfad5:

                LOCALS
                call    SoundGetPos
                cmp     ax,0b30h
                jl      @@No
                cmp     Timer2,0
                jne     @@NoGT
                call    SoundGetTimer
                mov     Timer2,eax
              @@NoGT:
                call    SoundGetTimer
                sub     eax,Timer2
                mov     ValX,20
                fild    ValX
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fmul
                fistp   ValX
                mov     eax,ValX
                sub     CorX,eax
              @@No:
                NOLOCALS

;        תתתתתתתתשששששששש----======[3dMorph]=====------שששששששששתתתתתתתתת
;                               from edi to esi

;jmp nom
                LOCALS
                mov     edi,SphereAdd
                mov     esi,PBoxAdd
              @@MorphLoop:
                call    SoundGetTimer
                sub     eax,TimerS
                mov     edx,70*210
                sub     edx,eax
                cmp     edx,1
;                jl      @@Out
                mov     ValX,edx
                mov     ecx,3
              @@NextMorph:
                fld     dword ptr[esi]
                fld     dword ptr[edi]
                fsub
                fild    ValX
                fild    TimerMax
                fdiv
                fdiv
                fld     dword ptr[edi]
                fadd
                fstp    dword ptr[edi]
                lea     ecx,[ecx-1]
                lea     esi,[esi+4]
                lea     edi,[edi+4]
                test    ecx,ecx
                jnz     @@NextMorph
                lea     edi,[edi+4]
                lea     esi,[esi+4]
                cmp     dword ptr[edi],0e0c72dh
                jne     @@MorphLoop
              @@Out:
                NOLOCALS
nom:

;        תתתתתתתתשששששששש----======[Rotates]=====------שששששששששתתתתתתתתת

                mov     esi,SphereAdd
                mov     edi,CPSDAdd
                mov     ebx,30               ; Angle X 
                mov     ecx,20               ; Angle Y 
                mov     edx,10               ; Angle Z 
                call    Rotate

;          תתתתתתתתשששששששש----======[CPS]=====------שששששששששתתתתתתתתת
;                           CruX's Particle System

                mov     esi,CPSDAdd
                call    CPSDraw

;      תתתתתתתתשששששששש----======[Put Text]=====------שששששששששתתתתתתתתת

                LOCALS
                call    SoundGetPos
                cmp     ah,0ch
                je      @@NoT
                call    PutText
              @@NoT:
                NOLOCALS


;       תתתתתתתתשששששששש----======[Rectangles]=====------שששששששששתתתתתתתתת

                mov     edi,offset Rects2
                call    PutRectS

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
                mov     dx,0b30h
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
                cmp     ax,0c00h
                jl      Scene5Loop