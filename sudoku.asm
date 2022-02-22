.data
    a: .space 1000
    lin: .space 1000
    col: .space 1000
    patrat: .space 1000
    gasit: .space 4
    file: .space 4
    citireD: .asciz "%d"
    afisareD: .asciz "%d "
    endl: .asciz "\n"
    afisareS: .asciz "%s"
    input_file: .asciz "input.txt"
    output_file: .asciz "output.txt"
    format_read: .asciz "r"
    format_write: .asciz "w"

   

.text



afisarem:
    pushl %ebp
    movl %esp, %ebp

    pushl %ebx
    pushl %esi
    pushl %edi
    
    pushl $format_write
    pushl $output_file
    call fopen
    popl %ebx
    popl %ebx
    movl %eax, file

    xorl %ecx, %ecx
    xorl %ebx, %ebx
forAfisare:
    movl 8(%ebp), %eax
    cmp %eax, %ecx
    je exitAfisare
inceputLinie:
    movl 12(%ebp), %eax
    cmp %eax, %ebx
    je finalLinie

    movl 12(%ebp), %eax
    xorl %edx, %edx
    mull %ecx
    addl %ebx, %eax
    movl 16(%ebp), %edi
    pushl %ecx
    pushl (%edi, %eax, 4)
    pushl $afisareD
    pushl file
    call fprintf
    popl %eax
    popl %eax
    popl %eax
    popl %ecx
    incl %ebx
    jmp inceputLinie

finalLinie:
    xorl %ebx, %ebx
    incl %ecx
    pushl %ecx
    pushl $endl
    pushl $afisareS
    pushl file
    call fprintf
    popl %eax
    popl %eax
    popl %eax
    popl %ecx



    jmp forAfisare
exitAfisare:
    pushl file
    call fclose
    popl %eax
    popl %ebx
    popl %esi
    popl %edi
    popl %ebp
    ret

#x y
backt:
    pushl %ebp
    movl %esp, %ebp

    pushl %ebx
    pushl %esi
    pushl %edi
    
et10:

    movl 8(%ebp), %eax
    cmp $9, %eax
    jl notFound
    
    
    movl $1, %eax
    movl %eax, gasit
    pushl $a
    pushl $9
    pushl $9
    call afisarem
    popl %eax
    popl %eax
    popl %eax


    popl %edi
    popl %esi
    popl %ebx
    popl %ebp
    ret


notFound:
    movl 8(%ebp), %eax
    xorl %edx, %edx
    movl $9, %ecx
    mull %ecx
    addl 12(%ebp), %eax
    lea a, %edi
    movl (%edi, %eax, 4),%esi
    cmp $0, %esi
    jg next

    xorl %ecx, %ecx
