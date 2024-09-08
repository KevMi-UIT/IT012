.data   

str_prompt_in_num_of_eles:  .asciiz "Nhap so phan tu cua mang: "
str_prompt_in_ele:          .asciiz "Nhap phan tu: "
str_promp_in_index:         .asciiz "Nhap chi so phan tu: "
str_min:                    .asciiz "Phan tu nho nhat: "
str_max:                    .asciiz "Phan tu lon nhat: "
str_sum:                    .asciiz "Tong cua mang: "
str_index_value:            .asciiz "Phan tu tai index vua nhap: "
end_line_char:              .asciiz "\n"
array:                      .space  100

.text   

main:                       

input_array:                
    li      $v0,                4
    la      $a0,                str_prompt_in_num_of_eles
    syscall 
    li      $v0,                5
    syscall 
    move    $s0,                $v0
    la      $s1,                array

read_array:                 
    li      $t0,                0

loop_read_array:            
    bge     $t0,                $s0,                        prepare_min
    la      $a0,                str_prompt_in_ele
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    add     $t1,                $s1,                        $t0
    sb      $v0,                0($t1)
    addi    $t0,                $t0,                        1
    j       loop_read_array

prepare_min:                
    li      $t0,                1
    lb      $s2,                0($s1)

loop_get_min:               
    bge     $t0,                $s0,                        print_min
    add     $t1,                $s1,                        $t0
    addi    $t0,                $t0,                        1
    lb      $t2,                0($t1)
    bge     $t2,                $s2,                        loop_get_min
    move    $s2,                $t2
    j       loop_get_min

print_min:                  
    li      $v0,                4
    la      $a0,                str_min
    syscall 
    move    $a0,                $s2
    li      $v0,                1
    syscall 

    jal     print_end_line

prepare_max:                
    li      $t0,                1
    lb      $s3,                0($s1)

loop_get_max:               
    bge     $t0,                $s0,                        print_max
    add     $t1,                $s1,                        $t0
    addi    $t0,                $t0,                        1
    lb      $t2,                0($t1)
    ble     $t2,                $s3,                        loop_get_max
    move    $s3,                $t2
    j       loop_get_max

print_max:                  
    li      $v0,                4
    la      $a0,                str_max
    syscall 
    move    $a0,                $s3
    li      $v0,                1
    syscall 

    jal     print_end_line

prepare_sum:                
    li      $t0,                0
    li      $s4,                0

loop_get_sum:               
    bge     $t0,                $s0,                        print_sum
    add     $t1,                $s1,                        $t0
    lb      $t2,                0($t1)
    add     $s4,                $s4,                        $t2
    addi    $t0,                $t0,                        1
    j       loop_get_sum

print_sum:                  
    li      $v0,                4
    la      $a0,                str_sum
    syscall 
    move    $a0,                $s4
    li      $v0,                1
    syscall 

    jal     print_end_line

input_index:                
    la      $a0,                str_promp_in_index
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $t0,                $v0

print_index_value:          
    la      $a0,                str_index_value
    li      $v0,                4
    syscall 
    add     $t1,                $t0,                        $s1
    lb      $a0,                0($t1)
    li      $v0,                1
    syscall 

end:                        
    j       exit

print_end_line:             
    la      $a0,                end_line_char
    li      $v0,                4
    syscall 
    jr      $ra

exit:                       