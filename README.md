# qb-keyboard-scancode

**qb-keyboard-scancode** is a dos tool to determine the keyboard scancode of a key.
Keyboard scancodes are obtained by directly taking input from the keyboard port. It
can be useful in games where keys are assigned some actions and they must not whether
`caps lock` or `shift` is pressed. Also it is necessary in games to handle multiple
keys pressed at the same time. In such a situation, using keyboard scancodes as input
becomes necessary.

Each key on the keyboard is assign a specific number which is called a *scancode*.
This scancode can be obtained by reading io port `60h`. The most significant bit
of the scancode is used to indicate if the key was pressed `(0)` or released `(1)`.
Special keys , such as the arrow keys, use extended scan codes, where the returned
value from keyboard io port is first `E0h` to indicate that it is an extended
scancode, and the scancode value is read out.


## demo

<img src="https://raw.githubusercontent.com/wolfram77/qb-keyboard-scancode/gh-pages/0/image/0.png" width="70%"><br/>
Scancode of `Enter` key pressed and released in *decimal*, *hex* & *binary*.<br/>
`[inactive]` indicates that the last key is not currently pressed.
<br/><br/>


<img src="https://raw.githubusercontent.com/wolfram77/qb-keyboard-scancode/gh-pages/0/image/1.png" width="70%"><br/>
<img src="https://raw.githubusercontent.com/wolfram77/qb-keyboard-scancode/gh-pages/0/image/2.png" width="70%"><br/>
`[active]` indicates that the last key is currently pressed.
<br/><br/>


<img src="https://raw.githubusercontent.com/wolfram77/qb-keyboard-scancode/gh-pages/0/image/3.png" width="70%"><br/>
`1` is the scancode of `Esc` key, displayed just before exit.
<br/><br/>
