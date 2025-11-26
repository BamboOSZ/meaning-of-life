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
;    תתתתתתתתשששששששש----======[SomeFasVar]=====------שששששששששתתתתתתתתת

                TFadeCounter     dd 0
                FadeCounter      dd 0
                ValX             dd ?
                ValY             dd ?
                ValZ             dd ?
                TSize            dd ?
                LastVal          dd ?
                TunelMov         db ?
                TunelMov2        db ?

                TimerS           dd ?
                TimerE           dd ?
                Timer1           dd ?
                Timer2           dd ?

                FadeFlag         db 0
                NoAddFlag        db 0

;תתתשששששששש----======[CruX Particle System Datas]=====------שששששששששתתתת

                CorY             dd 110
                CorX             dd 160
                CorZ             dd 300
                Ready            dd ?
                AngXf            dd 0
                AngYf            dd 0
                AngZf            dd 0
                LastVR           dd 0

                FovS5            dd 10e0
                FovSA            dd 128e0

                FoViewX          dd 100e0
                FoViewY          dd 100e0

                SinX             dd ?
                CosX             dd ?
                SinY             dd ?
                CosY             dd ?
                SinZ             dd ?
                CosZ             dd ?

                SphereW:
                INCLUDE Data\Sphere.Inc
                dd       0e0c72dh ; endofsphere

                GalactW:
                INCLUDE Data\Galactic.Inc
                dd       0e0c72dh ; endofgalact

;      תתתתתתתתשששששששש----======[Datas]=====------שששששששששתתתתתתתתת

                Scene2f:
                db 04h,07h,0ch
                db 14h,17h,1ch
                db 24h,27h,2ch
                db 34h,37h,3ch

                Font:
                INCLUDE Data\Font.Inc
                Mini:
                INCLUDE Data\Mini.Inc
                Tex1:
                INCLUDE Data\Tex1.inc
                Tex2:
                INCLUDE Data\Tex2.inc
                dd 0
                Flare:
                INCLUDE Data\Flare.inc
                dd 0
                dd 0

                FlareAdd dd offset Flare


              Rects1:;corX,corY,ofsX,ofsY,Color2Add
                dd     10,  20,  20,   1, 0000f2f8fh
                dd     20,  10,   1,  20, 0000f2f8fh
                dd     90,  20,  20,   1, 0000f2f8fh
                dd    100,  10,   1,  20, 0000f2f8fh
                dd    170,  20,  20,   1, 0000f2f8fh
                dd    180,  10,   1,  20, 0000f2f8fh
                dd    250,  20,  20,   1, 0000f2f8fh
                dd    260,  10,   1,  20, 0000f2f8fh
                ;----------------------------------
                dd     10,  90,  20,   1, 0000f2f8fh
                dd     20,  80,   1,  20, 0000f2f8fh
                dd     90,  90,  20,   1, 0000f2f8fh
                dd    100,  80,   1,  20, 0000f2f8fh
                dd    170,  90,  20,   1, 0000f2f8fh
                dd    180,  80,   1,  20, 0000f2f8fh
                dd    250,  90,  20,   1, 0000f2f8fh
                dd    260,  80,   1,  20, 0000f2f8fh
                ;----------------------------------
                dd     10, 160,  20,   1, 0000f2f8fh
                dd     20, 150,   1,  20, 0000f2f8fh
                dd     90, 160,  20,   1, 0000f2f8fh
                dd    100, 150,   1,  20, 0000f2f8fh
                dd    170, 160,  20,   1, 0000f2f8fh
                dd    180, 150,   1,  20, 0000f2f8fh
                dd    250, 160,  20,   1, 0000f2f8fh
                dd    260, 150,   1,  20, 0000f2f8fh
                dd    0ba11h ;- end of Rect Definitions

              Rects2:;corX,corY,ofsX,ofsY,Color2Add
                dd      0,   0,  20,  20, 0006f2f2fh
                dd    300,   0,  20,  20, 0006f2f2fh
                dd    300, 180,  20,  20, 0006f2f2fh
                dd      0, 180,  20,  20, 0006f2f2fh
                dd      0,  20,  20, 160, 0001f2f9fh
                dd    300,  20,  20, 160, 0001f2f9fh
                dd     20,   0, 280,  20, 0001f2f9fh
                dd     20, 180, 280,  20, 0001f2f9fh
                dd    0ba11h ;- end of Rect Definitions

              Rects3:;corX,corY,ofsX,ofsY,Color2Add
                dd    260,  10,  50,  50, 0006f2f2fh
                dd    220,  50,  30,  30, 0006f2f2fh
                dd    210,  90,  20,  20, 0006f2f2fh
                dd    220, 120,  10,  10, 0006f2f2fh

                dd     10, 140,  50,  50, 0001f2f6fh
                dd     70, 120,  30,  30, 0001f2f6fh
                dd     90,  90,  20,  20, 0001f2f6fh
                dd     90,  70,  10,  10, 0001f2f6fh
                dd    0ba11h ;- end of Rect Definitions

