;     תתתתתתתתשששששששש----======[Comment]=====------שששששששששתתתתתתתתת
;
;       UniversE Demo System 32 v0.6ב
;
;       bY BamboOS of UniversE 19.12.1999
;
;    תתתתתתתתשששששששש----======[EoComment]=====------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[Macros]=====------שששששששששתתתתתתתתת

EVSFindModeM MACRO ScrX,ScrY,ScrD
            mov  cx,ScrX
            mov  dx,ScrY
            mov  bl,ScrD
            call EVSFindMode
            ENDM

LookAftERtHIZfuckinGGraphicModewITHLFB MACRO
            w32  EVSPrompt
            w32  SelectR
            w32  Ln
            w32  ResPrompt
            w32  Res1S
            EVSFindModeM 320,240,16

            jc   Res1E
            cmp  VesaOff,0
            jz   Res1E
            mov  [Res1N],ax
            w32  Oki
            jmp  Res2
          Res1E:
            mov  [Res1N],0
            w32  Fail

          Res2:
            w32  Ln
            w32  ResPrompt
            w32  Res2S
            EVSFindModeM 320,240,24
            jc   Res2E
            cmp  VesaOff,0
            jz   Res2E
            mov  [Res2N],ax
            w32  Oki
            jmp  Res3
          Res2E:
            mov  [Res2N],0
            w32  Fail

          Res3:
            w32  Ln
            w32  ResPrompt
            w32  Res3S
            EVSFindModeM 320,240,32
            jc   Res3E
            cmp  VesaOff,0
            jz   Res3E
            mov  [Res3N],ax
            w32  Oki
            jmp  Res4
          Res3E:
            mov  [Res3N],0
            w32  Fail

          Res4:
            w32  Ln
            w32  ResPrompt
            w32  Res4S
            EVSFindModeM 640,480,32
            jc   Res4E
            cmp  VesaOff,0
            jz   Res4E
            mov  [Res4N],ax
            w32  Oki
            jmp  Res5
          Res4E:
            mov  [Res4N],0
            w32  Fail

          Res5:
            w32  Ln
            w32  ResPrompt
            w32  Res5S
            EVSFindModeM 320,240,8
            jc   Res5E
            mov  [Res5N],ax
            w32  Oki
            jmp  ResE
          Res5E:
            mov  [Res5N],0
            w32  Fail

          ResE:
            w32  Ln
            w32  Wone

            push ds
            pop  es
            mov  edi,RegOff
            mov  _ah,1
            xor  cx,cx
            xor  bx,bx
            mov  bl,21h
            mov  ax,0300h
            int  31h

            mov  bl,_al

            mov  al,49
            sub  bl,al
            mov  eax,3
            cmp  bl,4
            jg   SVError

            mov  edx,offset Res1N
            movzx eax,bl
            shl  eax,1
            add  edx,eax
            mov  eax,3
            cmp  word ptr [edx],0
            je   SVError
            mov  ax,word ptr [edx]
            mov  ThizRes,ax

            mov  edx,offset ProcTbl
            movzx ebx,bl
            shl  ebx,2
            mov  eax,dword ptr [edx+ebx]
            mov  Buf2ScrP,eax

            mov  ax,ThizRes

            call    EVSChkMode
            jc      SVError
            cmp     ScreenX,640
            jne     GetOut
            mov     ScreenY,240
            mov     ScreenX,320
            mov     VesaSize,320*240
            mov     Flag640,1
          GetOut:
            cmp     ScrDepth,8
            jne     GonG
            mov     Flag640,2
          GonG:
            ENDM

Buffer2Screen MACRO
            mov     edi,VesaOff
            mov     ecx,320*240
;            call    Wait4S
            call    Buf2ScrP
            ENDM

;     תתתתתתתתשששששששש----======[EoMacros]=====------שששששששששתתתתתתתתת