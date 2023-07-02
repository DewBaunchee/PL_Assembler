#include <iostream>
#include <windows.h>

short a[5];

short calculateByCpp() {
    short answer = 0;
    for (int i = 0; i < sizeof(a) / 2; i++) {
        if (a[i] < 0) answer += a[i];
    }
    return answer;
}

short calculateByAsm() {
    short answer = 0;

    __asm {
        mov ax, [answer]
        mov cx, 5
        lea edi, a

        cycle_1 :
        cmp[edi], 0h
            jl sum
            add edi, 2h
            loop cycle_1

            jmp asm_end

            sum :
            add ax, [edi]
            add edi, 2h
            loop cycle_1

            asm_end :
        mov[answer], ax
                
    }

    return answer;
}

int main() {
    std::cout << "This algorithm calculates sum of negative elements in array.\nEnter 5 elements: " << std::endl;
    std::cin >> a[0] >> a[1] >> a[2] >> a[3] >> a[4];

    std::cout << "C++ result: " << calculateByCpp() << "\nAsm result: " << calculateByAsm() << std::endl;

    return 0;
}