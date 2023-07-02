;пример программы вычисления выражения y=(a+b*c)/d) на ассемблере
                org 100h ;устанавливаем адрес начала программы
start:
                mov ah, $09 ;выводим в консоль текст
                mov dx, name_prog
                int 21h

                mov ah, $02 ;перевод курсора на следующую строчку
                mov dx, 0x0D0A
                int 21h

                mov ah, $09 ;выводим в консоль текст
                mov dx, str2
                int 21h

                mov ah, $02 ;перевод курсора на следующую строчку
                mov dx,  0x0D0A
                int 21h

                mov ah, $09 ;выводим в консоль текст
                mov dx, result_is
                int 21h

                mov ax, $03 ;грузим b в AX
                mov cx, $03 ;грузим c в CX
                mul cx      ;умножаем b на c, результат в DX:AX
                mov bx, [a] ;грузим в BX a
                add ax,bx   ;складыаем b*c с a
                mov cx,[d]  ;грузим в CX d
                div cx      ;делим AX на CX (т.е. (a+b*c)/d). результат в DX:AX
                mov [res],ax;сохран¤ем результат (младшую часть) в яѕ res

                mov ax, [res];грузим значение из яѕ res в акк. AX
                add ax, '0'  ;перевод в ASCII код

                mov bx,ax ;пересылка из ax в bx результата расчёта, т.к. рг ah нужен нам далее для вывода в консоль

                mov ah, $02 ;вывод в консоль результата
                mov dx,bx
                int 21h

                mov ah,$08 ;ожидание нажатия любой клавиши
                int 21h
                ret

name_prog       db "This program calculates (a+b*c)/d$"
str2            db "where a=1, b=3, c=3, d=2$"
result_is       db "result is equal to $"
a               dw 1h
d               dw 2h
res             dw 0h
