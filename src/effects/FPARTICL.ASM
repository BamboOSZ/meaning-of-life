;                           CruX's Particle System

; Draw Particles
; in:
;  esi - offset of CPS Data (end with e0c72d < eocpsd > )

CPSDraw         PROC
                LOCALS
              CPSLoop:
                fld     dword ptr [esi+8]
                fild    CorZ
                fadd
                fist    ValZ
                cmp     ValZ,1
                fstp    ValZ
                jl      SWrong

                fld     dword ptr [esi]
                fld     FoViewX
                fmul                           ; field of view
                fld     ValZ
                fdiv                           ; div x*p/z
                fistp   ValX
                mov     eax,ValX               ; cor X
                add     eax,CorX               ; center on screen
                fld     dword ptr [esi+4]
                fld     FoViewY
                fmul
                fld     ValZ
                fdiv                           ; div x*p/z
                fistp   ValY
                mov     ebx,ValY               ; cor Y
                add     ebx,CorY
                ; some limits
                cmp     eax,10
                jl      SWrong
                cmp     eax,310
                jg      SWrong
                cmp     ebx,35
                jl      SWrong
                cmp     ebx,205
                jg      SWrong
                ; count offset
                shl     eax,2
                lea     ecx,[ebx]
                shl     ecx,10
                shl     ebx,8
                lea     eax,[eax+ebx]
                lea     eax,[eax+ecx]
                ; put it on screen
                fld     ValZ
                fistp   ValZ
                mov     ecx,ValZ
                shr     ecx,3
                mov     edx,110
                sub     edx,ecx
                cmp     edx,9
                jg      @@Okg
                mov     edx,9
              @@Okg:
                cmp     edx,110
                jl      @@Okl
                mov     edx,110
              @@Okl:
                push    esi
                mov     esi,FlareAdd
                mov     edi,BufferAdd
                add     edi,eax
;                mov     [edi],0ffffffffh
                call    ReSize
                pop     esi
              SWrong:
                lea     esi,[esi+16]
                cmp     dword ptr[esi],0e0c72dh
                jne     CPSLoop
                ret
                NOLOCALS
CPSDraw         ENDP

; RotateP
; in:
;  edi  - offset of CPS Data In (end with e0c72d < eocpsd > )
;  AngXf - angle X
;  AngYf - angle Y
;  AngZf - angle Z

RotateP PROC
        fld     AngXf
        fldpi
        fmul
        mov     ValX,2
        fild    ValX
        fmul
        mov     ValX,360
        fild    ValX
        fdiv
        fst     ValX
        fsin
        fstp    SinX
        fld     ValX
        fcos
        fstp    CosX

        fld     AngYf
        fldpi
        fmul
        mov     ValX,2
        fild    ValX
        fmul
        mov     ValX,360
        fild    ValX
        fdiv
        fst     ValX
        fsin
        fstp    SinY
        fld     ValX
        fcos
        fstp    CosY

        fld     AngZf
        fldpi
        fmul
        mov     ValX,2
        fild    ValX
        fmul
        mov     ValX,360
        fild    ValX
        fdiv
        fst     ValX
        fsin
        fstp    SinZ
        fld     ValX
        fcos
        fstp    CosZ

      RotateLoop:
        fld     qword ptr[esi]
        fld     dword ptr[esi][8]
        fstp    dword ptr[edi][8]
        fstp    qword ptr[edi]
;jmp nx
        ;obrot wokol osi OX
        ;Y'=Y*cos(katx)+Z*sin(katx)
        fld     dword ptr[edi][4]
        fld     CosX
        fmul
        fld     dword ptr[edi][8]
        fld     SinX
        fmul
        fadd
        fstp    Ready
        ;Z'=oblicz Z*cos(katx)-Y*sin(katx)
        fld     dword ptr[edi][8]
        fld     CosX
        fmul
        fld     dword ptr[edi][4]
        fld     SinX
        fmul
        fsub
        fstp    dword ptr[edi][8]
        fld     Ready
        fstp    dword ptr[edi][4]
nx:
;jmp ny
        ;obrot wokol osi OY
        ;X'=X*cos(katy)-Z*sin(katy)
        fld     dword ptr[edi]
        fld     CosY
        fmul
        fld     dword ptr[edi][8]
        fld     SinY
        fmul
        fsub
        fstp    Ready
        ;Z'=Z*cos(katy)+X*sin(katy)
        fld     dword ptr[edi][8]
        fld     CosY
        fmul
        fld     dword ptr[edi]
        fld     SinY
        fmul
        fadd
        fstp    dword ptr[edi][8]
        fld     Ready
        fstp    dword ptr[edi]
ny:
;jmp nz
        ;obrot wokol osi OZ
;        X'=X*cos(GAMA)-Y*sin(GAMA)
        fld     dword ptr[edi]
        fld     CosZ
        fmul
        fld     dword ptr[edi][4]
        fld     SinZ
        fmul
        fsub
        fstp    Ready
;       Y'=X*sin(GAMA)+Y*cos(GAMA)
        fld     dword ptr[edi][4]
        fld     CosZ
        fmul
        fld     dword ptr[edi]
        fld     SinZ
        fmul
        fadd
        fstp    dword ptr[edi][4]
        fld     Ready
        fstp    dword ptr[edi]
nz:
        lea     esi,[esi+16]
        lea     edi,[edi+16]
        cmp     dword ptr[esi],0e0c72dh
        jne     RotateLoop
        mov     [edi],0e0c72dh
        ret
RotateP ENDP

; Rotate with Timer
; in:
;  edi  - offset of CPS Data In (end with e0c72d < eocpsd > )
;  esi  - Data out
;  ebx  - Angle X 
;  ecx  - Angle Y 
;  edx  - Angle Z 

Rotate          PROC
                LOCALS
                call    SoundGetTimer
                sub     eax,LastVR
                mov     ValY,ebx       ; Angle X
                fild    ValY
                mov     ValX,eax
                fild    ValX
                fild    TimerMax
                fdiv
                fst     ValX
                fmul

                fld     AngXf
                fadd
                fist    ValY
                fstp    AngXf
                cmp     ValY,360
                jl      @@Okx
                mov     AngXf,0
              @@Okx:

                mov     ValY,ecx       ; Angle Y
                fild    ValY
                fld     ValX
                fmul

                fld     AngYf
                fadd
                fist    ValY
                fstp    AngYf
                cmp     ValY,360
                jb      @@Oky
                mov     AngYf,0
              @@Oky:

                mov     ValY,edx       ; Angle Z
                fild    ValY
                fld     ValX
                fmul

                fld     AngZf
                fadd
                fist    ValY
                fstp    AngZf
                cmp     ValY,360
                jb      @@Okz
                mov     AngZf,0
              @@Okz:
                NOLOCALS

                call    SoundGetTimer
                mov     LastVR,eax

                call    RotateP
                ret
Rotate          ENDP

