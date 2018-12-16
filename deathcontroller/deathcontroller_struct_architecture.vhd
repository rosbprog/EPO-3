architecture structural of deathcontroller is
	component coordinate_comparator is
		port (
			row_number1	: in	std_logic_vector(4 downto 0);	-- Input bus representing the first row number
			column_number1	: in	std_logic_vector(4 downto 0);	-- Input bus representing the first column number		
	
			row_number2	: in	std_logic_vector(4 downto 0);	-- Input bus representing the second row number
			column_number2	: in	std_logic_vector(4 downto 0);	-- Input bus representing the second column number
	
			is_equal	: out	std_logic			-- Output bit set to '1' when both the "row"-busses and
										--the "column"-busses are equal, otherwise set to '0'
		);
	end component coordinate_comparator;
	
	signal c_g1, c_g2, sadness_int	: std_logic;
begin
	IB1: coordinate_comparator port map (
		is_equal 	=> c_g1,
		row_number1	=> row_new_p,
		column_number1 	=> col_new_p, 
		row_number2 	=> row_old_g1,
		column_number2	=> col_old_g1				
	);
	
	IB2: coordinate_comparator port map (
		is_equal 	=> c_g2,
		row_number1	=> row_new_p,
		column_number1 	=> col_new_p, 
		row_number2 	=> row_old_g2,
		column_number2	=> col_old_g2				
	);

	sadness_int <= c_g1 OR c_g2;
	sadness <= sadness_int;
end architecture structural;


			
		
