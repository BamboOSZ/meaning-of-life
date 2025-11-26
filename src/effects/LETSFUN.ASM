; code bY BamboOS^CruX
; Let's fun with bitmaps...

;    תתתתתתתתשששששששש----======[Letz Funzz]=====------שששששששששתתתתתתתתת
;                          with shading 2 white
;                            gReEtz 2 [and|3
; in:
;  ebp - Table of effect
;  esi - Texture 256x256x32b
;  edi - Buffer out

LetsFun         PROC
                LOCALS
                xor     ebx,ebx
                xor     ecx,ecx
              @@Looop:
                xor     edx,edx
              @@LooopIn:
                push    ecx
                push    edx
                mov     eax,[ebp]
                sar     eax,16
                ; offset in texture
                add     ecx,eax
                mov     bl,cl
                mov     ecx,ebx
              @@EcxOki:

                add     edx,eax
                mov     bl,dl
                mov     edx,ebx
              @@EdxOki:

                shl     ecx,10
                lea     edx,[ecx+edx*4]
                ; now shade
                test    eax,80000000h
                jz      @@EaxoKI
                neg     eax
              @@EaxOki:

                shr     eax,2
                mov     ecx,[esi+edx]
                mov     bl,cl
                add     ebx,eax
                cmp     ebx,255
                jl      @@BOk
                mov     ebx,255
              @@BOk:
                mov     [edi],bl

                mov     bl,ch
                add     ebx,eax
                cmp     ebx,255
                jl      @@GOk
                mov     ebx,255
              @@GOk:
                shr     ecx,8
                mov     [edi+1],bl

                mov     bl,ch
                add     ebx,eax
                cmp     ebx,255
                jl      @@ROk
                mov     ebx,255
              @@ROk:
                mov     [edi+2],bl
                ; thats all
                lea     edi,[edi+4]
                lea     ebp,[ebp+4]
                pop     edx
                pop     ecx
                lea     edx,[edx+1]
                cmp     edx,320
                jne     @@LooopIn
                lea     ecx,[ecx+1]
                lea     ebp,[ebp+320*4]
                cmp     ecx,200
                jne     @@Looop
                NOLOCALS
                ret
LetsFun         ENDP

;                          with shading 2 black
;                            gReEtz 2 [and|3
; in:
;  ebp - Table of effect
;  esi - Texture 256x256x32b
;  edi - Buffer out

LetsFunB        PROC
                LOCALS
                xor     ebx,ebx
                xor     ecx,ecx
              @@Looop:
                xor     edx,edx
              @@LooopIn:
                push    ecx
                push    edx
                mov     eax,[ebp]
                sar     eax,16
                ; offset in texture
                add     ecx,eax
                test    ch,ch
                jz      @@EcxOki
                mov     bl,cl
                mov     ecx,ebx
              @@EcxOki:

                add     edx,eax
                test    dh,dh
                mov     bl,dl
                mov     edx,ebx
              @@EdxOki:

                shl     ecx,10
                lea     edx,[ecx+edx*4]
                ; now shade
                test    eax,80000000h
                jz      @@EaxoKI
                neg     eax
              @@EaxOki:

                shr     eax,3
                mov     ecx,[esi+edx]
                mov     bl,cl
                sub     ebx,eax
;                test    bh,bh
;                jz      @@BOk
                cmp     ebx,0
                jg      @@BOk
                mov     ebx,0
              @@BOk:
                mov     [edi],bl

                mov     bl,ch
                sub     ebx,eax
;                test    bh,bh
;                jz      @@GOk
                cmp     ebx,0
                jg      @@GOk
                mov     ebx,0
              @@GOk:
                shr     ecx,8
                mov     [edi+1],bl

                mov     bl,ch
                sub     ebx,eax
;                test    bh,bh
;                jz      @@ROk
                cmp     ebx,0
                jg      @@ROk
                mov     ebx,0
              @@ROk:
                mov     [edi+2],bl
                ; thats all
                lea     edi,[edi+4]
                lea     ebp,[ebp+4]
                pop     edx
                pop     ecx
                lea     edx,[edx+1]
                cmp     edx,320
                jne     @@LooopIn
                lea     ecx,[ecx+1]
                lea     ebp,[ebp+320*4]
                cmp     ecx,200
                jne     @@Looop
                NOLOCALS
                ret
LetsFunB        ENDP
