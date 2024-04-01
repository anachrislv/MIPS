Interpolation_search_rec:
addi $sp, $sp, -4 #δημιουργώ 8 θέσεις στη στοίβα
sw $ra, 0($sp) #αποθηκεύω την τιμή του $ra
στη στοίβα, ώστε να μπορώ να
επιστρέψω αργότερα στη
συνάρτηση που κάλεσε την
Interpolation_search_rec
HI1: slt $t0, $a2, $a1 #t0=1 αν up<low
sll $t1, $a1, 2 #t1=4low
sll $t2, $a2, 2 #t2=4up
add $t1, $t1, $a0 #t1=διεύθυνση του Α[low]
add $t2, $t2, $a0 #t2=διεύθυνση του Α[up]
lw $t3, 0($t1) #t3=A[low]
lw $t4, 0($t2) #t4=A[up]
slt $t5, $a3, $t3 #t5=1 αν key<a[low]
slt $t6, $t4, $a3 #t6=1 αν a[up]<key
bne $t0, $zero, BYE1 #αν $t0!=0 πηγαίνω στο ΒΥΕ1
bne $t5, $zero, BYE1 #αν $t5!=0 πηγαίνω στο ΒΥΕ1
bne $t6, $zero, BYE1 #αν $t6!=0 πηγαίνω στο ΒΥΕ1
sub $t0, $a2, $a1 #t0=up-low
sub $t5, $a3, $t3 #t5=key-Α[low]
sub $t6, $t4, $t3 #t6=Α[up]-Α[low]
div $t7, $t5, $t6 #t7=t5/t6
mul $t8, $t0, $t7 #t8=t0*t7
add $t0, $t8, $a1 #t0=pos
sll $t5, $t0, 2 #t5=4pos
add $t5, $t5, $a0 #στον t5 περιέχεται η διεύθυνση του Α[pos]
lw $t6, 0($t5) #t6=Α[pos]
beq $t6, $a3, BYE2 #Αν Α[pos]=key πηγαίνω στο ΒΥΕ2
slt $t7, $t6, $a3 #t7=1 αν a[pos]<key
bne $t7, $zero, HI2 #Αν Α[pos]<key πηγαίνω στο ΗΙ2
beq $t7, $zero, HI3 #Αν Α[pos]>key πηγαίνω στο ΗΙ3
HI2:add $a1, $t0, 1 #a1=pos++
jal HI1 #γυρνώ με το νέο $a1 στη ΗΙ1
HI3: add $a2, $t0, -1 #a2=pos--
jal HI1 #γυρνώ με το νέο $a2 στη ΗΙ1
BYE1:lw $ra, 0($sp) #επαναφέρω την αρχική διεύθυνση επιστροφής στον $ra
addi $sp, $sp, 4 #διαγράφω ένα στοιχείο από τη στοίβα
addi $v1, $zero, -1 #v1=-1, ώστε να επιστραφεί -1
jr ra #επιστρέφω στη συνάρτηση που με κάλεσε
BYE2:lw $ra, 0($sp) #επαναφέρω την αρχική διεύθυνση επιστροφής στον $ra
addi $sp, $sp, 4 #διαγράφω ένα στοιχείο από τη στοίβα
addi $v1, $t0, 0 #v1=pos ώστε να επιστραφεί pos
jr ra #επιστρέφω στη συνάρτηση που με κάλεσε
