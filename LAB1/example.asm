;������ ��������� ���������� ��������� y=(a+b*c)/d) �� ����������
                org 100h ;������������� ����� ������ ���������
start:
                mov ah, $09 ;������� � ������� �����
                mov dx, name_prog
                int 21h

                mov ah, $02 ;������� ������� �� ��������� �������
                mov dx, 0x0D0A
                int 21h

                mov ah, $09 ;������� � ������� �����
                mov dx, str2
                int 21h

                mov ah, $02 ;������� ������� �� ��������� �������
                mov dx,  0x0D0A
                int 21h

                mov ah, $09 ;������� � ������� �����
                mov dx, result_is
                int 21h

                mov ax, $03 ;������ b � AX
                mov cx, $03 ;������ c � CX
                mul cx      ;�������� b �� c, ��������� � DX:AX
                mov bx, [a] ;������ � BX a
                add ax,bx   ;��������� b*c � a
                mov cx,[d]  ;������ � CX d
                div cx      ;����� AX �� CX (�.�. (a+b*c)/d). ��������� � DX:AX
                mov [res],ax;��������� ��������� (������� �����) � �� res

                mov ax, [res];������ �������� �� �� res � ���. AX
                add ax, '0'  ;������� � ASCII ���

                mov bx,ax ;��������� �� ax � bx ���������� �������, �.�. �� ah ����� ��� ����� ��� ������ � �������

                mov ah, $02 ;����� � ������� ����������
                mov dx,bx
                int 21h

                mov ah,$08 ;�������� ������� ����� �������
                int 21h
                ret

name_prog       db "This program calculates (a+b*c)/d$"
str2            db "where a=1, b=3, c=3, d=2$"
result_is       db "result is equal to $"
a               dw 1h
d               dw 2h
res             dw 0h
