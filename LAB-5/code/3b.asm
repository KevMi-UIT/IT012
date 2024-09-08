.data   

str_prompt_in_1:    .asciiz "Nhap so phan tu cua mang: "
str_prompt_in_2:    .asciiz "Nhap phan tu: "
str_prompt_in_i:    .asciiz "Nhap i: "
str_prompt_in_j:    .asciiz "Nhap j: "
tab_char:           .asciiz "\t"
array:              .space  100

.text   

main:               

read_number_of_eles_of_arr:
    li      $v0,        4
    la      $a0,        str_prompt_in_1
    syscall 
    li      $v0,        5
    syscall 
    move    $t0,        $v0
    la      $a3,        array
    li      $t1,        0

read_array:         
    bge     $t1,        $t0,                input_i_j
    li      $v0,        4
    la      $a0,        str_prompt_in_2
    syscall 
    li      $v0,        5
    syscall 
    add     $t5,        $a3,                $t1
    sb      $v0,        0($t5)
    addi    $t1,        $t1,                1
    j       read_array

input_i_j:          
    la      $s3,        array
    li      $v0,        4
    la      $a0,        str_prompt_in_i
    syscall 
    li      $v0,        5
    syscall 
    move    $s0,        $v0
    li      $v0,        4
    la      $a0,        str_prompt_in_j
    syscall 
    li      $v0,        5
    syscall 
    move    $s1,        $v0

compare_i_j:        
    add     $t3,        $s3,                $s0
    blt     $s0,        $s1,                asign_i
    j       asign_j

asign_i:            
    sb      $s0,        0($t3)
    j       continue_2

asign_j:            
    sb      $s1,        0($t3)

continue_2:         
    la      $a3,        array
    li      $t1,        0

print:              
    bge     $t1,        $t0,                end
    add     $t5,        $a3,                $t1
    lb      $a0,        0($t5)
    li      $v0,        1
    syscall 
    jal     print_tab
    addi    $t1,        $t1,                1
    j       print

end:                
    j       exit

print_tab:          
    la      $a0,        tab_char
    li      $v0,        4
    syscall 
    jr      $ra

exit:               