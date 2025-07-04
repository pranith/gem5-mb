	.align 2

	.global _start

_start:
	// Save LR (Link Register)
	stp     x29, x30, [sp, -16]!   // Save frame pointer and link register
	mov     x29, sp               // Set frame pointer

  mov x2, #0

loop:
  tst x1, 1
  b.eq odd
  ldr x10, =add_numbers
  b   end
odd:
  ldr x10, =subtract_numbers
end:

	// Call the add function
	mov     x0, 10                 // First argument
	mov     x1, 5                  // Second argument
	blr     x10           // Call the add_numbers function

  add x2, x2, #1
  cmp x2, #100

  b.ne loop

	// System call to exit
	 mov     w0, #0                   // Exit system call number
	 mov     w8, #93                   // Exit code (0 for success)
	 svc     #0                     // System call

add_numbers:
	// Save LR (Link Register)
	stp     x29, x30, [sp, -16]!   // Save frame pointer and link register
	mov     x29, sp               // Set frame pointer

	// Add the two numbers
	add     x0, x0, x1             // x0 = arg1 + arg2

	// Restore LR and return
	ldp     x29, x30, [sp], 16     // Restore frame pointer and link register
	ret                             // Return from function

subtract_numbers:
	// Save LR (Link Register)
	stp     x29, x30, [sp, -16]!   // Save frame pointer and link register
	mov     x29, sp               // Set frame pointer

	// Subtract the two numbers
	sub     x0, x0, x1             // x0 = arg1 - arg2

	// Restore LR and return
	ldp     x29, x30, [sp], 16     // Restore frame pointer and link register
	ret                             // Return from function

.end

	
	
