This folder includes the all VHDL files relating to the coordinate comparison component.
This component compares two coordinates each represented by a 5 bit bus for the row number and 5 bit bus for the column number.
The output of the component is a 1 bit signal "is_equal".
This signal is asserted to '1' when the two coordinates are the same and otherwise deasserted to '0'.
As a last note: this component compares the coordinates combinationally, meaning that no clock signal is needed.
