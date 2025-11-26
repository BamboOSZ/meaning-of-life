;code bY BamboOS^CruX
                mov     ecx,64*64
                mov     edi,FlareAdd
                call    ClearB
                ; x=r*sin(counter)+maxx/2
                ; y=r*cos(counter)+maxy/2
                LOCALS
                mov     ValZ,0
              @@FlareLoop:
                mov     esi,FlareAdd
                xor     edx,edx
              @@CircleLoop:
                fild     ValZ
                mov      ValX,edx
                fild     ValX
                mov      ValX,64
                fild     ValX
                fdiv
                fst      ValY
                fsin
                fmul
                fistp    ValX
                add      ValX,32

                fild     ValZ
                fld      ValY
                fcos
                fmul
                fistp    ValY
                add      ValY,32
                shl      ValY,6
                mov      eax,ValX
                add      eax,ValY
                mov      ebx,30
                sub      ebx,ValZ
                shl      ebx,3
                mov      byte ptr[esi][eax],bl

                lea     edx,[edx+1]
                cmp     edx,400
                jne     @@CircleLoop
                inc     ValZ
                cmp     ValZ,31
                jne     @@FlareLoop
                NOLOCALS

