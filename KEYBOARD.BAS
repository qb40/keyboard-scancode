DECLARE SUB show (msg$, row%, col%, clr%)
DECLARE SUB keyShow (k%, row%, col%)
DECLARE SUB keyStatus (k%)
DECLARE FUNCTION keycodeGet% ()
DECLARE FUNCTION bin$ (num%)


'maxkeys per second = 857 INP(&H60) command
'UP KEY    = E0 48 E0 C8 START AND STOP
'            E0 48 KEPT PRESSED
'LEFT KEY  = E0 4B E0 CB START AND STOP
'            E0 4B KEPT PRESSED
'RIGHT KEY = E0 4D E0 CD START AND STOP
'            E0 4D KEPT PRESSED
'DOWN KEY  = E0 50 E0 D0 START AND STOP
'            E0 50 KEPT PRESSED
'NUM ENTER = E0 1C E0 9C
'R ALT     = E0 38 E0 B8
'R CTRL    = E0 1D EO 9D
'NUM DIV   = E0 35 E0 B5
'INSERT    = E0 52 E0 D2
'HOME      = E0 47 E0 C7
'PAGE UP   = E0 49 E0 C9
'DELETE    = E0 53 E0 D3
'END       = E0 4F E0 CF
'PAGE DN   = E0 51 E0 D1

'E0 AA - WITH SHIFT
'EO 2A - WITH NUM LOCK

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

