;; Comments outside the program
section .data
string:
.str db ";; Comments outside the program%2$csection .data%2$cstring:%2$c.str db %3$c%1$s%3$c;%2$c%2$csection .text%2$cextern printf%2$cglobal main%2$c%2$cuseless_function:%2$cret;%2$c%2$cmain:%2$c;; Comments inside the program%2$cpush rbp;%2$cmov rbp, rsp;%2$clea rdi, [rel string.str];%2$clea rsi, [rel string.str];%2$cmov rdx, 10;%2$cmov rcx, 34;%2$ccall printf;%2$ccall useless_function;%2$cleave;%2$cret;%2$c";

section .text
extern printf
global main

useless_function:
ret;

main:
;; Comments inside the program
push rbp;
mov rbp, rsp;
lea rdi, [rel string.str];
lea rsi, [rel string.str];
mov rdx, 10;
mov rcx, 34;
call printf;
call useless_function;
leave;
ret;
