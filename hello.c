#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main() {
	const char s[] = "Hello world!\n";
	const char *p = s + sizeof(s) - 1;
	// printf("HiWorld\n");  // Hello world!\n
	char buff[100];
	while (p >= s) {
		sprintf(buff, "%0x", p[0]);
		write(2, buff, strlen(buff));
		// printf("%0x",p[0]);
		--p;
	}
	printf("\n");
	return 0;
}
