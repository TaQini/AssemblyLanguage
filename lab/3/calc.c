char s[]="汤程序";
char d[]="头朝下";
int main(){
	int i;
	char dd[10];
	for(i=0;i<sizeof(s)-1;i++){
		dd[i] = s[i] ^ d[i];
	}
	dd[i]=0;
	puts(dd);
}
