#include <stdio.h>
#include <string.h>
int main(){
	int len;
	char buff[1024];
	scanf("%s", buff);
	len = strlen(buff);
	printf("%d\n", len);
	return 0;
}
