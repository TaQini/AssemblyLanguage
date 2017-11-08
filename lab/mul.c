#include <stdio.h>
#include <string.h>
#include <malloc.h>

#define and &&
#define or ||
#define not !
#define Int(X) (X - '0')
#define Char(X) (X + '0')

char *multiBigInteger(const char *, const char *);

int BigInt(void)
{
    char num1[100] = {'\0'}, num2[100] = {'\0'};
    scanf("%s%s", num1, num2);
    char *result = "0";
    result = multiBigInteger(num1, num2);
	if(result[0]=='0') printf("%s",result+1);
	else printf("%s",result);
}

char *multiBigInteger(const char *num1, const char *num2)
{
    char *tempRes = NULL;              //用来保存每次相乘的结果
    char *result = NULL;               //用来保存最终结果
    int tempResLen;                    //每次相乘结果的最大长度
    int num1Len = strlen(num1);        //num1的长度
    int num2Len = strlen(num2);        //num2的长度
    int resultLen;                     //结果的最大长度
    int i, j, k;                       //循环计数器
    int res;                           //每次一位相乘/相加的结果
    int carry = 0;                     //进位
    int offset = 0;                    //加法的偏移位
    resultLen = num1Len + num2Len - 1; //结果长度最大为num1长度和num2长度之和，由于下标从0开始，所以要减一
    tempResLen = num1Len;              //每次num1乘以num2每一位的结果最大长度是num1Len+1,由于下标从0开始，所以减一后约去1,只剩num1Len
    //初始化result为0
    result = (char *)malloc((resultLen+2)*sizeof(char));
    memset(result, '0', (resultLen+1)*sizeof(char));
    result[resultLen+1] = 0;

    tempRes = (char *)malloc((tempResLen+2)*sizeof(char));
    for(j = num2Len - 1; j >= 0; j--)
    {
        //初始化tempRes每位为0
        memset(tempRes, '0', (tempResLen+1)*sizeof(char));
        /*计算num1与num2各位相乘的结果，保存到tempRes中
         *每一位相乘后与之前的进位相加得出res，将res的个
         *位(res%10)保存到tempRes里,然后将res的其余位数
         *(res/10)则为进位carry*/
        for(i = num1Len-1; i >= 0; i--)
        {
            res = Int(num1[i]) * Int(num2[j]) + carry;
            tempRes[tempResLen--] = Char(res % 10);
            carry = res / 10;
        }
        //tempRes第一位为进位，刚刚的循环是没有算的，最后把进位算上
        tempRes[tempResLen] = Char(carry);
        tempResLen = num1Len;
        carry = 0;
        //由result的末尾开始计算和，算完一次，向左偏移一位
        for(k = resultLen-offset; k > (resultLen-offset-num1Len); k--)
        {
            res = Int(result[k]) + Int(tempRes[tempResLen--]) + carry;
            result[k] = Char(res%10);
            carry = res/10;
        }
        result[k] += Int(tempRes[tempResLen] + carry);
        carry = 0;
        tempResLen = num1Len;
        offset++;

    }
    //printf("num1Len:%d\nnum2Len:%d\n", num1Len, num2Len);
    return result;
}
