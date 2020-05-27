;
; TP1.2.asm
;
; Created: 20/5/2020 15:08:00
; Author : Jose Maria Borgatello
;

.include "m328pdef.inc"

.equ PBX=0 ; Led en PB0

.equ PUERTOB=0x01	;(PORTB completo como salida)

.cseg 
.org 0x0000
			jmp		main

.org INT_VECTORS_SIZE

main:
			
; Configuro puerto B
			ldi		r23,PUERTOB
			out		DDRB,r23

xsiempre:

; rutina de encendido y apagado
		
prendo:		sbi		PORTB,PBX 	; encendido del led
	

demora1:
			ldi 	r20,0x00
			ldi 	r21,0x00
			ldi		r22,0x03
ciclo1:		inc		r20
			cpi		r20,0xff
			brlo	ciclo1
			ldi		r20,0x00
			inc		r21
			cpi		r21,0xff
			brlo	ciclo1
			ldi		r21,0x00
			inc		r22
			cpi		r22,0x20
			brlo	ciclo1
			
			
			cbi		PORTB,PBX		; apagado del led

demora2:
			ldi 	r20,0x00
			ldi 	r21,0x00
			ldi		r22,0x01
ciclo2:		inc		r20
			cpi		r20,0xff
			brlo	ciclo2
			ldi		r20,0x00
			inc		r21
			cpi		r21,0xff
			brlo	ciclo2
			ldi		r21,0x00
			inc		r22
			cpi		r22,0x20
			brlo	ciclo2

			rjmp xsiempre