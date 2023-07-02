#include <iostream>

short n = 0, b;
short* arr;

short calculateByCpp() {
    short count = 0;
    for (int i = 0; i < n; i++) {
        if (arr[i] < b) ++count;
    }
    return count;
}

short calculateByAsm() {
    short count = 0;

    __asm {
        mov cx, n
        mov bx, count
        mov ax, [b]
        mov edi, [arr]

        cycle_1:
        cmp [edi], ax
        jl incBx
        add edi, 2h
        loop cycle_1

        jmp asm_end

        incBx:
        inc bx
        add edi, 2h
        loop cycle_1

       asm_end:
            mov count, bx
    }

    return count;
}

int main() {
    std::cout << "This algorithm counts elements of array less than variable B. \nEnter number of elements (1 to 10): " << std::endl;
    std::cin >> n;
    arr = new short[n];
    for (int i = 0; i < n; i++) {
        std::cout << "Enter element #" << i + 1 << ":" << std::endl;
        std::cin >> arr[i];
    }
    std::cout << "Enter B:";
    std::cin >> b;

    std::cout << "\nC++ result: " << calculateByCpp() << "\nAsm result: " << calculateByAsm() << std::endl;

    return 0;
}