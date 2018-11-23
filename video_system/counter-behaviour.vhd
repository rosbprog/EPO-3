library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture behaviour of counter is

signal	new_county: 	std_logic_vector(2 downto 0);
signal	new_current_block_horizontal, new_current_block_vertical: std_logic_vector(4 downto 0);
signal	new_dual_pixel_y: std_logic;

begin

process(clk,  reset_dual_pixel_y)
begin
	if clk'event AND clk='1' then
		if reset_dual_pixel_y = '1' then
			dual_pixel_y <= '0';
		else 
			dual_pixel_y <= new_dual_pixel_y;
		end if;
	end if;
end process;

process(clk, reset_current_block_horizontal)
begin
	if clk'event AND clk='1' then
		if  reset_current_block_horizontal = '1' then
			current_block_horizontal <= "00000";
		else 
		 	current_block_horizontal <=  new_current_block_horizontal;
		end if;
	end if;
end process;

process(clk, reset_current_block_vertical)
begin
	if clk'event AND clk='1' then
		if  reset_current_block_vertical = '1' then
		 	current_block_vertical <= "00000";
		else 
		 	current_block_vertical <=  new_current_block_vertical;
		end if;
	end if;
end process;

process(clk, reset_county)
begin
	if clk'event AND clk='1' then
		if  reset_county = '1' then
		 	county <= "000";
		else 
		 	county <=  new_county;
		end if;
	end if;
end process;

process(reset_dual_pixel_y,
	reset_current_block_horizontal,
	reset_current_block_vertical,
	reset_county,
	en_county,
	en_current_block_horizontal,
	en_current_block_vertical,
	en_dual_pixel_y,
	clk)
begin

	if en_county = '1' then
		new_county <= county + 1;
	else 
		new_county<= county;
	end if;

	if en_current_block_horizontal = '1' then
		new_current_block_horizontal <= current_block_horizontal + 1;
	else 
		new_current_block_horizontal<= current_block_horizontal;
	end if;

	if en_current_block_vertical = '1' then
		new_current_block_vertical <= current_block_vertical + 1;
	else 
		new_current_block_vertical<= current_block_vertical;
	end if;

	if en_dual_pixel_y = '1' then
		new_dual_pixel_y <= '1';
	else 
		new_dual_pixel_y<= dual_pixel_y;
	end if;		
end process;
end behaviour;

