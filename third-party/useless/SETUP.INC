;            ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
;            บ       ๗๗๗๗๗๗๗๗๗๗๗๗๗๗ SETUP.INC ๗๗๗๗๗๗๗๗๗๗๗๗๗๗     บ
;            บ                                                   บ
;            บ       Useless sound system compilation setup.     บ
;            บฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤบ
;            บ   By Freddy Vetele (FreddyV/Useless)              บ
;            บ                                                   บ
;            บ   Code starts .................. 25/10/1996       บ
;            บ   Last update .................. 27/07/1997       บ
;            ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ

Yes Equ 1   ; Don't change this value !
No  Equ 0

;----------------------------- Sound drivers ---------------------------------

UseIW    Equ No   ; Include Interwave driver ?
UseGUS   Equ No   ; Include GUS driver ?
UseSB    Equ Yes  ; Include Sound Blaster driver ?
UseHP    Equ No   ; Include PC Speaker driver ?
UseNoSnd Equ No   ; Include No Sound driver ?

;-------------------------------- Setup --------------------------------------
;
; Setup function needs MEMORY.ASM to run and is bigger than Autosetup function.
; If you use the sound system for a GUS only intro, use only AutoSetup.

UseSetup Equ No
UseAutoSetup Equ Yes

;------------------------------- Player --------------------------------------
; Here, you can Add/Remove some player function.

LoopMusic Equ No  ; Use this to loop the music when it is finish.
                  ; (Not implemented by now)

Use_USMP_PrevOrder   Equ No  ; USMP_PrevOrder function
Use_USMP_NextOrder   Equ No  ; USMP_NextOrder function
Use_USMP_SetOrder    Equ No  ; USMP_SetOrder function
Use_USMP_SetPosition Equ No  ; USMP_SetPosition function

; Tracker compatibility mode.

UseProTracker Equ No  ; Protracker compatibility mode (Not implemented)
UseFT2        Equ Yes ; FT2 compatibility mode
UseST2        Equ No  ; ST2 compatibility mode        (Not implemented)
UseST3        Equ No  ; ST3 compatibility mode        (Not implemented)
UseIT         Equ No  ; IT compatibility mode         (Not implemented)

; A list of some functions you can remove to reduce the code size for your
; intros.

UseInstrumentMode Equ Yes   ; It's always Yes for XM files

UseLinearPeriod   Equ Yes
UseAmigaPeriod    Equ No

UseChannelVolume  Equ No    ; Channel Volume (IT)

UseFadeout        Equ Yes
UseVolumeEnv      Equ Yes
UsePannEnv        Equ Yes
UseAutoVibrato    Equ Yes

;   Name      Value  Full Number/Name          First used by  x, not in player

UseArpeggio     Equ Yes ;00-0xy Arpeggio                (MOD)
UsePortUp       Equ Yes ;01-1xx Portamento Up           (MOD)
UsePortDown     Equ Yes ;02-2xx Portamento Down         (MOD)
UsePortaNote    Equ Yes ;03-3xx Portamento to Note      (MOD)
UseVibrato      Equ Yes ;04-4xy Vibrato                 (MOD)
UsePVolumeSlide Equ Yes ;05-5xy Portamento+Volume Slide (MOD)
UseVVolumeSlide Equ Yes ;06-6xy Vibrato+Volume Slide    (MOD)
UseTremolo      Equ Yes ;07-7xy Tremolo                 (MOD)
UseSetPanning1  Equ Yes ;08-8xx Set Panning             (MOD/DMP)
UseSetOffset    Equ Yes ;09-9xx Set Sample Offset       (MOD)
UseVolumeSlide  Equ Yes ;10-Axy Volume Slide            (MOD)
UseJump         Equ Yes ;11-Bxx Jump to pattern         (MOD)
UseSetVolume    Equ Yes ;12-Cxx Set Volume              (MOD)
UseBreak        Equ Yes ;13-Dxx Pattern Break           (MOD)
UseSetTempo     Equ Yes ;15-Fxx Set Speed (xx<20h)      (MOD)
UseSetBPM       Equ Yes ;15-Fxx Set BPM (xx>=20h)       (MOD)

UseGVolume      Equ Yes ;16-Gxx Set Global Volume       (S3M/XM)
UseGVolumeSlide Equ Yes ;17-Hxx Global Volume Slide     (XM)
UseKeyOff       Equ Yes ;20-Kxx Key Off (after xx tick) (XM)
UseEnvPos       Equ Yes ;21-Lxx Set Envelope Pos        (XM)
UsePanningSlide Equ Yes ;25-Pxx Panning Slide           (XM)
UseMRetrig      Equ Yes ;27-Rxy Multi Retrig Note       (S3M)
UseTremor       Equ Yes ;29-Txy Tremor                  (STM)
UseSynchro      Equ Yes ;35-Wxx Synchro function        (USM)
UseEFPort       Equ Yes ;33-Xxy Extra Fine Portamento   (S3M)

