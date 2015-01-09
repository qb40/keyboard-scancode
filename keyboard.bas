DECLARE SUB show (msg$, row%, col%, clr%)
DECLARE SUB keyShow (k%, row%, col%)
DECLARE FUNCTION bin$ (num%)


'maxkeys per second = 857 INP(&H60) command
CLS

'main loop
DO

'recieve key (keyboard port)
k% = INP(&H60)

'stop beep sound (Qbasic tip)
'by clearing keyboard buffer
DEF SEG = 0
POKE &H41A, PEEK(&H41C)
DEF SEG

'print keycode list
IF k% <> kOld% THEN
keyShow k%, 24, 1
PRINT
END IF

'print header
show "Keyboard Scancode" + SPACE$(20), 1, 1, 15
show "-----------------" + SPACE$(20), 2, 1, 7

'print fixed details
show SPACE$(40), 3, 1, 0
keyShow k%, 4, 1
show SPACE$(40), 5, 1, 0

'set old key
kOld% = k%

'exit if esc
IF (k% = 129) THEN EXIT DO
LOOP

FUNCTION bin$ (num%)

n% = num%
ans$ = ""
FOR i% = 0 TO 7
ans$ = RIGHT$(STR$(n% AND 1), 1) + ans$
n% = n% \ 2
NEXT

bin$ = LEFT$(ans$, 4) + " " + RIGHT$(ans$, 4)
END FUNCTION

SUB keyShow (k%, row%, col%)
LOCATE row%, col%
COLOR 15
PRINT k%; "  ",
COLOR 14
PRINT bin$(k%); " b",
COLOR 13
PRINT HEX$(k%); " h";
END SUB

SUB show (msg$, row%, col%, clr%)
COLOR clr%
LOCATE row%, col%
PRINT msg$;
END SUB

