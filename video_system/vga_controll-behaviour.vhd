library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

architecture vga_behavioral of vga_controll is
signal display_on : std_logic;
signal hcount, new_hcount, vcount, new_vcount: std_logic_vector(9 downto 0);

begin

L1:		process(clk, reset)						--
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
			hcount <= (others =>'0');
			vcount<= (others =>'0');
			else 
			hcount <= new_hcount;
			vcount<= new_vcount;
			end if;
		end if;
 		end process;

L11:		process(hcount)
		begin
			if(hcount=399) then 
			new_hcount <= (others => '0');
			else
			new_hcount <= hcount + 1;
			end if;
		end process;

L12:		process (vcount)
		begin
			if(hcount=350) then 
				if (vcount = 524) then 
				new_vcount <= (others => '0');
 				else 
				new_vcount <= vcount + 1;
				end if;
			end if;
		end process;
		
L3:		process( clk, reset)
		begin
		if(rising_edge(clk)) then
			if (reset = '1') then	
				h_sync <= '0';
			elsif (hcount<376 and hcount>327) then
				h_sync <= '0';
			else 
				h_sync <= '1';
			end if;
			if (reset = '1') then	
				v_sync <= '0';
			elsif (vcount<492 and vcount>489) then
				v_sync <= '0';
			else 
				v_sync <= '1';
			end if;
			if(hcount=39) then
				pixel_sync <= '1';
			else
				pixel_sync <= '0';
			end if;
			if (vcount = 479) then
				calc_start <= '1';
			else 
				calc_start <= '0';
			end if;  
		end if;
		end process;

L4:		process(clk,reset)
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then 
			display_on <= '0';
			elsif (	hcount<=319 and vcount<=479)then
			display_on <= '1';	
			else 
			display_on <= '0';
			end if;
		end if;
		end process;
	

L5:		process(clk, reset)
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
			red <= '0';
			green <= '0';
			blue <= '0';
			elsif(display_on = '1') then
			red <= rgb(2);
			green <= rgb(1);
			blue <= rgb(0);
			else
			red <= '0';
			green <= '0';
			blue <= '0';
			end if;
		end if;
		end process;

end architecture vga_behavioral;		