UseSetFilter    Equ No  ;36-E0x Set Filter              (MOD) x
UseFPortUp      Equ Yes ;37-E1x Fine Portamento Up      (MOD)
UseFPortDown    Equ Yes ;38-E2x Fine Portamento Down    (MOD)
UseGliss        Equ No  ;39-E3x Glissando Control       (MOD) x
UseVibType      Equ Yes ;40-E4x Set Vibrato Waveform    (MOD)
UseFineTune     Equ No  ;41-E5x Set Finetune            (MOD) x
UsePatLoop      Equ Yes ;42-E6x Pattern Loop            (MOD)
UseTremType     Equ Yes ;43-E7x Set Tremolo WaveForm    (MOD)
UseSetPanning2  Equ Yes ;44-E8x Unused/Set Panning      (MOD/S3M)
UseRetrig       Equ Yes ;45-E9x Retrig Note             (MOD)
UseFVolumeUp    Equ Yes ;46-EAx Fine Volume Slide Up    (MOD)
UseFVolumeDn    Equ Yes ;47-EBx Fine Volume Slide Down  (MOD)
UseCutNote      Equ Yes ;48-ECx Cut Note                (MOD)
UseNoteDelay    Equ Yes ;49-EDx Delay Note              (MOD)
UsePatternDelay Equ Yes ;50-EEx Pattern Delay           (MOD)
UseInvertLoop   Equ No  ;51-EFx Invert Loop             (MOD) x

;Effects added for IT/ST3 compatibility

UseITSetBPM      Equ No
UseITPortUp      Equ No
UseITPortDown    Equ No
UseITMRetrig     Equ No
UseITVolumeSlide Equ No
UseITChVolSlide  Equ No
UseITGVolSlide   Equ No
UseSetChVolume   Equ No

; Volume commands.

UseVVolSlideDown Equ Yes  ; Volume slide Down
UseVVolSlideUp   Equ Yes  ; Volume slide Up
UseVFVolDown     Equ Yes  ; Fine volume slide Down
UseVFVolUp       Equ Yes  ; Fine volume slide Up
UseVSetVibSpeed  Equ Yes  ; Set Vibrato Speed
UseVVibrato      Equ Yes  ; Vibrato
UseVPanning      Equ Yes  ; Set Panning
UseVPanSlideL    Equ Yes  ; Panning slide Left
UseVPanSlideR    Equ Yes  ; Panning Slide Right
UseVPortaNote    Equ Yes  ; Porta to note

;---------------------------- Sound System -----------------------------------

MAX_SSCHANNELS EQU 32     ; Max number of channels used by the sound system
                          ; It can be used to limit the number of IT virtual
                          ; channels or to reduce the EXE size (for intro)
MAX_PLCHANNELS EQU 32     ; Max number of channels used by the player

;------------------------------- Mixing --------------------------------------
;
; Default Amplification is a very important variable for the mixing
; routines as there is no sound clipping in useless player mixing routines
;
; It define how mutch channels can be mix together (if the samples are
; at full volume)
; a value of 1000 is for One 'Full' volume channel
; With 500, it can mix 2 channels, ....
;
; You must try by yourself (In Mono AND Stereo Mode) to get the best sound
; quality.

;DefAmpli EQU 1000/2    ; It's good for 4/6 channels files
;DefAmpli EQU 1000/3    ; 8 Channels files
DefAmpli EQU 1000/5
;DefAmpli EQU 1000/8    ; If you play a 24 channels file like DOPE.MOD

FastStereoOversampling EQU Yes ; No, Slow Stereo oversampling (16 bit)
                               ; Yes, Fast Stereo oversampling (8 bit)

;------------------------------- Loaders -------------------------------------
;
; USMP_FreeModule function can only free the files loaded by the externals
; files loaders (USMLoad, MODLoad, XMLoad...)
; When you don't use external loaders, you must set UseFreeModule to No


UseFreeModule Equ No  ; Use FreeModule function ?

;------------------------------- Timer ---------------------------------------
; Number of timer you can use.
; (If you use the GUS or PC speaker drivers, you must add 1 to max_timers)

max_timers  EQU 4
timer_error EQU 0 ; 1, timer errors stop the program (No Error number return)
                  ; You must include ERROR.ASM when this is on
                  ; So It should be 0 in intros.

;------------------------------- Memory --------------------------------------
;
;   When you use EOS and DOS32, the player allocates its own heap
; The player heap size is (free memory-NeededMem).
; NeededMem value will depends on which DOS extender you use.
;
;For DOS32:
;   NeededMem is the total amount of memory you allocate with the DOS32
; memory allocation functions.
;   If you use the useless memory functions, you can put NeededMem to 0
;
;For EOS:
;   As EOS internally allocates memory for the LoadInternalFile and debugger,
; NeededMem is the memory you will allocate with the EOS memory functions +
; internal EOS memory allocations.
;   As you can see, it's more difficult with EOS because the memory is
; shared between the player, EOS internal needs and EOS memory functions,
; you will have to try different values to find the optimal one.
;
; BTW: EOS load_internal_file error is file not found instead of out of memory
;
;For WATCOM C:
;   USM Play memory functions just call the WATCOM memory functions. (malloc)
;   So, the Memory functions are "useless" in WATCOM C.

NeededMem Equ 32*1024
