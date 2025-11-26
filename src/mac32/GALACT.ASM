;code bY BamboOS^CruX
;תתתתתשששששששש----======[Copy Galact (word 2 float)]=====------שששששששששתתתתת
                anotherRANDOMtextBYbamboosOFcrux:


                LOCALS
                mov     esi,offset GalactW
                mov     edi,GalactAdd
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

