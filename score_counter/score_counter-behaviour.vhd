library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of score_counter is

signal internal_score, new_score : unsigned (9 downto 0);

begin

process(clk, reset)
begin
  if(clk'event and clk = '1') then
    if(reset = '1') then
      internal_score <= (others => '0');
    else
      internal_score <= new_score;
    end if;
  end if;
end process;

process(score_add)
begin
  if(score_add = '1') then
    new_score <= internal_score + 1;
  end if;
end process;

score <= std_logic_vector(internal_score);

end behaviour;

