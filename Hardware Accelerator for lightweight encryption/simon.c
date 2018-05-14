#include <stdio.h>

#include <stdint.h>


uint64_t key_expansion_function(uint64_t key,int i){

        uint64_t z = 0b0001100111000011010100100010111110110011100001101010010001011111; //Since it a 32bit input, 64bit key simon encryption
        //Split key into 4 parts
		uint16_t key_input3 = (key>>48)&0xffff;  
        uint16_t key_input2 = (key>>32)&0xffff;
        uint16_t key_input1 = (key>>16)&0xffff;
        uint16_t key_input = (key)&0xffff;
        uint16_t s3 = (key_input3>>3)|(key_input3<<13);
        uint16_t s2 = s3^key_input1;
        uint16_t s1 = (s2>>1)|(s2<<15);
        uint16_t s0 = s2^key_input;
        uint16_t temp = ((z>>(i%31))&1)^0xfffc;
        uint64_t result = ((s0^s1)^temp);
        result = (result<<48)|(key>>16);
        return result;

}


uint32_t round_function(uint32_t x_input, uint64_t key){

        uint16_t x_input1 = (x_input&0xffff0000)>>16; //MSB of x
        uint16_t x_inputi = (x_input&0x0000ffff); //LSB of x
        uint16_t s1 = (x_input1<<1)|(x_input1>>15);
        uint16_t s2 = (x_input1<<2)|(x_input1>>14);
        uint16_t s8 = (x_input1<<8)|(x_input1>>8);
        uint32_t x_k = (((s1&s8)^xi)^s2)^(key&0xffff);
        uint32_t result = (x_k<<16)|x_input1;
        return result;

}

int main()
{

        uint32_t plain_text =0x65656877;
        uint64_t key = 0x1918111009080100;
        uint32_t cipher_text;
        for(int i=0;i<=31;i++){
                plain_text = round_function(plain_text,key);
                key = key_expansion_function(key,i);
        }
        cipher_text = plain_text;
        printf("Cipher_text = %08x\n",cipher_text);
        return 0;

}