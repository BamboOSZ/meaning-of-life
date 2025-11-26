; coodee by á@mbéé$ cRUX

; Allocate memory
; in:
;  ecx - size
; out
;  eax - mem offset
;  ebx - mem handle
MemAlloc        PROC
                shld    ebx,ecx,16
                mov     ax,0501h
                int     31h
                mov     ErrorCode,3
                jc      SError
                mov     ax,bx
                shl     eax,16
                mov     ax,cx

                mov     bx,si
                shl     ebx,16
                mov     bx,di
                ret
MemAlloc        ENDP

; Dealocate memory
; in:
;  eax - memory handler
MemDealloc      PROC
                mov     si,ax
                shl     eax,16
                mov     di,ax
                mov     ax,0502h
                int     31h
                mov     ErrorCode,5
                jc      SError
                ret
MemDealloc      ENDP

; clear buffer
; in:
;  edi - buffer off
;  ecx - size /4
ClearB          PROC
                xor     eax,eax
              ClearLoop:
                lea     ecx,[ecx-1]
                mov     [edi+ecx*4],eax
                test    ecx,ecx
                jnz     ClearLoop
                ret
ClearB          ENDP
