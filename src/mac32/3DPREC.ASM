;   תתתתתתתשששששששש----======[MAC32\3dPREC.ASM]=====------שששששששששתתתתתתת
;code bY BamboOS^CruX

;   תתתתתתתתשששששששש----======[Create 3d Box]=====------שששששששששתתתתתתתתת

                LOCALS
                mov     esi,PBoxAdd
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][4]
                mov     ValZ,-100
                fild    ValZ
                fstp    dword ptr[esi][8]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jl      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jl      @@Loop1
                NOLOCALS

bambooshandlyrandomtext:

                LOCALS
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][4]
                mov     ValZ,100
                fild    ValZ
                fstp    dword ptr[esi][8]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jl      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jl      @@Loop1
                NOLOCALS

bambooooooooosssssssararganfdgklafd:

                LOCALS
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi][8]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][4]
                mov     ValZ,-100
                fild    ValZ
                fstp    dword ptr[esi]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jl      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jl      @@Loop1
                mov     [esi],0e0c72dh
                NOLOCALS

sdfasdfasrandomRANDOM:

                LOCALS
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi][8]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][4]
                mov     ValZ,100
                fild    ValZ
                fstp    dword ptr[esi]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jl      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jl      @@Loop1
                mov     [esi],0e0c72dh
                NOLOCALS

bambooooooooosssssssararganfdgklafd2:

                LOCALS
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][8]
                mov     ValZ,-100
                fild    ValZ
                fstp    dword ptr[esi][4]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jl      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jl      @@Loop1
                mov     [esi],0e0c72dh
                NOLOCALS

sdfasdfasrandomRANDOM2:

                LOCALS
                mov     edx,-100
              @@Loop1:
                mov     ecx,-100
              @@Loop1In:
                mov     ValX,ecx
                fild    ValX
                fstp    dword ptr[esi]
                mov     ValY,edx
                fild    ValY
                fstp    dword ptr[esi][8]
                mov     ValZ,100
                fild    ValZ
                fstp    dword ptr[esi][4]
                lea     ecx,[ecx+40]
                lea     esi,[esi+16]
                cmp     ecx,100
                jle      @@Loop1In
                lea     edx,[edx+40]
                cmp     edx,100
                jle      @@Loop1
                mov     [esi],0e0c72dh
                NOLOCALS

;תתתתתשששששששש----======[Copy Sphere (word 2 float)]=====------שששששששששתתתתת

                LOCALS
                mov     esi,offset SphereW
                mov     edi,SphereAdd
              @@FlipLoop:
                fild    word ptr [esi]
                fstp    dword ptr[edi]
                fild    word ptr [esi+2]
                fstp    dword ptr[edi+4]
                fild    word ptr [esi+4]
                fstp    dword ptr[edi+8]
                lea     esi,[esi+6]
                lea     edi,[edi+16]
                cmp     dword ptr[esi],0e0c72dh
                jne     @@FlipLoop
                mov     [edi],0e0c72dh
                NOLOCALS

; תתתתתתתשששששששש----======[eof MAC32\3dPREC.ASM]=====------שששששששששתתתתתתת
