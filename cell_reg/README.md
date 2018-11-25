# cell_reg

This folder contains all files for describing and testing the cell register component.

The cell register indirectly connects the video controller on one side and the input controllers on the other side.  
On the input controller side, the cell register has access to the live coordinates of the two ghosts and pacman.
It can also demand access to the coin register and map register by enabling the "vc_has_priority" signal.
Furthermore it can directly read out the score.

The cell register works as follows:  
The video controller can ask for the so called "cell type" of a cell by setting the corresponding "row_number_requested" and "column_number_requested" busses.
The cell register then tests these two bus values against that of the live coordinates of pacman and the ghosts.
If a match is found, the "cell_type" output bus directed to the video controller is set to the corresponding value.
It also puts the requested cell coordinates into the map register and coin register.
When either register returns a '1' on their respective output signals, the "cell_type" bus is set to their corresponding value.
Lastly, when the cell is found empty, a value is put on the "cell_type" bus that corresponds with the empty cell type.

The cell type values and their priorities are as follows:
- "000" = empty cell  (6)
- "001" = pacman cell (2)
- "010" = ghost1 cell (3)
- "011" = ghost2 cell (4)
- "100" = empty cell  (6)
- "101" = coin cell   (5)
- "110" = wall cell   (1)
- "111" = empty cell  (6)

When a cell has two colliding types, for example pacman and ghost1 are both at the same cell, the cell type with the highest priority is outputted.

Finally, the cell register has one single input left to discuss, which is the "vc_done_in" signal.
This signal is asserted to '1' by the video controller when it is no longer setting pixel values on the screen, but has instead landed at the backporch / frontporch.
When this is the case, the "vc_done_out" is asserted to '1' until "vc_done_in" is deasserted again to '0'.
"vc_done_out" is directed to the pacman FSM which knows it finally has access to the map register and coin register.
Lastly, the "vc_has_priority" output signal of the cell register is the inverse of "vc_done_out" signal.
This signal is directly fed into multiplexers that determine whether the cell register has priority over the pacman FSM (set to '1'), or the other way around (set to '0').
