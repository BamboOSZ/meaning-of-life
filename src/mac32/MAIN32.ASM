;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;       UniversE Demo System 32 v0.6ב
;
;       bY BamboOS of UniversE 19.12.1999
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[Macros]=====------שששששששששתתתתתתתתת

letsinitialiSESOmesHIT MACRO

                mov     ecx,320*280*4                    ;mem 4 screen buffer
                call    MemAlloc
                mov     BufferAdd,eax
                mov     BufferHan,ebx

                mov     edi,BufferAdd
                mov     ecx,320*280
                call    ClearB
                add     BufferAdd,30*320*4

                mov     ecx,640*420*4                    ; Memory for 2nd buffer
                call    MemAlloc
                mov     Buffer2Add,eax
                mov     Buffer2Han,ebx

                mov     ecx,128*4*2                      ; mem 4 resizing
                call    MemAlloc
                mov     Tab4RAdd,eax
                mov     Tab4RHan,ebx

                if UseMXM
                mov     ecx,16384                        ;  mem 4 Tiny Gus Palyer
                call    MemAlloc
                mov     MxMDataAdd,eax
                mov     MxMDataHan,ebx
                endif

                mov     ecx,640*400*4                    ;  mem 4 Effects
                call    MemAlloc
                mov     Tab4TAdd,eax
                mov     Tab4THan,ebx

                mov     ecx,640*400*4                    ;  mem 4 Effects
                call    MemAlloc
                mov     Tab5TAdd,eax
                mov     Tab5THan,ebx

                mov     ecx,640*400*4                    ;  mem 4 Effects
                call    MemAlloc
                mov     Tab6TAdd,eax
                mov     Tab6THan,ebx

                mov     ecx,640*400*4                    ;  mem 4 Effects
                call    MemAlloc
                mov     Tab7TAdd,eax
                mov     Tab7THan,ebx

                mov     ecx,256*266*4*2                   ; Texture 0
                call    MemAlloc
                add     eax,256*4
                mov     Textu0Add,eax
                mov     Textu0Han,ebx

                mov     ecx,256*266*4                    ;  mem 4 1Texture
                call    MemAlloc
                add     eax,256*4
                mov     Textu1Add,eax
                mov     Textu1Han,ebx

                mov     ecx,256*266*4                    ;  mem 4 2Texture
                call    MemAlloc
                add     eax,256*4
                mov     Textu2Add,eax
                mov     Textu2Han,ebx

                mov     ecx,256*266*4                    ;  mem 4 3Texture
                call    MemAlloc
                add     eax,256*4
                mov     Textu3Add,eax
                mov     Textu3Han,ebx

                mov     ecx,320*32                       ;  mem 4 Texts
                call    MemAlloc
                mov     TextsAdd,eax
                add     TextsAdd,320*2
                mov     TextsHan,ebx

                mov     ecx,1000*4*4                     ;  mem 4 CPSD
                call    MemAlloc
                mov     CPSDAdd,eax
                mov     CPSDHan,ebx

                mov     ecx,1000*4*4                     ;  mem 4PBox
                call    MemAlloc
                mov     PBoxAdd,eax
                mov     PBoxHan,ebx

                mov     ecx,1000*4*4                     ;  mem 4 Sphere
                call    MemAlloc
                mov     SphereAdd,eax
                mov     SphereHan,ebx

                mov     ecx,3000*4*4                     ;  mem 4 Galactic
                call    MemAlloc
                mov     GalactAdd,eax
                mov     GalactHan,ebx

;                mov     ecx,64*65*4                      ;  mem 4 flare
;                call    MemAlloc
;                mov     FlareAdd,eax
;                mov     FlareHan,ebx

                ENDM

PrecalcsomefuckingtraINGLES MACRO

                INCLUDE Mac32\Texture1.Asm
                INCLUDE Mac32\Texture2.Asm
                INCLUDE Mac32\Texture3.Asm

                ; precalc 3d stuph

                INCLUDE Mac32\3dprec.Asm
                INCLUDE Mac32\galact.Asm

                dfgrandomRANDMOtext:
                ; flip texture

                LOCALS
                mov     edi,Textu0Add
                mov     esi,Textu3Add
                mov     ecx,256*256
              @@FlipLoop:
                lea     ecx,[ecx-1]
                mov     eax,[esi+ecx*4]
                mov     [edi+ecx*4],eax
;                mov     [edi+ecx*4+256*256*4],eax
                test    ecx,ecx
                jnz     @@FlipLoop
                NOLOCALS

                ; precalc flare

;                INCLUDE Mac32\Flare.Asm

                ENDM

FindanDINitSound  MACRO
                if UseMXM
                xor     eax,eax
                mov     ax,esval
                call    xmpGetEnvPtrDPMI_         ; get dos evromental address
                call    xmpGetGUSPort_            ; get gusport from ULTRASND=
                mov     ebx,MxMdataAdd
                mov     ecx,65536
                mov     edx,offset module
                mov     esi,edx
                xor     edx,edx
                call    xmpInit_                  ; init gus and load module
                test    eax,eax
                mov     ErrorCode,6
                jz      SError
                endif
                if UseUsl
                mov     ErrorCode,7
                push    es
                mov     es,esval
                sti
                call    HardwareInit
                pop     es
                jc      SError
                call    USS_AutoSetup
                jc      SError
                mov     esi,offset Module
                call    USMP_LoadInternalModule
                jc      SError
                endif
                ENDM

DestroysoMEuNUSeDssssssZITAZ MACRO            ;deinit some thingz

                w32     Ln
                w32     UDSPrompt
                w32     DSound
                call    SoundStop               ; stop timer and muzzik

                w32     Ln
                w32     UDSPrompt
                w32     DMem

                mov     eax,BufferHan             ; screen buffer
                call    MemDealloc

                mov     eax,Buffer2Han            ; 2nd buffer
                call    MemDealloc

                mov     eax,Tab4RHan              ; resizing
                call    MemDealloc

                if UseMXM
                mov     eax,MxMDataHan            ; mxm data
                call    MemDealloc
                endif

                mov     eax,Tab4THan              ; 4 effects
                call    MemDealloc

                mov     eax,Tab5THan              ; 4 effects
                call    MemDealloc

                mov     eax,Tab6THan              ; 4 effects
                call    MemDealloc

                mov     eax,Tab7THan              ; 4 effects
                call    MemDealloc

                mov     eax,Textu0Han             ; texture
                call    MemDealloc

                mov     eax,Textu1Han             ; texture
                call    MemDealloc

                mov     eax,Textu2Han             ; texture
                call    MemDealloc

                mov     eax,Textu3Han             ; texture
                call    MemDealloc

                mov     eax,TextsHan              ; text
                call    MemDealloc

                mov     eax,CPSDHan               ; Crux Particle System
                call    MemDealloc

                mov     eax,PBoxHan               ; 3d box
                call    MemDealloc

                mov     eax,SphereHan             ; 4 3d sphere
                call    MemDealloc

                mov     eax,GalactHan             ; 4 galactic
                call    MemDealloc

;                mov     eax,FlareHan              ; 4 flare
;                call    MemDealloc

                ENDM

;     תתתתתתתתשששששששש----======[EoMacros]=====------שששששששששתתתתתתתתת