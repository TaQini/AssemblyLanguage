int __cdecl strlen(int buff)
{
  _BYTE *v1; // eax@1
  int v2; // edx@1
  int v3; // ecx@8
  int v4; // edx@8
  unsigned __int8 v5; // cf@8
  int v6; // ecx@8
  int v7; // edx@8
  int v8; // ecx@10
  int v9; // edx@10
  int v10; // edx@10
  int v11; // ecx@12
  int v12; // edx@12
  int v13; // edx@12
  int v14; // ecx@14
  int v15; // edx@14
  int v16; // edx@14
  unsigned int v17; // ecx@16

  v1 = (_BYTE *)buff;
  v2 = buff & '\x03'; // v2 = 0,1,2,3
  if ( buff & '\x03' ) // when (buff & 3) == 1,2,3 
                       //buff & 3 == 0 -> 字符串地址4字节对齐
  {
    if ( __SETP__(buff & '\x03', 0) ) // buff & 0b11 -> 偶数
      goto LABEL_23;
    if ( *(_BYTE *)buff == BYTE1(v2) ) // if *buff==0
      return (int)&v1[-buff]; // 0
    v1 = (_BYTE *)(buff + 1);
    if ( *(_BYTE *)(buff + 1) == BYTE1(v2) )
      return (int)&v1[-buff]; // 1
    v1 = (_BYTE *)(buff + 2); 
    v2 ^= 2; 
    if ( v2 ) // when v2 != 2
    {
LABEL_23:
      if ( *v1 == BYTE1(v2) ) 
        return (int)&v1[-buff]; // 2
      ++v1; 
      v2 = 0;
    }
  }
/* 对齐字符串，未对齐部分若出现'\0'，则返回位置
  for(v1 = buff, v1 & 3, ++v1){
    if (*v1=='\0'){
      return v1-buff;
    }
  }
*/
  do
  {
    v3 = *(_DWORD *)v1; // 取4字节字符串内容
    v1 += 4; 
    v4 = v2 - v3; // v4 = -v3
    v5 = __CFADD__(v3, 0xFEFEFEFF); // v5 = v3 + 0xfefefeff
	//  magic_bit
    // 0xfefefeff 11111110 11111110 11111110 11111111
    //                   ^        ^        ^         
    //   +v3      XXXXXXXX XXXXXXXX 00000000 XXXXXXXX
    //                (unchange)->0 zero_byte
    //   =v5      ???????1 ???????0 ???????1 ????????
	//   ~v3      YYYYYYYY YYYYYYYY 11111111 YYYYYYYY
    //   xor      ZZZZZZZX ZZZZZZZY ZZZZZZZX ZZZZZZZZ
    // ~magic_bit
    // 0x01010100 00000001 00000001 00000001 00000000 
    //   and      00000000 00000001 00000000 00000000
    // 
    // -0x01010101 = ~0x01010101 + 1 = 0xfefefeff
    v6 = v3 - 0x01010101; // v6 = v3 + 0xfefefeff
    v7 = v4 - 1; // v7 = ~v3
    if ( !v5 )
      break;
    if ( (v6 ^ v7) & 0x01010100 ) // ((v3 + magic_bit) ^ ~v3) & ~magic_bit
      break;
    v8 = *(_DWORD *)v1;
    v1 += 4;
    v9 = -v8;
    v5 = __CFADD__(v8, 0xFEFEFEFF);
    v6 = v8 - 0x1010101;
    v10 = v9 - 1;
    if ( !v5 )
      break;
    if ( (v6 ^ v10) & 0x1010100 )
      break;
    v11 = *(_DWORD *)v1;
    v1 += 4;
    v12 = -v11;
    v5 = __CFADD__(v11, 0xFEFEFEFF);
    v6 = v11 - 0x1010101;
    v13 = v12 - 1;
    if ( !v5 )
      break;
    if ( (v6 ^ v13) & 0x1010100 )
      break;
    v14 = *(_DWORD *)v1;
    v1 += 4;
    v15 = -v14;
    v5 = __CFADD__(v14, 0xFEFEFEFF);
    v6 = v14 - 0x1010101;
    v16 = v15 - 1;
    if ( !v5 )
      break;
    v2 = (v6 ^ v16) & 0x1010100;
  }
  while ( !v2 );
/*快速检测4字节中是否包含'\0'
  magic_bit = 0xfefefeff
  while(1){
  v3 = *v1;
  v1 += 4;
  if(((v3 + magic_bit) ^ ~v3) & ~magic_bit)
    break;
  }
*/
  v1 -= 4;
  v17 = v6 + 0x1010101; // v3
  if ( (_BYTE)v17 )
  {
    ++v1;
    if ( BYTE1(v17) )
    {
      ++v1;
      if ( (unsigned __int8)(v17 >> 16) )
        ++v1;
    }
  }
  return (int)&v1[-buff];
}
/*寻找'\0'，并返回位置
  v1 -= 4;
  if(v3[3]==0){
    v1++;
    if(v1[2]==0){
      v1++;
      if(v1[1]==0){
        v1++;
      }
    }
  }
  return v1-buff;
*/
