.data   
i:  .word   3
j:  .word   3
f:  .word   0
g:  .word   4
h:  .word   7

.text   
main:
    # Load to registers
    lw      $s3,    i
    lw      $s4,    j
    lw      $s0,    f
    lw      $s1,    g
    lw      $s2,    h

    #  check if i == j
    bne     $s3,    $s4,    ELSE
    add     $s0,    $s1,    $s2
    j       END

ELSE:
    sub     $s0,    $s1,    $s2

END:
