;code bY BamboOS
Buf2Scr16       PROC
                lea     esi,[esi+320*4*20]
                lea     edi,[edi+320*2*20]
                lea     ecx,[ecx-320*20]
              Buf2Scr16Loop:
                lea     ecx,[ecx-1]
                mov     al,[esi+ecx*4+2]
                shr     al,3
                shl     eax,6
                mov     bl,[esi+ecx*4+1]
                shr     bl,2
                add     al,bl
                shl     eax,5
                mov     bl,[esi+ecx*4]
                shr     bl,3
                add     al,bl
                mov     [edi+ecx*2],ax
                test    ecx,ecx
                jne     Buf2Scr16Loop
                ret
bUF2sCR16       ENDP

Buf2Scr24       PROC
                lea    esi,[esi+320*4*20]
                lea    edi,[edi+320*3*20]
                lea    ecx,[ecx-320*20]
              Buf2Scr24Loop:
                lea     ecx,[ecx-1]
                mov     eax,[esi]
                mov     [edi],eax
                lea     esi,[esi+4]
                lea     edi,[edi+3]
                test    ecx,ecx
                jnz     Buf2Scr24Loop
                ret
Buf2Scr24       ENDP

Buf2Scr32       PROC
                lea    esi,[esi+320*4*20]
                lea    edi,[edi+320*4*20]
                lea    ecx,[ecx-320*20]
              Buf2Scr32Loop:
                lea     ecx,[ecx-1]
                mov     eax,[esi+ecx*4]
                mov     [edi+ecx*4],eax
                test    ecx,ecx
                jne     Buf2Scr32Loop
                ret
Buf2Scr32       ENDP

Buf2Scr32D      PROC
                lea    esi,[esi+320*4*20]
                lea    edi,[edi+640*4*20]
                lea    ecx,[ecx-320*20]
              Buf2Scr32DLoop:
                lea     ecx,[ecx-1]
                mov     eax,[esi+ecx*4]
                mov     [edi+ecx*8],eax
                mov     [edi+ecx*8+4],eax
                test    ecx,ecx
                jne     Buf2Scr32DLoop
                ret
Buf2Scr32D      ENDP

Buf2ScrGray     PROC
                mov     edx,0             ; swap bank
                xor     ebx,ebx
                mov     ax,4f05h
                int     10h

                mov    edi,0a0000h
                lea    esi,[esi+320*4*20]
                lea    edi,[edi+320*20]
                mov    ecx,320*184+256
                xor    ebx,ebx
                xor    edx,edx
              GrayLoop:
                lea     ecx,[ecx-1]
                mov     eax,[esi+ecx*4]
                mov     bl,ah
                mov     dl,al
                shl     eax,8
                shr     eax,24
                add     eax,ebx
                shr     eax,1
                add     eax,edx
                shr     eax,1
                mov     [edi+ecx],al
                test    ecx,ecx
                jnz     GrayLoop

                mov     edx,1             ; swap bank
                xor     ebx,ebx
                mov     ax,4f05h
                int     10h

                mov    edi,0a0000h
                mov    ecx,320*40
                xor    ebx,ebx
                xor    edx,edx
              GrayLoopB2:
                lea     ecx,[ecx-1]
                mov     eax,[esi+ecx*4+320*184*4+256*4]
                mov     bl,ah
                mov     dl,al
                shl     eax,8
                shr     eax,24
                add     eax,ebx
                shr     eax,1
                add     eax,edx
                shr     eax,1
                mov     [edi+ecx],al
                test    ecx,ecx
                jnz     GrayLoopB2

                ret
Buf2ScrGray     ENDP

Double          PROC
                push    ax
                push    dx
                mov     dx,3D4h
                mov     al,9
                out     dx,al
                inc     dx
                mov     al,1
                out     dx,al
                pop     dx
                pop     ax
                ret
Double          ENDP

SetGrayPal      PROC
                mov  dx,3c8h
                xor  al,al
                out  dx,al
                inc  dx
                xor  al,al
              SGPLoop:
                mov  ecx,12
              ki:
                out  dx,al
                lea  ecx,[ecx-1]
                test ecx,ecx
                jnz  ki


                inc  al
                cmp  al,64
                jne  SGPLoop
                ret
SetGrayPal      ENDP

jmp     SError