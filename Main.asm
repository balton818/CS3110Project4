; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00


*=$0900
PROGRAM_START

        ;setup 'interrupt' handling
        lda #<ANIMATION_ROUTINE
        sta $0314
        lda #>ANIMATION_ROUTINE
        sta $0315

        ;transfer EYE_FRONT_DATA byte info to memory
        ldx #0
eye_front_data_loop
        lda EYE_FRONT_DATA,X
        sta $2e80,X
        inx
        cpx #64
        bne eye_front_data_loop

        ;transfer EYE_LEFT_DATA byte info to memory
        ldx #0
eye_left_data_loop
        lda EYE_LEFT_DATA,X
        sta $2ec0,X
        inx
        cpx #64
        bne eye_left_data_loop

        ;transfer EYE_RIGHT_DATA byte info to memory
        ldx #0
eye_right_data_loop
        lda EYE_RIGHT_DATA,X
        sta $2f00,X
        inx
        cpx #64
        bne eye_right_data_loop

        ;set sprite 0 pointer to first frame (eye-front)
        lda #$2e80/64
        sta $07f8

        ;set sprite 0 x-position
        lda #%00111111
        ldx #%00000001
        sta $d000
        stx $d010

        ;set sprite 0 y-position
        lda #50
        sta $d001
        
        ;enable sprite 0
        lda #1
        sta $d015

COUNTER BYTE 00
        jsr ANIMATION_ROUTINE


PROGRAM_END
        rts
        
ANIMATION_ROUTINE
        lda COUNTER
        adc #1
        sta COUNTER
        jmp $fffe


EYE_FRONT_DATA
; eye_front
 BYTE $00,$7E,$00
 BYTE $03,$81,$C0
 BYTE $0C,$7E,$30
 BYTE $13,$FF,$C8
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $5F,$FF,$FA
 BYTE $5F,$C3,$FA
 BYTE $5F,$81,$FA
 BYTE $BF,$00,$FD
 BYTE $BF,$00,$FD
 BYTE $BF,$00,$FD
 BYTE $5F,$81,$FA
 BYTE $5F,$C3,$FA
 BYTE $5F,$FF,$FA
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $13,$FF,$C8
 BYTE $0C,$7E,$30
 BYTE $03,$81,$C0
 BYTE $00,$7E,$00
 BYTE $00

EYE_LEFT_DATA
; eye_left
 BYTE $00,$7E,$00
 BYTE $03,$81,$C0
 BYTE $0C,$7E,$30
 BYTE $13,$FF,$C8
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $5F,$FF,$FA
 BYTE $5C,$7F,$FA
 BYTE $58,$3F,$FA
 BYTE $B8,$3F,$FD
 BYTE $B8,$3F,$FD
 BYTE $B8,$3F,$FD
 BYTE $58,$3F,$FA
 BYTE $5C,$7F,$FA
 BYTE $5F,$FF,$FA
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $13,$FF,$C8
 BYTE $0C,$7E,$30
 BYTE $03,$81,$C0
 BYTE $00,$7E,$00
 BYTE $00

EYE_RIGHT_DATA
; eye right
 BYTE $00,$7E,$00
 BYTE $03,$81,$C0
 BYTE $0C,$7E,$30
 BYTE $13,$FF,$C8
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $5F,$FF,$FA
 BYTE $5F,$FE,$3A
 BYTE $5F,$FC,$1A
 BYTE $BF,$FC,$1D
 BYTE $BF,$FC,$1D
 BYTE $BF,$FC,$1D
 BYTE $5F,$FC,$1A
 BYTE $5F,$FE,$3A
 BYTE $5F,$FF,$FA
 BYTE $2F,$FF,$F4
 BYTE $2F,$FF,$F4
 BYTE $13,$FF,$C8
 BYTE $0C,$7E,$30
 BYTE $03,$81,$C0
 BYTE $00,$7E,$00
 BYTE $00

