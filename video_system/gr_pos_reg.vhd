library IEEE;
use IEEE.std_logic_1164.ALL;

entity gr_pos_reg is
port(   gr_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        gr_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
             gr_load : IN STD_LOGIC;
            gr_reset : IN STD_LOGIC;
                     clk : IN STD_LOGIC;
            gr_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            gr_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
end gr_pos_reg;

