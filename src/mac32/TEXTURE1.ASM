;       תתתתתתתתשששששששש----======[Texture 1]=====------שששששששששתתתתתתתתת
;      תתתתתתתתשששששששש----======[Create Grid]=====------שששששששששתתתתתתתתת

                mov     ecx,256*256
                mov     edi,Textu1Add
                call    ClearB

                mov     edi,Textu1Add
                mov     esi,offset Mini
                lea     esi,[esi+18*48+50]
                call    Grid

                mov     edi,Textu1Add
                call    Interpolate
