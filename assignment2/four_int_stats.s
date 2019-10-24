
.align 4
.data  //w/o .data
.section .data //w/o .section

//.text
get_value: .asciz "Enter four integers: \n"		//use \n
value_entered: .asciz "You entered %d %d %d %d\n"
scan_s: .asciz "%d %d %d %d"
sum_msg: .asciz "The sum: %d\n"
average_msg: .asciz "The average: %d\n"
smallest_msg: .asciz "The smallest: %d\n"
largest_msg: .asciz "The largest: %d\n"

//.data

var1: .word 0
var2: .word 0
var3: .word 0
var4: .word 0

total: .word 0
average: .word 0
minimum: .word 0
maximum: .word 0
.align 4

.section .text //w/o .section

.global main

main: 
	push {lr}



 	//prompt
	ldr r0, =get_value
	bl printf


	//
	ldr r1, =var1
	ldr r2, =var2
	ldr r3, =var3
	ldr r4, =var4
	push {r4}
	//

	//p {r8}

        //since we used r4 
	//get the value
	ldr r0, =scan_s
	bl scanf
	pop {r4}


	
	//mov r4, r1
	//mov r5, r2
	//mov r6, r6
	//push {r8}
	//mov r8, r7
	//pop {r8}
	//push {r8}


//	ldr r1, =var1
//	ldr r2, =var2
//	ldr r3, =var3
//	push {r4}
//	ldr r4, =var4
//	pop {r8}

	//assign entered values to resistors 4-7 		//these are maybe unnecessary
	ldr r0, =var1
	ldr r4, [r0]
	ldr r0, =var2
	ldr r5, [r0]
	ldr r0, =var3
	ldr r6, [r0]
	ldr r0, =var4
	ldr r7, [r0]

//	ldr r4, [r1]		// 
//	ldr r5, [r2]		//
//	ldr r6, [r3]		//
//	ldr r7, [r4]            //


	//I will try mov instead of ldr
	//mov r4, var1
	//mov r5, var2
	//mov r6, var3
	//mov r7, var4


	//tell the user the entered  value
	ldr r0, =value_entered
	mov r1, r4		//
//	ldr r1, [r1]		segmetationfalut cause
	mov r2, r5		//
//	ldr r2, [r2]
	mov r3, r6		//
//	ldr r3, [r3]
//	push {r4}
	mov r8, r7		//
//	ldr r8, [r8]
	push {r8}
	bl printf
	pop {r8}
	//since we used r4 as a parameter, load the original content
	//into r4 again
//	ldr r0, =var1
//	ldr r4, [r0]





//////////////////////////////////////////////////////////////////////////




	//sum
	//calculate the sum, and displays it 
	ldr r0, =sum_msg
	add r1, r4, r5
	add r2, r6, r7
	add r1, r1, r2
	bl printf



	//average
	//calculate the sum(again), get the average, and displays it
	ldr r0, =average_msg
	add r1, r4, r5
	add r2, r6, r7
	add r1, r1, r2
	mov r1, r1, LSR #2  //maybe not 8, but 2
	bl printf



	//largest
	//get the largest value (using cmp), and displays it 
	ldr r0, =largest_msg

	//cmp_r4:
	cmp r4,r5
	blt cmp_r5_max
	movge r1,r4
	cmp r4,r6
	blt cmp_r5_max
	cmp r4,r7
	blt cmp_r5_max
	bge end_cmp_largest

	cmp_r5_max:
	cmp r5, r6
	blt cmp_r6_max
	movge r1,r5
	cmp r5,r7
	blt cmp_r6_max
	bge end_cmp_largest

	cmp_r6_max:
	cmp r6, r7
	movge r1,r6
	movlt r1,r7

	end_cmp_largest:
        //pop {r4}

	bl printf



	//smallest
	//do the same thing for minimum value
	ldr r0, =smallest_msg

	//cmp_r4:
	cmp r4,r5
	bgt cmp_r5_min
	movle r1,r4
	cmp r4,r6
	bgt cmp_r5_min
	cmp r4,r7
	bgt cmp_r5_min
	ble end_cmp_smallest

	cmp_r5_min:
	cmp r5, r6
	bgt cmp_r6_min
	movle r1,r5
	cmp r5,r7
	bgt cmp_r6_min
	ble end_cmp_smallest

	cmp_r6_min:
	cmp r6, r7
	movle r1,r6
	movgt r1,r7

	end_cmp_smallest:

	bl printf


	//
	mov r0, #0
	pop {pc}