;      תתתתתתתתשששששששש----======[Texts]=====------שששששששששתתתתתתתתת

                Texts            dd offset Text01
                                 dd offset Text02
                                 dd offset Text03
                                 dd offset Text04
                                 dd offset Text05
                                 dd offset Text06
                                 dd offset Text07
                                 dd offset Text08
                                 dd offset Text09
                                 dd offset Text10
                                 dd offset Text11
                                 dd offset Text12
                                 dd offset Text13
                                 dd offset Text14
                                 dd offset Text15
                                 dd offset Text16
                                 dd offset Text17
                                 dd offset Text18
                                 dd offset Text18
                                 dd offset Text19

                Text01           db '[[BAMBOOS[[\[[DIOMATIC',36
                Text02           db '[[[[[THINK[ABOUT[___',36
                Text03           db '[[[[[WHERE[ARE[YOU]',36
                Text04           db '[[[[WHY[ARE[YOU[HERE]',36
                Text05           db '[[[[[[YOU[ARE[ONLY',36
                Text06           db '[[[[[PIECE[OF[WATER',36
                Text07           db '[[PROTEIN[AND[CALCIUM',36
                Text08           db '[[[OR[SOMETHING[ELSE]',36
                Text09           db 'YOU[FALL[INTO[THE[QUESTION',36
                Text10           db '[YOU[FALL[INTO[YOUR[MIND',36
                Text11           db '[[YOUR[MIND[IS[NOTHING',36
                Text12           db '[[[[YOUR[MIND[IS[ALL',36
                Text13           db '[LOT[OF[STARS[BEHIND[YOU',36
                Text14           db '[[[[YOU[ARE[ALL[ALONE',36
                Text15           db '[[IN[THIS[BIG[UNIVERSE',36
                Text16           db '[[[AND[YOU[DON^T[KNOW',36
                Text17           db '[[[[[[[[WHERE[IS',36
                Text18           db '[THE[MEANING[OF[THE[LIFE',36
                Text19           db 36

;    תתתתתתתתשששששששש----======[Standart]=====------שששששששששתתתתתתתתת

                InitSome         db 'AlloC soME memORy',36
                SomePrecalcs     db 'soME preCALCs hmm....',36
                EndMsg           db 10,13,'   -- = Thanks [2] (peoples): ',13,10,13,10
 db '  [  Candle^Cryogen,     Incubus^Fizz,      Jam^KoroZone,    Mef^Dimension,  ]',13,10
 db '  [  Payda^Procreation,      Vigrid^Addict                                   ]',13,10
 db 10,13,'   -- = Greetz [4] (groups): ',13,10,13,10
 db '  [  Addict, Altair, Amber, Capricorn, Cube,  Dimension,  Fizz,   Hellcore,  ]',13,10
 db '  [  Interror, KoroZone, Metachrome, Platoon, Prism, Procreation,Sunflower,  ]',13,10
 db '  [  Suspend, WIZZ.ARtS, Zone51                                              ]',13,10,13,10
 db '         --- = [ Meaning of tHe LIFE bY CruX - www.crux.cjb.net ] = ---',36

                FramS            db ' Frames ',36
                vall             db ' = ',36
                Oki              db ' +',36
                Fail             db ' -',36
                fpsS             db ' fps',36

                ErrorCode        dd ?
                ErrorS           db 'Error ---> ',36
                ErrorSOf:        dd offset NoWin
                                 dd offset NoFile
                                 dd offset NoMem
                                 dd offset EscPr
                                 dd offset NoDeal
                                 dd offset HeadError
                                 dd offset SoundError
                                 dd offset FucError
                NoWin            db 'Win sUXx',36
                NoFile           db 'Data File',36
                NoMem            db 'XMS',36
                EscPr            db 'Escape Pressed :(',36
                NoDeal           db 'Dealocating ',36
                HeadError        db 'Module',36
                SoundError       db 'Sound',36
                FucError         db 'Thiz is !!?',36

                DSound           db 'Deinit Sound',36
                DMem             db 'Dealoc Memory...',36

                EsVal            dw ?

                DemoTime         dd ?
                FrameCounter     dd ?
                SceneCounter     dd ?

