library IEEE;
use IEEE.std_logic_1164.ALL;

architecture vga_behavioral of vga_controll is
signal display_on : std_logic;
signal hcount, vcount : std_logic_vector(9 downto 0);

begin

L1:		process(clk, reset,hcount)
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
			hcount <= (others =>'0');

			elsif(hcount=399) then 
			hcount <= (others => '0');
			else 
			hcount <= hcount + 1;
			end if;
		else  
		hcount <= hcount;
		end if;
 		end process;

L2:		process (clk, reset, vcount)
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
			vcount<= (others =>'0');

			elsif(hcount=350) then 
				if (vcount = 524) then 
				vcount <= (others => '0');
 				else vcount <= vcount + 1;
				end if;
			else 
			vcount <= vcount;
			end if;
		else 
		vcount <= vcount;
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
		end if;
		end process;

L4:		process(clk,hcount,vcount)
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


