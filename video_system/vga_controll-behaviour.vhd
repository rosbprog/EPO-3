library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture vga_behavioral of vga_controll is

signal hcount, vcount, new_hcount, new_vcount: unsigned(9 downto 0);

begin

L1:		process(clk, reset)				
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				hcount <= (others => '0');
				vcount <= (others => '0');			
			else 
				hcount <= new_hcount;
				vcount <= new_vcount;
			end if;
		end if;
		end process; 

L2:		process(hcount, vcount)
		begin
			if(hcount = 399) then
				new_hcount <= (others => '0');
			else
				new_hcount <= hcount + 1;
			end if;

			if(hcount = 349) then
				if(vcount = 524) then
					new_vcount <= (others => '0');
				else
					new_vcount <= vcount + 1;
				end if;
			else
				new_vcount <= vcount;
			end if;
		end process;

		
L3:		process( hcount, vcount)
		begin
			if (hcount<376 and hcount>327) then
				h_sync <= '0';
			else 
				h_sync <= '1';
			end if;
			if (vcount<492 and vcount>489) then
				v_sync <= '0';
			else 
				v_sync <= '1';
			end if;
			if(hcount=64 and (vcount >= 48 and vcount<=431)) then
				pixel_sync <= '1';
			else
				pixel_sync <= '0';
			end if;
			if(hcount=64 and (vcount >= 32 and vcount<=47)) then
				score_pixel_sync <= '1';
			else
				score_pixel_sync <= '0';
			end if;
			if (vcount = 480) then
				calc_start <= '1';
			else 
				calc_start <= '0';
			end if; 
		end process;

L4:		process(hcount,vcount,rgb)
		begin
			if (hcount<=319 and vcount<=479)then
				red <= rgb(2);
				green <= rgb(1);
				blue <= rgb(0);
			else 
				red <= '0';
				green <= '0';
				blue <= '0';
			end if;
		end process;

end architecture vga_behavioral;		


