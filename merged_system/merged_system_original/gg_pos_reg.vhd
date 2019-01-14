library IEEE;
use IEEE.std_logic_1164.ALL;

entity gg_pos_reg is
port(   gg_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        gg_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
             gg_load : IN STD_LOGIC;
            gg_reset : IN STD_LOGIC;
                     clk : IN STD_LOGIC;
            gg_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            gg_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
end gg_pos_reg;

