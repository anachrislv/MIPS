addi $sp, $sp, -32 #δημιουργώ 8 θέσεις στη στοίβα
sw $s0, 0($sp) #θέλω να χρησιμοποιήσω στη συνάρτησή μου τον καταχωρητή
$s0 όμως δε γνωρίζω εάν και πως χρησιμοποιείται στο κύριο πρόγραμμα οπότε αποθηκεύω το περιεχόμενό του στη στοίβα
sw $s1, 4($sp) #ομοίως
sw $s2, 8($sp) #ομοίως
sw $s3, 12($sp) #ομοίως
sw $s4, 16($sp) #ομοίως
sw $s5, 20($sp) #ομοίως
sw $s6, 24($sp) #ομοίως
sw $s7, 28($sp) #ομοίως
addi $s0, $zero, 0 #s0=low=0
addi $s1, $a1, -1 #s1=up=N-1
slt $t0, $s1, $s0 #αν up<low t0=1
bne $t0, $zero, EXIT7 #αν $t0!=0, δηλαδή αν up<low, πηγαίνω στο ΕΧΙΤ7
LOOP:sll $t1, $s0, 2 #t1=4low
sll $t2, $s1, 2 #t2=4up
add $t3, $a0, $t1 #t3=διεύθυνση στην οποία βρίσκεται το A[low]
add $t4, $a0, $t2 #t4=διεύθυνση στην οποία βρίσκεται το A[up]
lw $t5, 0($t3) #t5=A[low]
lw $t6, 0($t4) #t6=A[up]
slt $t7, $a2, $t5 #t7=1 αν key<A[low]
slt $t8, $t6, $a2 #t8=1 αν key>Α[up]
or $t9, $t7, $t8 #t9=1 αν t7||t8
bne $t9, $zero, EXIT7 #Αν t9!=0 πηγαίνω στο EXIT7
sub $s2, $s1, $s0 #s2=up-low
sub $s3, $a2, $t5 #s3=key-a[low]
sub $s4, $t6, $t5 #s4=a[up]-a[low]
div $s5, $s3, $s4 #s5=s3/s4
mul $s6, $s2, $s5 #s6=s2*s5
add $s5, $s0, $s6 #Το περιεχόμενο του καταχωρητή $s5 ισούται με αυτό της μεταβλητής pos
sll $s4, $s8, 2 #s4=4pos
add $s2, $a0, $s4 #Διεύθυνση Α[pos]
lw $s3, 0($s2) #s3=A[pos]
beq $s3, $a2, EXIT8 #Αν Α[pos]=N πηγαίνω στο ΕΧΙΤ8
slt $t0, $s3, $a2 #t0=1 αν a[pos]<key
beq $t0, $zero, HI2 #Αν pos>key πηγαίνω στο ΗΙ2
bne $t0, $zero, HI3 #Αν pos<key πηγαίνω στο ΗΙ3
HI4: slt $t0, $s1, $s0 #αν up<low t0=1
bne $t0, $zero, EXIT7 #αν up<low πηγαίνω στο ΕΧΙΤ7
beq $t0, $zero, LOOP #αν up>low πηγαίνω στο LOOP
HI2:addi $s1, $s5, -1 #s1=pos-1
j HI4 #πηγαίνω στο ΗΙ4
HI3:addi $s0, $s5, 1 #s0=pos+1
j HI4 #πηγαίνω στο ΗΙ4
EXIT7:addi $v1, $zero, -1 #v1=-1, ώστε να επιστραφεί -1
lw $s7, 28($sp) #επαναφέρω την αρχική τιμή του $s7
lw $s6, 24($sp)
lw $s5, 20($sp)
lw $s4, 16($sp)
lw $s3, 12($sp)
lw $s2, 8($sp)
lw $s1, 4($sp)
lw $s0, 0($sp)
addi $sp, $sp, 32 #διαγράφω 8 στοιχεία από τη
στοίβα
jr $ra #επιστρέφω στη συνάρτηση που
με κάλεσε
EXIT7:addi $v1, $s5, 0 #v1=pos
lw $s7, 28($sp) #επαναφέρω την αρχική τιμή του $s7
lw $s6, 24($sp)
lw $s5, 20($sp)
lw $s4, 16($sp)
lw $s3, 12($sp)
lw $s2, 8($sp)
lw $s1, 4($sp)
lw $s0, 0($sp)
addi $sp, $sp, 32 #διαγράφω 8 στοιχεία από τη στοίβα
jr $ra #επιστρέφω στη συνάρτηση που με κάλεσε
