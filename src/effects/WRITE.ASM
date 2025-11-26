;code bY BamboOS^UniversE

;                  hmm...    what thiz procas may doing ??? :)

;in
; esi - text with end $
; ebp - font (12x16)
; edi - buffer 2 write (32bit BGRA)

WriteT          PROC
              WriteRepeat:
                xor     eax,eax
                mov     al,[esi]
                cmp     al,36
                je      WriteLeave
                lea     eax,[eax-65]
              WriteNumbEr:
                lea     esi,[esi+1]
                mov     edx,12
                mul     edx
                mov     ecx,16
                push    edi
              WriteLoop:
                push    ecx
                mov     ecx,12
              WriteLoopIn:
                mov     bl,[ebp+eax]
                test    bl,bl
                jz      TransP
                mov     [edi],bl
              TransP:
                lea     edi,[edi+1]
                lea     ecx,[ecx-1]
                lea     eax,[eax+1]
                test    ecx,ecx
                jnz     WriteLoopIn
                pop     ecx
                lea     edi,[edi+308]
                lea     eax,[eax+376-12]
                lea     ecx,[ecx-1]
                test    ecx,ecx
                jnz     WriteLoop
                pop     edi
                lea     edi,[edi+12]
                jmp     WriteRepeat
              WriteLeave:
                ret
WriteT          ENDP