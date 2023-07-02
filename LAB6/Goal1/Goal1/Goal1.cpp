#include <iostream>

short a, b, c, d;

void calculateByCPP() {
    std::cout << "C++ result: " << (2 * b + 5 * c * d) / (a - 1) << std::endl;
}

void calculateByAsm() {
    short answer = 0;
    __asm {
        mov ax, b
        mov bx, 2h
        mul bx
        mov bx, ax

        mov ax, c
        mov cx, d
        mul cx

        mov cx, 5h
        mul cx

        add ax, bx
        mov bx, a
        dec bx
        div bx

        mov answer, ax
    }
    std::cout << "Asm result: " << answer << std::endl;
}

int main() {
    std::cout << "This program calculates y = (2*b + 5*c*d)/(a - 1). \nEnter [a b c d]:" << std::endl;
    std::cin >> a >> b >> c >> d;
    calculateByCPP();
    calculateByAsm();
    std::cout << "\nGoodbye." << std::endl;
    return 0;
}