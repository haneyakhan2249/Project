.data:
       characters: .space 10 #creating array to store characters
       vowels: .asciiz "aeiou"
.text
       la $s0, characters #storing it in register $s0
       li $t7, 0 #temporary register $t7 to store counter 
 
randomletters:
       li $a1, 26 #range of characters
       li $v0, 42 #random character
       syscall
       addi $a0, $a0, 97 #starting at lower case a - lower case z
       sb $a0, ($s0)
       
       addi $s0, $s0, 1 #moving to next character 
       addi $t7, $t7, 1 #incrementing counter 
       blt $t7, 8 , randomletters #branching through to get 8 random characters
       sb $zero, 0($s0)
       add $t6, $zero, $zero
       addi $t1, $zero, 1
       addi $t2, $zero, 2
       addi $t3, $zero, 3
       addi $t4, $zero, 4
       addi $t5, $zero, 5
       
GenerateVowels:
       li $a1, 6 #range of characters
       li $v0, 42 #random character
       syscall
       move $t0, $a0
       beq $t0, $t1, addA
       beq $t0, $t2, addE
       beq $t0, $t3, addI
       beq $t0, $t4, addO
       beq $t0, $t5, addU
        
       #generating random vowels    
       addA: 
       la $s1, vowels
       lb $s2, 0($s1) 
       sb $s2, ($s0)
       j printLetters
       addE:
       la $s1, vowels
       lb $s2, 1($s1)
       sb $s2, ($s0) 
       j printLetters
       addI:
       la $s1, vowels
       lb $s2, 2($s1) 
       sb $s2, ($s0)
       j printLetters
       addO:
       la $s1, vowels
       lb $s2, 3($s1) 
       sb $s2, ($s0)
       j printLetters
       addU:
       la $s1, vowels
       lb $s2, 4($s1) 
       sb $s2, ($s0)
       j printLetters      
printLetters: 
       la $a0, characters #printing the random characters
       li $v0, 4
       syscall
       
      #Reset Register
      move $t0, $zero
      move $t1, $zero
      move $t2, $zero
      move $t3, $zero
      move $t4, $zero
      move $t5, $zero
      move $t6, $zero
      move $t7, $zero
      move $s1, $zero
      move $s2, $zero