LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity pacman_position_reg is
port(   pacman_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        pacman_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
             pacman_load : IN STD_LOGIC;
            pacman_reset : IN STD_LOGIC;
                     clk : IN STD_LOGIC;
            pacman_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            pacman_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
end entity;
