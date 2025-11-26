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
INCLUDE C:\Work\BamboOS\Asm\2000\Sound\Usmm11\src\OS.Inc
.stack 4096



UseMXM Equ 0           ; Use Cubic Tiny GUS Player
UseUsl Equ 1           ; Use Useless Player

.data

INCLUDE Data32.Inc

.code

ASSUME CS:@CODE,DS:@DATA,ES:@CODE

INCLUDE Inc\INCS.Inc
INCLUDE Code32.Asm
INCLUDE Effects\Effects.Inc
INCLUDE Proc\Procs.Inc
jmp     SError

END
;     תתתתתתתתשששששששש----======[EoMain]=====------שששששששששתתתתתתתתת
