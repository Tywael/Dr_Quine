section .note.GNU-stack noalloc noexec nowrite progbits

section .bss
filename resb 50
command resb 128
f_ptr resq 1

section .data
self: db __FILE__, 0
src: db "section .note.GNU-stack noalloc noexec nowrite progbits", 10, 10, "section .bss", 10, "filename resb 50", 10, "command resb 128", 10, "f_ptr resq 1", 10, "section .data", 10, "self: db __FILE__, 0", 10, "src: db ", 34, "%1$s", 34, 10, "cmd: db ", 34, "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o && ./Sully_%1$d", 34, ", 0", 10, "filename_format: db ", 34, "Sully_%d.s", 34, ", 0", 10, "mode: db ", 34, "w", 34, ", 0", 10, "basename: db ", 34, "Sully.s", 34, ", 0", 10, 10, "section .text", 10, "extern strcmp, sprintf, fopen, fprintf, fclose, system", 10, "global main", 10, 10, "main:", 10, "push rbp", 10, "mov rbp, rsp", 10, "mov rbx, 5", 10, "lea rdi, [rel self]", 10, "lea rsi, [rel basename]", 10, "call strcmp", 10, "test rax, rax", 10, "jnz decrement_rbx", 10, 10, "decrement_rbx:", 10, "dec rbx", 10, "cmp rbx, 0", 10, "jl exit_program", 10, "lea rdi, [rel filename]", 10, "lea rsi, [rel filename_format]", 10, "mov rdx, rbx", 10, "call sprintf", 10, "lea rsi, [rel mode]", 10, "call fopen", 10, "mov [rel f_ptr], rax", 10, "test rax, rax", 10, "jz exit_program", 10, "mov rdi, [rel f_ptr]", 10, "lea rsi, [rel src]", 10, "mov rdx, rbx", 10, "lea rcx, [rel src]", 10, "call fprintf", 10, "mov rdi, [rel f_ptr]", 10, "call fclose", 10, "lea rdi, [rel command]", 10, "lea rsi, [rel cmd]", 10, "mov rdx, rbx", 10, "lea rcx, [rel filename]", 10, "mov r8, rbx", 10, "call sprintf", 10, "lea rdi, [rel command]", 10, "call system", 10, 10, "exit_program:", 10, "mov rsp, rbp", 10, "pop rbp", 10, "mov rax, 60", 10, "xor rdi, rdi", 10, "syscall", 0
cmd: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o && ./Sully_%1$d", 0
filename_format: db "Sully_%d.s", 0
mode: db "w", 0
basename: db "Sully.s", 0
debug: db "Ici %d", 10, 0

section .text
extern strcmp, sprintf, fopen, fprintf, fclose, system, printf
global main

main:
push rbp
mov rbp, rsp
mov rbx, 5
lea rdi, [rel self]
lea rsi, [rel basename]
call strcmp
test rax, rax
jnz decrement_rbx

decrement_rbx:
dec rbx
cmp rbx, 0
jl exit_program
lea rdi, [rel filename]
lea rsi, [rel filename_format]
mov rdx, rbx
call sprintf
lea rdi, [rel filename]
lea rsi, [rel mode]
call fopen
mov [rel f_ptr], rax
test rax, rax
jz exit_program
mov rdi, [rel f_ptr]
lea rsi, [rel src]
mov rdx, rbx
lea rcx, [rel src]
call fprintf
mov rdi, [rel f_ptr]
call fclose
lea rdi, [rel command]
lea rsi, [rel cmd]
mov rdx, rbx
lea rcx, [rel filename]
mov r8, rbx
call sprintf
lea rdi, [rel command]
call system
jmp exit_program

exit_program:
mov rsp, rbp
pop rbp
mov rax, 60
xor rdi, rdi
syscall

