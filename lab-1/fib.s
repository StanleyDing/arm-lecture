	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {R3, R4, R5, R6, lr}

        @ R0 <= 0
        CMP R0, #0
        ITT LE
        MOVLE R0, #0
        BLE return

        @ R0 == 1
        CMP R0, #1
        IT EQ
        BEQ return

        @ R0 > 1
        MOV R3, #0
        MOV R4, #1
        MOV R5, #0

        MOV R6, #1

        @ for (i = 2; i <= n; ++i)
loop:
        ADD R6, #1
        CMP R6, R0
        ITTT LE
        ADDLE R5, R3, R4
        MOVLE R3, R4
        MOVLE R4, R5
        BLE loop

        MOV R0, R5
return:
	pop {r3, r4, r5, r6, pc}		@EPILOG
	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
