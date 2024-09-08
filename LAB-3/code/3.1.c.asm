.data   
buffer: .space  200

.text   
li      $v0,    8
la      $a0,    buffer
li      $a1,    200
syscall 
li      $v0,    4
la      $a0,    buffer
syscall 
