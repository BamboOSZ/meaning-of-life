;code bY BamboOS^CruX

; .oOo. Put Recrangles
;       in:
;       edi - pointer to rectangle buffer

PutRectS        PROC
              @@PutLineLoop:
                push    edi
                mov     ebp,[edi]      ; X
                mov     eax,[edi+4]    ; Y
                mov     ecx,320*4
                mul     ecx
                shl     ebp,2
                add     ebp,eax
                add     ebp,BufferAdd
                add     ebp,320*20*4

                mov     eax,[edi+16]
                mov     esi,[edi+8]     ; ofs X
                mov     edi,[edi+12]    ; ofs Y

                call    Rectaa

                pop     edi
                lea     edi,[edi+20]
                cmp     dword ptr[edi],0ba11h
                jne     @@PutLineLoop
                ret
PutRectS        ENDP

; .oOo. Add Rectangle
;       in:
;       ebp - buffer 2 write to... (with offset of line)
;       esi - Offset X
;       edi - Offset Y
;       eax - color of line (add to color from buffer)

Rectaa          PROC
                LOCALS
                ; set colors from eax to ecx, ebx, eax
                shl     eax,8    ; del A
                xor     ecx,ecx  ; Blue
                xor     ebx,ebx  ; Red
                xchg    ah,cl
                shr     eax,16   ; Green
                xchg    ah,bl
                lea     esi,[esi-1]
                lea     edi,[edi-1]
              MakeRectLoop:
                push    esi
              MakeRectLoopIn:
                mov     edx,[ebp+esi*4]
                push    eax
                push    ebx
                push    ecx
                push    edx
                shl     edx,24
                shr     edx,24
                add     ecx,edx
;                shr     ecx,1
                cmp     ecx,255
                jl      @@BOki
                mov     ecx,255
              @@Boki:
                cmp     ecx,0
                jg      @@BOki0
                xor     ecx,ecx
              @@Boki0:
                pop     edx
                push    edx
                shl     edx,16
                shr     edx,24
                add     eax,edx
;                shr     eax,1
                cmp     eax,255
                jl      @@GOki
                mov     eax,255
              @@Goki:
                cmp     eax,0
                jg      @@GOki0
                xor     eax,eax
              @@Goki0:
                xchg    ch,al
                pop     edx
                push    edx
                shl     edx,8
                shr     edx,24
                add     ebx,edx
;                shr     ebx,1
                cmp     ebx,255
                jl      @@ROki2
                mov     ebx,255
              @@Roki2:
                cmp     ebx,0
                jg      @@ROki0
                xor     ebx,ebx
              @@Roki0:
                shl     ebx,16
                xchg    cx,bx
                mov     [ebp+esi*4],ebx
                pop     edx
                pop     ecx
                pop     ebx
                pop     eax
                lea     esi,[esi-1]
                cmp     esi,0
                jge     MakeRectLoopIn
                pop     esi
                lea     edi,[edi-1]
                lea     eax,[eax+1]
                add     ebp,320*4
                cmp     edi,0
                jge     MakeRectLoop
                NOLOCALS
                ret
Rectaa          ENDP