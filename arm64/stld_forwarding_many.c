#include "../nolibc/nolibc.h"

uint64_t array[10240];

__attribute__((noinline))
static
void test()
{
  __asm__ volatile(
		   "\n"
		   "mov  x10, #0x100\n"
		   "mov  x0, xzr\n"
		   "adrp x1, array\n"
		   "add  x1, x1, #0x40\n"
		   "add  x11, x1, #0x0\n"
		   "mov  x2, x11\n"
"loop:\n"
		   ".rept 100\n"
		   "str  x11, [x1]\n"
		   "ldr  x2, [x2]\n"
		   "add  x1, x2, x0\n"
		   "add  x1, x1, x0\n"
		   "add  x1, x1, x0\n"
		   "add  x1, x1, x0\n"
		   "add  x1, x1, x0\n"
		   ".endr\n"

		   "subs x10, x10, #0x1\n"
		   "b.ne loop\n");
}

int main()
{
  test();
}
