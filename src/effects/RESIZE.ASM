;code bY BamboOS^CruX
ReSize          PROC      ; in esi picture  (64x64x32bit) to edi (32b) edx-multipl

                xor     ecx,ecx
                push    edi
                mov     edi,Tab4RAdd
              Tab4X:                   ; create table 4 resizing horiz
                lea     eax,[ecx]
                push    edx            ;
                mul     edx            ; mul X  (multipler shl 8)
                shr     eax,8          ; value shr 8
                mov     [edi+ecx*4],eax    ; save X to tab of resize
                pop     edx            ;/
                lea     ecx,[ecx+1]
                cmp     ecx,64         ; do it 64 times
                jne     Tab4X

                xor     ecx,ecx
                mov     edi,Tab4RAdd
                add     edi,64*4
                lea     ebx,[ecx]

              Tab4Y:
                push    edx
                lea     eax,[ecx]
                mul     edx
                pop     edx
                shr     eax,8
                push    eax
                sub     eax,ebx    ; in ebx old value of eax
                lea     ebx,[eax]
                shl     eax,8
                shl     ebx,6
                lea     eax,[eax+ebx]
                lea     eax,[eax*4]
                mov     [edi+ecx*4],eax
                pop     ebx        ; replace eax with ebx
                lea     ecx,[ecx+1]
                cmp     ecx,64
                jne     Tab4Y
                pop     edi

                ; position of begin
                mov     eax,64
                mul     edx
                push    eax
                shr     eax,9
                mov     edx,eax
                shl     edx,10
                shl     eax,8
                add     edx,eax
                pop     eax
                shr     eax,7
                and     eax,11111111111111111111111111111100b
                add     eax,edx
                sub     edi,eax

                ; let's draw
                xor     eax,eax
                mov     ebx,Tab4RAdd
                xor     ecx,ecx
                mov     ebp,1
              ReSizeLoopMain:
                mov     ebp,[ebx+64*4+ecx*4]
                cmp     ebp,0
                je      NextLine
                push    ebp
                push    ecx
                xor     ecx,ecx
              ReSizeLoopIn:
                push    ecx
                lea     edx,[ebp]
                mov     ebp,[ebx+ecx*4]
                lea     ebp,[edi+ebp*4]
                cmp     edx,ebp
                je      RSInNext

                mov     al,[esi]
                test    eax,eax
                jz      RSInNext

                mov     cl,[ebp+2]
                lea     eax,[eax+ecx]
        ÿÿÿ     test    ah,ah
                jz      ColorROki
                mov     eax,255
              ColorROki:
                mov      [ebp+2],al

                mov     al,[esi]
                mov     cl,[ebp+1]
                lea     eax,[eax+ecx]
        ÿÿÿ     test    ah,ah
                jz      ColorGOki
                mov     eax,255
              ColorGOki:
                mov      [ebp+1],al

                mov     al,[esi]
                mov     cl,[ebp]
                lea     eax,[eax+ecx]
        ÿÿÿ     test    ah,ah
                jz      ColorBOki
                mov     eax,255
              ColorBOki:
                mov      [ebp],al

              RSInNext:
                lea     esi,[esi+1]
                pop     ecx
                lea     ecx,[ecx+1]
                cmp     ecx,64
                jne     ReSizeLoopIn
                pop     ecx
                pop     ebp
                jmp     OldebpOK
              NextLine:
                lea     esi,[esi+64]
              OldebpOk:
                lea     ecx,[ecx+1]
                lea     edi,[edi+ebp]
                cmp     ecx,64
                jne     ReSizeLoopMain
                ret
ReSize          ENDP