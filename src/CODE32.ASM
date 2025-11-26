;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;                          Meaning of the Life
;
;                     BamboOS       -       Diomatic
;
;                          of CruX 21.02.2000
;
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[Code]=====------שששששששששתתתתתתתתת

                mov     esval,es
                w32     Ln
                LookAftERtHIZfuckinGGraphicModewITHLFB   ;chose res [EVS]

                w32     Ln
                w32     UDSPrompt
                w32     InitSome
                letsinitialiSESOmesHIT                   ; Init Some mem's
                                                         ; and others
                w32     Ln
                w32     UDSPrompt
                w32     SndCreditz
                FindanDINitSound                         ; Find and init Sound
                                                         ; player
                w32     Ln
                w32     UDSPrompt
                w32     SomePrecalcs
                PrecalcsomefuckingtraINGLES              ; precalc some numb

                mov     ax,ThizRes       ; \ Wow ! init THIz mODe
                call    EVSInit          ; /
                mov     eax,3
                jc      SVError
                cmp     flag640,1        ;
                jne     LoRes            ; Double Pixels in 640 x 480
                call    Double           ;
              LoRes:
                cmp     flag640,2
                jne     NoGray
                call    SetGrayPal
              NoGray:
                mov     FrameCounter,0

                FINIT

                call    SoundPlay

;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת
;     תתתתתתתתשששששששש----======[DEMO START]=====------שששששששששתתתתתתתתת
;           תתתתתתתתשששששששש----===========------שששששששששתתתתתתתתת

                call    SoundGetTimer
                mov     DemoTime,eax

                INCLUDE SCENES\Scene1.Asm
                INCLUDE SCENES\Scene2.Asm
                INCLUDE SCENES\Scene3.Asm
                INCLUDE SCENES\Scene4.Asm
                INCLUDE SCENES\Scene5.Asm
                INCLUDE SCENES\Scene6.Asm
                INCLUDE SCENES\Scene7.Asm
                INCLUDE SCENES\SceneE.Asm       ; end scene - CRUX logo

                call    EVSDeinit
                jc      SError

              EndofDemo:
                call    SoundGetTimer
                sub     eax,DemoTime
                mov     DemoTime,eax

                DestroysoMEuNUSeDssssssZITAZ

                w32     Ln
                w32     UDSprompt              ;  Write
                w32     FramS                  ;
                w32     vall                   ;    frames
                fild    FrameCounter
                fild    DemoTime
                fild    TimerMax
                fdiv
                fdiv
                fistp   FrameCounter
                mov     eax,FrameCounter
                w3n     ax
                w32     fpsS

              EndofCode:

                w32     Ln
                w32     EndMsg
                mov     ax,4c00h
                int     21h

              SError:
                mov  esi,offset EndofCode
                mov  eax,ErrorCode
                test eax,80000000h
                jz   NoDeinit
                and  eax,7fffffffh
                mov  esi,offset EndofDemo
                call    EVSDeinit
              NoDeinit:
                w32  Ln
                w32  UDSPrompt
                w32  ErrorS
                dec  eax
                and  eax,7fffffffh
                cmp  eax,7
                jl   ErrOk
                mov  eax,7
              ErrOk:
                mov  edi,offset ErrorSOf
                shl  eax,2
                mov  edx,dword ptr [edi+eax]
                call w32p
                jmp  esi

              SVError:
                w32  Ln
                w32  EVSPrompt
                w32  ErrorS
                dec  eax
                and  eax,7fffffffh
                cmp  eax,2
                jng  GErrOk
                mov  eax,3
              GErrOk:
                mov  edi,offset VErrorTbl
                shl  eax,2
                mov  edx,dword ptr [edi+eax]
                call w32p
                w32  RunUniVBE
                jmp  EndofCode

;      תתתתתתתתשששששששש----======[EoCode]=====------שששששששששתתתתתתתתת