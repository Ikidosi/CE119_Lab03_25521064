# fib_opt: tinh F(n) de quy, kiem tra truong hop co so truoc khi cap khung
# Tham so  : $a0 = n (n >= 0)
# Tra ve   : $v0 = F(n)
# Thanh ghi: $ra, $s0, $s1 (chi cat vao khung 12 byte khi n >= 2); $t0
fib_opt:
        slti  $t0, $a0, 2       # kiem tra truong hop co so truoc
        beq   $t0, $zero, fo_rec
        move  $v0, $a0          # n < 2: tra ve ngay, khong dung stack
        jr    $ra

fo_rec:
        addi  $sp, $sp, -12     # chi cap khung khi n >= 2
        sw    $ra, 8($sp)
        sw    $s0, 4($sp)
        sw    $s1, 0($sp)

        move  $s0, $a0
        addi  $a0, $s0, -1
        jal   fib_opt
        move  $s1, $v0

        addi  $a0, $s0, -2
        jal   fib_opt
        addu  $v0, $s1, $v0

        lw    $s1, 0($sp)
        lw    $s0, 4($sp)
        lw    $ra, 8($sp)
        addi  $sp, $sp, 12
        jr    $ra