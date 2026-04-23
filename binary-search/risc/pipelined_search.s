#Ripes stuff

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
size: .word 10
term: .word 7

.text
main:
	#load up the inputs above
	la x10, array
	lw x11, size
	lw x12, term

#base address of array is in x10
#size of the array is in x11
#search term (a number) is in x12

#we put smallest index of array in x20
addi x20, x0, 0
#we put the largest index of array in x21
addi x21, x11, -1
#we put the number 2 in x30
addi x30, x0, 2

#initialize the middle index to zero
addi x13, x0, 0


LOOP:
	#so this actually needs to compare the stuff AT the address. We'll put that in x16
	#we find the address based on the index x13
	sub x13, x21, x20
	divu x13, x13, x30
	add x13, x13, x20
	slli x22, x13, 2 #create address offset
	add x22, x22, x10 #add to base address
	lw x16, 0(x22)
    nop
    nop
	beq x16, x12, END
	blt x12, x16, LESS
	
	#we need to set x20 to be the new lower index
	addi x20, x13, 1
	beq x0, x0, LOOP

#we need to set x21 to be the new upper address
LESS:
	addi x21, x13, -1
	beq x0, x0, LOOP

END:
	#set x10 as the result
	addi x10, x13, 0
    addi a7, x0, 1
    nop
    nop
    nop
	ecall
	addi a7, x0, 10
    nop
    nop
    nop
	ecall
