;code bY BamboOSSSSS ruleZZZ 4 ever :)))))))

; Interpolation (4 texture) 8x8
; in:
;  edi - buffer 2 interp
Interpolate     PROC
                LOCALS
;  תתתתתתתתשששששששש----======[Interpolate Horiz]=====------שששששששששתתתתתתתתת
                push    edi
                mov     ValY,0
              @@InterpolateXLoop:
                xor     edx,edx
              @@InterpolateXLoopIn:
                xor     eax,eax
                xor     ebx,ebx
                mov     al,[edi+edx]
                mov     bl,[edi+edx+8*4]
                cmp     eax,ebx
                jg      @@C1Greater
                sub     ebx,eax
                xchg    eax,ebx
                shr     eax,3
                xor     ecx,ecx
                lea     ebp,[edx]
              @@IC1lLoop:
                push    eax
                push    edx
                mul     ecx
                pop     edx
                add     eax,ebx
                mov     [edi+ebp],al
                lea     ecx,[ecx+1]
                pop     eax
                lea     ebp,[ebp+4]
                cmp     ecx,8
                jl      @@IC1lLoop
                jmp     @@IntFin
              @@C1Greater:
                sub     eax,ebx
                shr     eax,3
                mov     ecx,8
                lea     ebp,[edx]
              @@IC1gLoop:
                push    eax
                push    edx
                mul     ecx
                pop     edx
                add     eax,ebx
                mov     [edi+ebp],al
                lea     ecx,[ecx-1]
                pop     eax
                lea     ebp,[ebp+4]
                cmp     ecx,0
                jg      @@IC1gLoop
              @@IntFin:
                lea     edx,[edx+8*4]
                cmp     edx,256*4
                jl      @@InterpolateXLoopIn
                add     ValY,1
                lea     edi,[edi+256*4*8]
                cmp     ValY,33
                jl      @@InterpolateXLoop


; תתתתתתתתשששששששש----======[Interpolate Vertic]=====------שששששששששתתתתתתתתת

                pop     edi
                mov     ValY,0
              @@InterpolateYLoop:
                xor     edx,edx
              @@InterpolateYLoopIn:
                xor     eax,eax
                xor     ebx,ebx
                mov     al,[edi+edx]
                mov     bl,[edi+edx+256*4*8]
                cmp     eax,ebx
                jg      @@C1GreaterY
                sub     ebx,eax
                xchg    eax,ebx
                shr     eax,3
                xor     ecx,ecx
                lea     ebp,[edx]
              @@IC1lLoopY:
                push    eax
                push    edx
                mul     ecx
                pop     edx
                add     eax,ebx
                mov     [edi+ebp],al
                lea     ecx,[ecx+1]
                pop     eax
                lea     ebp,[ebp+256*4]
                cmp     ecx,8
                jl      @@IC1lLoopY
                jmp     @@IntFinY
              @@C1GreaterY:
                sub     eax,ebx
                shr     eax,3
                mov     ecx,8
                lea     ebp,[edx]
              @@IC1gLoopY:
                push    eax
                push    edx
                mul     ecx
                pop     edx
                add     eax,ebx
                mov     [edi+ebp],al
                lea     ecx,[ecx-1]
                pop     eax
                lea     ebp,[ebp+4*256]
                cmp     ecx,0
                jg      @@IC1gLoopY
              @@IntFinY:
                lea     edx,[edx+4]
                cmp     edx,256*4
                jl      @@InterpolateYLoopIn
                add     ValY,1
                lea     edi,[edi+256*4*8]
                cmp     ValY,33
                jl      @@InterpolateYLoop
                NOLOCALS
                ret
Interpolate     ENDP

; make grid 8x8 for texture (4 interp) texture1
; in:
;  edi - texture add
;  esi - grid buffer
Grid            PROC
                LOCALS
                push    edi
                xor     ecx,ecx
              @@CreateGridLoop:
                xor     edx,edx
              @@CreateGridLoopIn:
                mov     al,[esi]
                mov     [edi+edx],al
                lea     esi,[esi+16]
                lea     edx,[edx+8*4]
                cmp     edx,256*4
                jne     @@CreateGridLoopIn
                lea     ecx,[ecx+1]
                mov     al,[edi]
                mov     [edi+edx],al
                lea     edi,[edi+256*4*8]
                cmp     ecx,32
                jne     @@CreateGridLoop

                pop     edi
                xor     ecx,ecx
              @@GridTsameBE:
                mov     al,[edi]
                mov     [edi+256*256*4],al
                lea     ecx,[ecx+8]
                lea     edi,[edi+8*4]
                cmp     ecx,256
                jne     @@GridTsameBE
                NOLOCALS
                ret
Grid            ENDP

; make grid 8x8 for texture (4 interp) textures 2,3
; in:
;  edi - texture add
;  esi - grid buffer
Gridt           PROC
                LOCALS
                push    edi
                xor     ecx,ecx
              @@CreateGridLoop:
                xor     edx,edx
              @@CreateGridLoopIn:
                mov     eax,[esi]
                mov     [edi+edx],eax
                lea     esi,[esi+4]
                lea     edx,[edx+8*4]
                cmp     edx,256*4
                jne     @@CreateGridLoopIn
                lea     ecx,[ecx+1]
                mov     eax,[edi]
                mov     [edi+edx],eax
                lea     edi,[edi+256*4*8]
                cmp     ecx,32
                jne     @@CreateGridLoop

                pop     edi
                xor     ecx,ecx
              @@GridTsameBE:
                mov     eax,[edi]
                mov     [edi+256*256*4],eax
                lea     ecx,[ecx+8]
                lea     edi,[edi+8*4]
                cmp     ecx,256
                jne     @@GridTsameBE
                NOLOCALS
                ret
Gridt           ENDP