et_for1:
    incl %ecx
    cmp $10, %ecx
    je end_for1
    
    movl $10, %eax
    xorl %edx, %edx
    movl 12(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea col, %edi
    movl (%edi, %eax, 4), %ebx
    cmp $0, %ebx
    jg et_for1

    movl $10, %eax
    xorl %edx, %edx
    movl 8(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea lin, %edi
    movl (%edi, %eax, 4), %ebx
    cmp $0, %ebx
    jg et_for1

    movl $9, %eax
    xorl %edx, %edx
    mull %ecx
    pushl %eax
    movl 12(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    pushl %eax
    movl 8(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    xorl %edx, %edx
    movl $3, %edi
    mull %edi
    addl 0(%esp), %eax
    addl 4(%esp), %eax
    lea patrat, %edi
    movl (%edi, %eax, 4), %ebx
    popl %eax
    popl %eax
    cmp $0, %ebx
    jg et_for1

  
    
    movl $10, %eax
    xorl %edx, %edx
    movl 12(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea col, %edi
    movl $1,(%edi, %eax, 4)

    movl $10, %eax
    xorl %edx, %edx
    movl 8(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea lin, %edi
    movl $1,(%edi, %eax, 4) 

    movl $9, %eax
    xorl %edx, %edx
    mull %ecx
    pushl %eax
    movl 12(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    pushl %eax
    movl 8(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    xorl %edx, %edx
    movl $3, %edi
    mull %edi
    addl 0(%esp), %eax
    addl 4(%esp), %eax
    lea patrat, %edi
    movl $1, (%edi, %eax, 4)
    popl %ebx
    popl %ebx


    movl $9, %eax
    movl 8(%ebp), %ebx
    xorl %edx, %edx
    mull %ebx
    addl 12(%ebp), %eax
    lea a, %edi
    movl %ecx, (%edi, %eax, 4)
   
   
   
    movl 12(%ebp), %eax
    cmp $8, %eax
    jge et3
    
    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    incl %ebx
    pushl %ecx
    pushl %ebx
    pushl %eax
    call backt
    popl %eax
    popl %eax
    popl %ecx
    jmp et_6

et3:

    movl 8(%ebp), %eax
    xorl %ebx, %ebx
    incl %eax
    pushl %ecx
    pushl %ebx
    pushl %eax
    call backt
    popl %eax
    popl %eax
    popl %ecx
et_6:
    movl $10, %eax
    xorl %edx, %edx
    movl 12(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea col, %edi
    movl $0,(%edi, %eax, 4)

    movl $10, %eax
    xorl %edx, %edx
    movl 8(%ebp), %ebx
    mull %ebx
    addl %ecx, %eax
    lea lin, %edi
    movl $0,(%edi, %eax, 4) 

    movl $9, %eax
    xorl %edx, %edx
    mull %ecx
    pushl %eax
    movl 12(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    pushl %eax
    movl 8(%ebp), %ebx
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    xorl %edx, %edx
    movl $3, %edi
    mull %edi
    addl 0(%esp), %eax
    addl 4(%esp), %eax
    lea patrat, %edi
    movl $0, (%edi, %eax, 4)
    popl %ebx
    popl %ebx


    movl $9, %eax
    movl 8(%ebp), %ebx
    xorl %edx, %edx
    mull %ebx
    addl 12(%ebp), %eax
    lea a, %edi
    movl $0, (%edi, %eax, 4)
    jmp et_for1
next:   
    movl 12(%ebp), %eax
    cmp $8, %eax
    jge et4
    
    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    incl %ebx
    pushl %ecx
    pushl %ebx
    pushl %eax
    call backt
    popl %eax
    popl %eax
    popl %ecx

    popl %edi
    popl %esi
    popl %ebx
    popl %ebp
    ret
et4:

    movl 8(%ebp), %eax
    xorl %ebx, %ebx
    incl %eax
    pushl %ecx
    pushl %ebx
    pushl %eax
    call backt
    popl %eax
    popl %eax
    popl %ecx

    popl %edi
    popl %esi
    popl %ebx
    popl %ebp
    ret
end_for1:
    
    popl %edi
    popl %esi
    popl %ebx
    popl %ebp
    ret



.globl main

main:
    pushl $format_read
    pushl $input_file
    call fopen
    popl %ebx
    popl %ebx
    movl %eax, file
    xorl %ecx, %ecx
    lea a, %edi
    xorl %ebx, %ebx
citire_a:
    cmp $9, %ebx
    je end_citire_a

    xorl %ecx, %ecx
    
citire_linie:
    cmp $9, %ecx
    je final_citire_linie

    movl $9, %eax
    xorl %edx, %edx
    mull %ebx
    addl %ecx, %eax
    xorl %edx, %edx
    movl $4, %edi
    mull %edi
    lea a, %edi
    addl %eax, %edi
    pushl %ecx
    pushl %eax
    pushl %edi
    pushl $citireD
    pushl file
    call fscanf
    popl %eax
    popl %eax
    popl %eax
    popl %eax
    popl %ecx

    movl 0(%edi), %esi
    cmp $0, %esi
    je et1

    movl $10, %eax
    xorl %edx, %edx
    mull %ecx
    addl %esi, %eax
    lea col, %edi
    movl $1, (%edi, %eax, 4)

    movl $10, %eax
    xorl %edx, %edx
    mull %ebx
    addl %esi, %eax
    lea lin, %edi
    movl $1, (%edi, %eax, 4)

    movl $9, %eax
    xorl %edx, %edx
    mull %esi
    pushl %eax
    movl %ecx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    pushl %eax
    movl %ebx, %eax
    xorl %edx, %edx
    movl $3, %edi
    divl %edi
    xorl %edx, %edx
    movl $3, %edi
    mull %edi
    addl 0(%esp), %eax
    addl 4(%esp), %eax
    lea patrat, %edi
    movl $1,(%edi, %eax, 4)


et1:
    incl %ecx
    jmp citire_linie
final_citire_linie:
    incl %ebx
    jmp citire_a
end_citire_a:
    pushl file
    call fclose
    popl %ebx
    pushl $0
    call fflush
    popl %eax
    pushl $0
    pushl $0
    call backt
    popl %eax
    popl %eax

exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80

