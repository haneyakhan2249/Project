.data:
       characters: .space 9 #creating array to store characters
.text
       la $s0, characters #storing it in register $s0
       li $t1, 0 #temporary register $t0 to store counter 
 
randomletters:
       li $a1, 26 #range of characters
       li $v0, 42 #random character
       syscall
       addi $a0, $a0, 97 #starting at lower case a - lower case z
       sb $a0, ($s0)
       
       addi $s0, $s0, 1 #moving to next character 
       addi $t1, $t1, 1 #incrementing counter 
       blt $t1, 9 , randomletters #branching through to get 9 random characters
       sb $zero, 0($s0)
       
       la $a0, characters #printing the random characters
       li $v0, 4
       syscall
       