
                BufferAdd dd offset BufferL
                BufferL:
                db      320*280*4 dup(?)                  ;mem 4 screen buffer

                mov     edi,BufferAdd
                mov     ecx,320*280
                call    ClearB
                add     BufferAdd,30*320*4

                Buffer2Add dd offset Buffer2L
                Buffer2L:
                db      640*420*4 dup(?)                 ; Memory for 2nd buffer

                Tab4RAdd dd offset Tab4RL
                Tab4RL:
                db      128*4*2 dup(?)                   ; mem 4 resizing

;                if UseMXM
;                mov     ecx,16384                        ;  mem 4 Tiny Gus Palyer
;                call    MemAlloc
;                mov     MxMDataAdd,eax
;                mov     MxMDataHan,ebx
;                endif

                Tab4TAdd dd offset Tab4TL
                Tab4TL:
                db      640*400*4 dup(?)                 ;  mem 4 Effects

                Tab5TAdd dd offset Tab5TL
                Tab5TL:
                db      640*400*4 dup(?)                 ;  mem 4 Effects

                Tab6TAdd dd offset Tab6TL
                Tab6TL:
                db      640*400*4 dup(?)                 ;  mem 4 Effects

                Tab7TAdd dd offset Tab7TL
                Tab7TL:
                db      640*400*4 dup(?)                 ;  mem 4 Effects

                Textu0Add dd offset Textu0L
                Textu0L:
                db      256*266*4 dup(?)                 ;  mem 4 texture

                Textu1Add dd offset Textu1L
                Textu1L:
                db      256*266*4 dup(?)                 ;  mem 4 texture

                Textu2Add dd offset Textu2L
                Textu2L:
                db      256*266*4 dup(?)                 ;  mem 4 texture

                Textu3Add dd offset Textu3L
                Textu3L:
                db      256*266*4 dup(?)                 ;  mem 4 texture

                TextsAdd dd offset TextsL
                TextsL:
                db      320*32 dup(?)                    ;  mem 4 texts

                CPSDAdd dd offset CPSDL
                CPSDL:
                db      1000*4*4 dup(?)                   ;  mem 4 CPSD

                PBoxAdd dd offset PBoxL
                PBoxL:
                db      1000*4*4 dup(?)                   ;  mem 4 CPSD

                SphereAdd dd offset SphereL
                SphereL:
                db      1000*4*4 dup(?)                   ;  mem 4 CPSD

                GalactAdd dd offset GalactL
                GalactL:
                db      3000*4*4 dup(?)                   ;  mem 4 CPSD

                FlareAdd dd offset FlareL
                FlareL:
                db      64*65*4 dup(?)                    ;  mem 4 flare