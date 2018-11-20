# coordinate_adder

This folder contains all files for describing and testing the coordinate adder component.

This component has as input two 5 bit busses, which describe the row number and the column number of the currently selected cell.
Furthermore, it has one 4 bit bus as input called the "move" bus. This bus describes the wanted movement direction.
The meaning of the bits are as follows:

- "0001": move right
- "0010": move up
- "0100": move left
- "1000": move down

On the rising edge of the clock signal (the sample clock, which has a very low frequency), the new row and column numbers are calculated and put on the two 5 bit output busses. This newly selected cell is calculated by incrementing the row number when moving down and decrementing it when moving up, whereas the column number is incremented when moving right and decremented when moving left.
