LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

architecture behavioural of pacman_position_reg is
signal current_pos_x, current_pos_y, new_pos_x, new_pos_y: STD_LOGIC_VECTOR(4 DOWNTO 0);


begin

    update: process (clk, pacman_reset)
            begin
              if (clk'event AND clk = '1') then
                if (pacman_reset = '1') then

                    current_pos_x <= (others => '0');
                    current_pos_y <= (others => '0');
                else
                    current_pos_x <= new_pos_x;
                    current_pos_y <= new_pos_y;
                end if;
              end if;
            end process;

    load: process (pacman_load, pacman_pos_x_new, pacman_pos_y_new, current_pos_x, current_pos_y)
            begin
              if (pacman_load = '1') then
                  new_pos_x <= pacman_pos_x_new;
                  new_pos_y <= pacman_pos_y_new;
              else
                  new_pos_x <= current_pos_x;
                  new_pos_y <= current_pos_y;
              end if;
            end process;

pacman_pos_x <= current_pos_x;
pacman_pos_y <= current_pos_y;

end architecture behavioural;
