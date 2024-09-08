.data
string1 :      .asciiz    "Chao  ban! Ban la sinh vien nam thu may?"
string2 :      .asciiz    "Hihi  minh la sinh vien nam thu 1 ^-^"
newline :      .asciiz    "\n"
.text
li      $v0    4
la      $a0    string1
syscall 
li      $v0    4
la      $a0    newline
syscall 
li      $v0    4
la      $a0    string2
syscall 
