;code bY BamboOS^CruX
; make texture
;    תתתתתתתתשששששששש----======[Texture 3]=====------שששששששששתתתתתתתתת
;   תתתתתתתתשששששששש----======[Create Grid]=====------שששששששששתתתתתתתתת
                raandofmasdfasd:

                LOCALS
                mov     esi,offset Tex2
                mov     edi,Buffer2Add
                xor     ecx,ecx
              @@FlipLoop:
                mov     eax,[esi]
                shl     eax,8
                mov     [edi],eax
                lea     ecx,[ecx+1]
                lea     esi,[esi+2]
                lea     edi,[edi+4]
                cmp     ecx,32*32*4
                jne     @@FlipLoop
                NOLOCALS

                mov     edi,Textu3Add
                mov     esi,Buffer2Add
                call    Gridt


                mov     edi,Textu3Add
                mov     eax,[edi+256*4]
                mov     [edi+256*256*4],eax
                call    Interpolate

                mov     edi,Textu3Add
                add     edi,1
                call    Interpolate

                mov     edi,Textu3Add
                add     edi,2
                call    Interpolate
