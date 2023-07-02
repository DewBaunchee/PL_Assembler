				org 100h ;установка адреса начала программы
start:
				mov ah, $09 ;вывод текста в консоль
				mov dx, name_prog
				int 21h 
        
				mov ah, $02 ;перевод курсора на следующую строчку
				mov dx, 0x0D0A ; hex-кодировка перевода и возврата кареткиf
				int 21h
        
				mov ah, $09 ;выводим в консоль текста
				mov dx, str2
				int 21h
        
				mov ah, $02 ;перевод курсора на следующую строчку
				mov dx, 0x0D0A ; hex-кодировка перевода и возврата каретки
				int 21h
        
				mov ah, $09 ;выводим в консоль
				mov dx, result_is
				int 21h
        
				mov ax, [a] ;загрузка a в AX
				sub ax, [b] ;отнимаем b от а
				mul ax, 9h  ;умножаем полученное значение на 9
				mov bx, [d] ;загрузка d в BX
				mul bx, 3h  ;умножение d на 3
				sub bx, ax  ;отнимаем a от d
				mov cx, [c] ;загрузка c в СХ
				add cx, 10h ;складываем с и 10
				div bx, cx  ;делим BX на CX (т.е. верхнюю часть выражения на нижнюю)
				mov [res], bx ;заносим результат в переменную res
        
				mov ax, [res] ;перевод в ASCII
				add ax, '0'
        
				mov bx, ax ;перемещаем результат в bx, т.к. регистр ah необходим далее для вывода в консоль
        
				mov ah, $02 ;вывод результата в консоль
				mov dx, bx
				int 21h
        
				mov ah, $08 ;ожидание нажатия клавиши
				int 21h
				ret
        
name_prog     	db "This program calculates (3*d - (a - b)*9)/(c + 10)$" ;Условие задачи
str2      		db "where a=6, b=5, c=2, d=7$"
result_is    	db "result is equal to $"
a        		dw 6h
b        		dw 5h
c         		dw 2h
d         		dw 7h
res       		dw 0h