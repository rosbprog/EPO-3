LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

architecture behavioural of pacman_position_reg_tb is
signal pacman_pos_x_new, pacman_pos_y_new, reg_pos_x, reg_pos_y: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal sclk, pacman_load, pacman_reset: STD_LOGIC;

component pacman_position_reg is
port (  pacman_pos_x_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        pacman_pos_y_new : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
             pacman_load : IN STD_LOGIC;
            pacman_reset : IN STD_LOGIC;
                     clk : IN STD_LOGIC;
            pacman_pos_x : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            pacman_pos_y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
end component;

begin

sclk <=  '1' after 0 ns,
  	'0' after 10 ns when sclk /= '0' else '1' after 10 ns;

pacman_reset <= '1', '0' after 30 ns;
pacman_pos_x_new <= "10000", "10001" after 50 ns, "11111" after 70 ns;
pacman_pos_y_new <= "10000", "10001" after 50 ns, "11111" after 70 ns;
pacman_load <= '0', '1' after 50 ns, '0' after 90 ns;

test: pacman_position_reg port map (pacman_pos_x_new, pacman_pos_y_new, pacman_load, pacman_reset, sclk, reg_pos_x, reg_pos_y);

end architecture behavioural;
