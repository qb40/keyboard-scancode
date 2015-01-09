DECLARE SUB show (msg$, row%, col%, clr%)
DECLARE SUB keyShow (k%, row%, col%)
DECLARE SUB keyStatus (k%)
DECLARE FUNCTION keycodeGet% ()
DECLARE FUNCTION bin$ (num%)


'maxkeys per second = 857 INP(&H60) command
CLS

'main loop
DO

'get key
k% = keycodeGet%

'display
GOSUB display


'set old key
kOld% = k%

'exit if esc
IF (k% = 129) THEN EXIT DO
LOOP
COLOR 7
CLS
SYSTEM



display:
'print keycode list
IF k% <> kOld% THEN
keyShow k%, 24, 1
PRINT
END IF

'print header
show "Keyboard Scancode" + SPACE$(20), 1, 1, 15
show "-----------------" + SPACE$(20), 2, 1, 7

'print fixed details
show SPACE$(60), 3, 1, 0
keyShow k%, 4, 1
keyStatus k%
show SPACE$(60), 5, 1, 0

RETURN

FUNCTION bin$ (num%)

n% = num%
ans$ = ""
FOR i% = 0 TO 7
ans$ = RIGHT$(STR$(n% AND 1), 1) + ans$
n% = n% \ 2
NEXT

bin$ = LEFT$(ans$, 4) + " " + RIGHT$(ans$, 4)
END FUNCTION

FUNCTION keycodeGet%

'recieve key (keyboard port)
k% = INP(&H60)

'stop beep sound (Qbasic tip)
'by clearing keyboard buffer
DEF SEG = 0
POKE &H41A, PEEK(&H41C)
DEF SEG

keycodeGet% = k%
END FUNCTION

SUB keyShow (k%, row%, col%)
LOCATE row%, col%
COLOR 15
PRINT k%; "  ",
COLOR 14
PRINT HEX$(k%); " h ",
COLOR 12
PRINT bin$(k%); " b ";
END SUB

SUB keyStatus (k%)
COLOR 13
IF k% < 128 THEN PRINT " [active]";  ELSE PRINT " [inactive]";
END SUB

SUB show (msg$, row%, col%, clr%)
COLOR clr%
LOCATE row%, col%
PRINT msg$;
END SUB

