section .bss
filename resb 50
command resb 128
f_ptr resq 1

section .data
self: db __FILE__, 0
src: db "section .bss%1$cfilename resb 50%1$ccommand resb 128%1$cf_ptr resq 1%1$c%1$csection .data%1$cself: db __FILE__, 0%1$csrc: db %2$c%3$s%2$c, 0%1$ccmd: db %2$cnasm -f elf64 -DPIC Sully_%%1$d.s -o Sully_%%1$d.o && gcc -no-pie Sully_%%1$d.o -o Sully_%%1$d && rm -f Sully_%%1$d.o && ./Sully_%%1$d%2$c, 0%1$cfilename_format: db %2$cSully_%%d.s%2$c, 0%1$cmode: db %2$cw%2$c, 0%1$cbasename: db %2$cSully.s%2$c, 0%1$c%1$csection .text%1$cextern strcmp, sprintf, fopen, fprintf, fclose, system, printf%1$cglobal main%1$c%1$cmain:%1$cpush rbp%1$cmov rbp, rsp%1$cmov rbx, %4$d%1$clea rdi, [rel self]%1$clea rsi, [rel basename]%1$ccall strcmp%1$ctest rax, rax%1$cjnz decrement_rbx%1$c%1$cdecrement_rbx:%1$cdec rbx%1$ccmp rbx, 0%1$cjl exit_program%1$clea rdi, [rel filename]%1$clea rsi, [rel filename_format]%1$cmov rdx, rbx%1$ccall sprintf%1$clea rdi, [rel filename]%1$clea rsi, [rel mode]%1$ccall fopen%1$cmov [rel f_ptr], rax%1$ctest rax, rax%1$cjz exit_program%1$cmov rdi, [rel f_ptr]%1$clea rsi, [rel src]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel src]%1$cmov r9, rbx%1$ccall fprintf%1$cmov rdi, [rel f_ptr]%1$ccall fclose%1$clea rdi, [rel command]%1$clea rsi, [rel cmd]%1$cmov rdx, rbx%1$clea rcx, [rel filename]%1$cmov r8, rbx%1$ccall sprintf%1$clea rdi, [rel command]%1$ccall system%1$cjmp exit_program%1$c%1$cexit_program:%1$cmov rsp, rbp%1$cpop rbp%1$cmov rax, 60%1$cxor rdi, rdi%1$csyscall", 0
cmd: db "nasm -f elf64 -DPIC Sully_%1$d.s -o Sully_%1$d.o && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o && ./Sully_%1$d", 0
filename_format: db "Sully_%d.s", 0
mode: db "w", 0
basename: db "Sully.s", 0

section .text
extern strcmp, sprintf, fopen, fprintf, fclose, system, printf
global main

main:
push rbp
mov rbp, rsp
mov rbx, 6
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
mov rdx, 10
mov rcx, 34
lea r8, [rel src]
mov r9, rbx
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