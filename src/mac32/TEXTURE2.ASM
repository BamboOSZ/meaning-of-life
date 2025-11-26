;code bY BamboOS^CruX
; make texture
;    תתתתתתתתשששששששש----======[Texture 2]=====------שששששששששתתתתתתתתת
;   תתתתתתתתשששששששש----======[Create Grid]=====------שששששששששתתתתתתתתת

                LOCALS
                mov     esi,offset Tex1
                mov     edi,Buffer2Add
                xor     ecx,ecx
              @@FlipLoop:
                mov     eax,[esi]
                mov     [edi],eax
                lea     ecx,[ecx+1]
                lea     esi,[esi+3]
                lea     edi,[edi+4]
                cmp     ecx,32*32*4
                jne     @@FlipLoop
                NOLOCALS

                mov     edi,Textu2Add
                mov     esi,Buffer2Add
                call    Gridt

                mov     edi,Textu2Add
                call    Interpolate

                mov     edi,Textu2Add
                add     edi,1
                call    Interpolate

                mov     edi,Textu2Add
                add     edi,2
                call    Interpolate
