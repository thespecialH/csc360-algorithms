//base address of array is in x10
//size of the array is in x11
//search term (a number) is in x12

//we put smallest index of array in x20
addi x20, x0, 0
//we put the largest index of array in x21
addi x21, x11, -1
//we put the number 2 in x30
addi x30, x0, 2


LOOP:
	//let's check to make sure the indexes aren't backward
	blt x21, x20, ERROR
	//so this actually needs to compare the stuff AT the address. We'll put that in x16
	//we find the address based on the index x13
	sub x13, x21, x20
	divu x13, x13, x30
	add x13, x13, x20
	slli x22, x13, 2 //create address offset
	add x22, x22, x10 //add to base address
	lw x16, 0(x22)
	beq x16, x12, END
	blt x12, x16, LESS
	
	//we need to set x20 to be the new lower index
	addi x20, x13, 1
	beq x0, x0, LOOP

//we need to set x21 to be the new upper address
LESS:
	addi x21, x13, -1
	beq x0, x0, LOOP

ERROR:
	addi x15, x0, -1
	beq x0, x0, EXIT

END:
	//set x15 as the result
	addi x15, x13, 0
	//we'll figure out how to print the result x15 and the index x13 later
EXIT:
