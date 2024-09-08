.data   
array1:                         .word   5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1:                          .word   10
array2:                         .byte   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2:                          .word   16
array3:                         .space  8
size3:                          .word   8
tr_print_arr_1:                 .asciiz "xuat mang 1:"
str_print_arr_2:                .asciiz "xuat mang 2:"
str_print_arr_3:                .asciiz "xuat mang 3:"
str_print_prompt_input:         .asciiz "Nhap thu tu mang can truy xuat: "
str_print_prompt_input_index:   .asciiz "Nhap index cua mang: "
tab_char:                       .asciiz "\t"
end_line_char:                  .asciiz "\n"

.text   

main:                           

print_arr_1:                    
    la      $a0,                str_print_arr_1
    li      $v0,                4
    syscall 
    jal     print_end_line
    la      $s1,                array1
    lw      $s2,                size1

    li      $t0,                0

loop_print_arr_1:               
    bge     $t0,                $s2,                            continue_1
    sll     $t1,                $t0,                            2
    add     $t1,                $t1,                            $s1
    lw      $a0,                0($t1)
    li      $v0,                1
    syscall 
    addi    $t0,                $t0,                            1
    jal     print_tab
    j       loop_print_arr_1

continue_1:                     
    jal     print_end_line

print_arr_2:                    
    la      $a0,                str_print_arr_2
    li      $v0,                4
    syscall 
    jal     print_end_line
    la      $s1,                array2
    lw      $s2,                size2

    li      $t0,                0

loop_print_arr_2:               
    bge     $t0,                $s2,                            continue_2
    add     $t1,                $t0,                            $s1
    lb      $a0,                0($t1)
    li      $v0,                1
    syscall 
    addi    $t0,                $t0,                            1
    jal     print_tab
    j       loop_print_arr_2

continue_2:                     
    jal     print_end_line

prepare_arr_3:                  
    la      $s1,                array2
    lw      $s2,                size2
    lw      $s3,                size2
    add     $s3,                $s3,                            $s1
    subi    $s3,                $s3,                            1
    la      $s4,                array3
    lw      $s5,                size3
    move    $s6,                $s4
    li      $t0,                0
    move    $t1,                $s3

loop_process_arr_3:             
    bge     $t0,                $s5,                            continue_3
    add     $t2,                $s1,                            $t0
    lb      $t3,                0($t2)
    lb      $t4,                0($t1)
    add     $t5,                $t3,                            $t4
    sb      $t5,                0($s6)
    addi    $t0,                $t0,                            1
    subi    $t1,                $t1,                            1
    addi    $s6,                $s6,                            1
    j       loop_process_arr_3

continue_3:                     
    jal     print_end_line

prepare_print_arr_3:            
    la      $a0,                str_print_arr_3
    li      $v0,                4
    syscall 
    jal     print_end_line
    la      $s1,                array3
    lw      $s2,                size3

    li      $t0,                0

loop_print_arr_3:               
    bge     $t0,                $s2,                            continue_4
    add     $t1,                $t0,                            $s1
    lb      $a0,                0($t1)
    li      $v0,                1
    syscall 
    addi    $t0,                $t0,                            1
    jal     print_tab
    j       loop_print_arr_3

continue_4:                     
    jal     print_end_line

prompt_user_input_which_arr:    
    la      $a0,                str_print_prompt_input
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $s0,                $v0

prompt_user_input_which_index:  
    la      $a0,                str_print_prompt_input_index
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $s1,                $v0

compare_input:                  
    li      $t0,                1
    beq     $s0,                $t0,                            get_ele_of_arr_1
    li      $t0,                2
    beq     $s0,                $t0,                            get_ele_of_arr_2
    li      $t0,                3
    beq     $s0,                $t0,                            get_ele_of_arr_3

get_ele_of_arr_1:               
    la      $s3,                array1
    sll     $s1,                $s1,                            2
    add     $s4,                $s3,                            $s1
    lw      $s5,                0($s4)
    j       print_got_ele

get_ele_of_arr_2:               
    la      $s3,                array2
    add     $s4,                $s3,                            $s1
    lb      $s5,                0($s4)
    j       print_got_ele

get_ele_of_arr_3:               
    la      $s3,                array3
    add     $s4,                $s3,                            $s1
    lb      $s5,                0($s4)
    j       print_got_ele

print_got_ele:                  

    move    $a0,                $s5
    li      $v0,                1
    syscall 

end:                            
    j       exit

print_tab:                      
    la      $a0,                tab_char
    li      $v0,                4
    syscall 
    jr      $ra

print_end_line:                 
    la      $a0,                end_line_char
    li      $v0,                4
    syscall 
    jr      $ra

exit:                           