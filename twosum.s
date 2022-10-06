.data
# first test data
nums1: .word 2, 7, 11, 15
target1: .word 9
size1: .word 4
# second test data
nums2: .word 3, 2, 4
target2: .word 6
size2: .word 3
# third test data
nums3: .word 3, 3
target3: .word 6
size3: .word 2
endl: .string "\n"

.text
main:
		la s0, nums1 #load nums1 address to s0
		lw s1, target1 #load target1 to s1
		lw s2, size1 #load size1 to s2
		jal twoSum
		la s0, nums2
		lw s1, target2
		lw s2, size2
		jal twoSum
		la s0, nums3
		lw s1, target3
		lw s2, size3
		jal twoSum
		li a7, 10 #end
		ecall	
twoSum:
		mv t0, zero #int i=0
		addi t1, t0, 1 #int j=i+1
		mv a0, s0 #store nums1 address for i
		mv a1, s0 #store nums1 address for j
loop2:
		lw a2, 0(a0) #load nums[i]
		lw a3, 4(a1) #load nums[j]
		add a3, a2, a3 #nums1[i]+nums2[j]
		beq a3, s1, print #if (nums1[i]+nums2[j]==target) go to print
		addi a1, a1, 4 #point to next nums1[j] address
		addi t1, t1, 1 #j++
		blt t1, s2, loop2
loop1:
		addi t0, t0, 1 #i++
		addi a0, a0, 4 #point to next nums[i] address
		mv a1, a0
		addi t1, t0, 1 #j=i+1
		bltu t0, s2, loop2 #if (i<numsize) go to loop2
print: 
		mv a0, t0 #move i
		li a7, 1 #print integer
		ecall
		mv a0, t1 #move j
		ecall 
		la a0, endl #load \n
		li a7, 4 #print string
		ecall
		jr ra