;
; TP1.2.asm
;
; Created: 20/5/2020 15:08:00
; Author : Jose Maria Borgatello
;

	.include "m328pdef.inc"


; (PORTB  con bit 0 solamente como salida)
	.equ PUERTOB=0x01
	
	.cseg
	
	.org 0x0000
	
	jmp	main
	
	.org INT_VECTORS_SIZE
	
main:

; Configuro puerto B

	ldi	r23,PUERTOB
	out	DDRB,r23
	
; rutina infinita
xsiempre:

; rutina de encendido y apagado
prendo:

;encendido del led
	sbi	PORTB,0
	
; Bucle Demora 1
demora1:
	ldi     r20,0x00
	ldi     r21,0x00
	ldi	r22,0x00

ciclo1:
	inc	r20
	cpi	r20,0xff
	brlo	ciclo1
	ldi	r20,0x00
	
	inc	r21
	cpi	r21,0xff
	brlo	ciclo1
	ldi	r21,0x00
	
	inc	r22
	cpi	r22,0x20
	brlo	ciclo1

; apagado del led			
	cbi	PORTB,0

; Bucle Demora 2
demora2:
	ldi     r20,0x00
	ldi     r21,0x00
	ldi	r22,0x00

ciclo2:
	inc	r20
	cpi	r20,0xff
	brlo	ciclo2
	ldi	r20,0x00
	
	inc	r21
	cpi	r21,0xff
	brlo	ciclo2
	ldi	r21,0x00
	
	inc	r22
	cpi	r22,0x20
	brlo	ciclo2

	rjmp xsiempre
