library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of gg_pos_reg is
signal current_pos_x, current_pos_y, new_pos_x, new_pos_y: STD_LOGIC_VECTOR(4 DOWNTO 0);
begin

    update: process (clk, gg_reset)
            begin
              if (clk'event AND clk = '1') then
                if (gg_reset = '1') then

                    current_pos_x <= (others => '0');
                    current_pos_y <= (others => '0');
                else
                    current_pos_x <= new_pos_x;
                    current_pos_y <= new_pos_y;
                end if;
              end if;
            end process;

    load: process (gg_load, gg_pos_x_new, gg_pos_y_new, current_pos_x, current_pos_y)
            begin
              if (gg_load = '1') then
                  new_pos_x <= gg_pos_x_new;
                  new_pos_y <= gg_pos_y_new;
              else
                  new_pos_x <= current_pos_x;
                  new_pos_y <= current_pos_y;
              end if;
            end process;

gg_pos_x <= current_pos_x;
gg_pos_y <= current_pos_y;
end behaviour;

