.data   
a:  .word   6
b:  .word   5
c:  .word   0
d:  .word   0

.text   
main:
    # Load to registers
    lw      $s0,    a
    lw      $s1,    b
    lw      $s2,    c
    lw      $s3,    d

    # Calculate
    sub     $s2,    $s0,    $s1
    add     $s3,    $s0,    $s1

    # Store to memory
    sw      $s2,    c
    sw      $s3,    d
