section .data
	msg: db "Hello world!", 0x0a
	msglen: equ $ - msg         ; $:current(end), msg(start), len=end-start
	
section .text
	global _start
		_start:
			mov  rdi, 2			; rdi: arg0, 2: stderr
			; "Hello world!\n": 0a21646c726f77206f6c6c6548 (reversed)
			;mov  rbx, 0x0a21646c72
			;push rbx			; little-endian, reversed again
			;mov  rbx, 0x6f77206f6c6c6548
			;push rbx
			
			;sub  rsp, 16
			;mov  rbx, 0x6f77206f6c6c6548
			;mov  [rsp], rbx
			;mov  rbx, 0x0a21646c72
			;mov  [rsp + 8], rbx

			;mov  rsi, rsp		; rsi: arg1
			;mov  rdx, 13		; rdx: arg2
			
			mov  rsi, msg
			mov  rdx, msglen
			
			mov  rax, 1			; rax: syscall -> write
			syscall
			
			mov  rdi, 0         ; exit 0
			mov  rax, 60		; rax: syscall -> exit
			syscall
