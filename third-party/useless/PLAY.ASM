;            ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
;            º      ÷÷÷÷÷÷÷÷÷÷÷÷÷÷ PLAY.ASM ÷÷÷÷÷÷÷÷÷÷÷÷÷÷       º
;            º                                                   º
;            º                 Useless Player                    º
;            º                (WATCOM Version)                   º
;            ºÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄº
;            º   by Freddy V‚tel‚ (FreddyV/Useless)              º
;            º                                                   º
;            º   Code Starts .................. 15/02/1997       º
;            º   Last Update .................. 14/07/1997       º
;            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
.386p
INCLUDE OS.INC

.STACK 1000h

INCLUDE ERR_CODE.INC

INCLUDE XMLOAD.INC
INCLUDE USMPLAY.INC
INCLUDE USS.INC
INCLUDE USSVAR.INC    ; _DEV_Name definition

INCLUDE HARDWARE.INC

INCLUDE MEMORY.INC
INCLUDE UTILS.INC

;=============================================================================

.data

Module DB '..\DATA\EFFECT.XM',0

USMOFFSET dd 0

StartMSG DB 'USM Play v1.04 (WATCOM asm example)',13,10,36

;=============================================================================

.code

Start:
        jmp short _main
        db 'WATCOM'   ; The "WATCOM" string is needed in
                      ; order to run under DOS/4G and WD.

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
; Entry To ASM Code (_main)
; In:
;   CS - Code Selector    Base: 00000000h - Limit: 4G
;   DS - Data Selector    Base: 00000000h - Limit: 4G
;   ES - PSP Selector     Base: PSP Seg   - Limit: 100h
;   FS - ?
;   GS - ?
;   SS - Data Selector    Base: 00000000h - Limit: 4G
;   ESP -> STACK segment
;   Direction Flag - ?
;   Interrupt Flag - ?
;
;   All Other Registers Are Undefined!
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
_main:
        sti                             ; Set The Interrupt Flag

; "Hardware" Init 
	call HardwareInit       ; This MUST be the first function call
                                ; becaude HardwareInit need the es register
                                ; to be PSP Selector.

; ** Sound system Setup
	
        call USS_Setup
;        call USS_AutoSetup
        jc _PEnd
 
; ** Player Start
 
        mov edx,offset StartMsg
        writeDOS

        U_Maxavail
	
        Write 'Free memory: '
        shr eax,10
        call Print_dec
        Writeln 'Kb'

        write 'Device: '

        mov edx,_DEV_Name
        WriteDOS

        writeln

        mov esi,offset Module
        call XM_Load
        jc _PError

        mov USMOffset,esi

        call USMP_StartPlay

        Write 'A key to stop.'
        Waitkey

        call USMP_StopPlay

        jmp _PEnd
_PError:
        call Display_Error_
		
_PEnd:
        Stop

end start