;      תתתתתתתתשששששששש----======[Memory]=====------שששששששששתתתתתתתתת

                memoff           dd ?
                memhan           dd ?

                BufferAdd        dd ?
                BufferHan        dd ?

                Buffer2Add       dd ?
                Buffer2Han       dd ?

                Tab4RAdd         dd ?
                Tab4RHan         dd ?

                Tab4TAdd         dd ?
                Tab4THan         dd ?

                Tab5TAdd         dd ?
                Tab5THan         dd ?

                Tab6TAdd         dd ?
                Tab6THan         dd ?

                Tab7TAdd         dd ?
                Tab7THan         dd ?

                Textu0Add        dd ?
                Textu0Han        dd ?

                Textu1Add        dd ?
                Textu1Han        dd ?

                Textu2Add        dd ?
                Textu2Han        dd ?

                Textu3Add        dd ?
                Textu3Han        dd ?

                TextsAdd         dd ?
                TextsHan         dd ?

                CPSDAdd          dd ?
                CPSDHan          dd ?

                PBoxAdd          dd ?
                PBoxHan          dd ?

                SphereAdd        dd ?
                SphereHan        dd ?

                GalactAdd        dd ?
                GalactHan        dd ?

;                FlareAdd         dd ?
;                FlareHan         dd ?

;    תתתתתתתתשששששששש----======[Sound Players]=====------שששששששששתתתתתתתתת

                if UseMXM
                SndCreditz       db 'cuBIC tiNY GUS xm pLAYER v1.5',36
                Module:
                Include Data\SnyChip.Inc
                MxMDataAdd       dd ?
                MxMdataHan       dd ?
                TimerMax         dd 1193046
                endif

                if UseUsl
                SndCreditz       db 'USM Play v1.04 by FreddyV/Useless',36
                Module:
                Include Data\SnyChipu.Inc
                TimerValue       dd 0
                TimerMax         dd 70
                endif

;       תתתתתתתתשששששששש----======[UXE]=====------שששששששששתתתתתתתתת

                ProcTbl          dd offset Buf2Scr16
                                 dd offset Buf2Scr24
                                 dd offset Buf2Scr32
                                 dd offset Buf2Scr32D
                                 dd offset Buf2ScrGray
                Buf2ScrP         dd ?
                VErrorTbl        dd offset NoVESAS
                                 dd offset No20orhS
                                 dd offset NoModeS
                                 dd offset FuckErr
                NoVESAS          db 'No VESA',36
                No20orhS         db 'No VESA 2.0 or higher',36
                NoModeS          db 'mode w LFB notFound',36
                FuckErr          db 'Thiz is !!?',36
                RunUniVBE        db ' run UniVBE or smth...',36
                SelectR          db 'SElect modE:',36
                ResPrompt        db '  --=',36
                Res1S            db '[1] 320x240x16 LFB -<suxx>',36
                Res2S            db '[2] 320x240x24 LFB -<good>',36
                Res3S            db '[3] 320x240x32 LFB -<cool>',36
                Res4S            db '[4] 640x480x32 LFB -<poor>',36
                Res5S            db '[5] 320x240x8 Bank -<gray>',36
                Res1N            dw ?
                Res2N            dw ?
                Res3N            dw ?
                Res4N            dw ?
                Res5N            dw ?
                Wone             db '    ---=[?]',36
                ThizRes          dw ?
                Flag640          db 0

;     תתתתתתתתשששששששש----======[EoDatas]=====------שששששששששתתתתתתתתת