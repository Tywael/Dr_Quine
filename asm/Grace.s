%define FILENAME "Grace_kid.s"
%define CONTENT "%%define FILENAME %3$cGrace_kid.s%3$c%2$c%%define CONTENT %3$c%1$s%3$c%2$c%2$c%%macro NOT_MAIN 0%2$csection .note.GNU-stack noalloc noexec nowrite progbits%2$csection .data%2$cstring:%2$c.str db CONTENT, 0;%2$c.filename db FILENAME, 0;%2$c.mode db %3$cw%3$c 0;%2$c%2$csection .text%2$cextern fopen, fprintf, fclose, exit%2$cglobal main%2$c%2$cmain:%2$cpush rbp;%2$cmov rbp, rsp;%2$c%2$cmov rdi, string.filename;%2$cmov rsi, string.mode;%2$ccall fopen;%2$cmov rbx, rax;%2$c%2$ctest rbx, rbx;%2$cjz exit_failur;%2$c%2$cmov rdi, rbx;%2$cmov rsi, string.str;%2$cmov rdx, string.str;%2$cmov rcx, 10;%2$cmov r8, 34;%2$ccall fprintf;%2$c%2$cmov rdi, rbx;%2$ccall fclose;%2$c%2$cleave;%2$cret;%2$c%2$cexit_failur:%2$cmov rdi, 1;%2$ccall exit;%2$c%%endmacro%2$c;; Definitly not a main%2$cNOT_MAIN"

%macro NOT_MAIN 0
section .note.GNU-stack noalloc noexec nowrite progbits
section .data
string:
.str db CONTENT, 0;
.filename db FILENAME, 0;
.mode db "w" 0;

section .text
extern fopen, fprintf, fclose, exit
global main

main:
push rbp;
mov rbp, rsp;

mov rdi, string.filename;
mov rsi, string.mode;
call fopen;
mov rbx, rax;

test rbx, rbx;
jz exit_failur;

mov rdi, rbx;
mov rsi, string.str;
mov rdx, string.str;
mov rcx, 10;
mov r8, 34;
call fprintf;

mov rdi, rbx;
call fclose;

leave;
ret;

exit_failur:
mov rdi, 1;
call exit;
%endmacro
;; Definitly not a main
NOT_MAIN