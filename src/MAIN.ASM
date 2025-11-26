;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;                          Meaning of the Life
;
;                     BamboOS       -       Diomatic
;
;                           of CruX 21.02.2000
;
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[Main]=====------שששששששששתתתתתתתתת

.486p
.model flat
.stack 4096h

UseMXM Equ 1           ; Use Cubic Tiny GUS Player
UseUsl Equ 0           ; Use Useless Player

.data

INCLUDE Data32.Inc

.code

ASSUME CS:@CODE,DS:@DATA

INCLUDE Inc\INCS.Inc
INCLUDE Code32.Asm
INCLUDE Effects\Effects.Inc
INCLUDE Proc\Procs.Inc
jmp     SError

END
;     תתתתתתתתשששששששש----======[EoMain]=====------שששששששששתתתתתתתתת
