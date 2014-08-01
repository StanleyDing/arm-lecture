	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
        push {R1, R2}
        MOV R2, #locked
loop:
        LDREX R1, [R0]
        CMP R1, #locked
        BEQ loop
        STREX R1, R2, [R0]
        CMP R1, #0
        BNE loop
        POP {R1, R2}
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        PUSH {R1}
        MOV R1, #unlocked
        STR R1, [R0]
        POP {R1}
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
