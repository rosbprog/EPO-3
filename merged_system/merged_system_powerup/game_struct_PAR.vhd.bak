
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture routed of game_struct is

  component ghost_cont
    port(clk          : in  std_logic;
         reset        : in  std_logic;
         ghost_start  : in  std_logic;
         pos_is_wall  : in  std_logic;
         en_cor_ghost : out std_logic;
         ghost_ready  : out std_logic;
         en_wall      : out std_logic);
  end component;

  component ghost_cont_SPC_1
    port(clk          : in  std_logic;
         reset        : in  std_logic;
         ghost_start  : in  std_logic;
         pos_is_wall  : in  std_logic;
         en_cor_ghost : out std_logic;
         ghost_ready  : out std_logic;
         en_wall      : out std_logic);
  end component;

  component input_system
    port(clk         : in  std_logic;
         reset       : in  std_logic;
         data_input  : in  std_logic_vector(3 downto 0);
         data_output : out std_logic_vector(3 downto 0));
  end component;

  component multiplexer
    port(vc_done   : in  std_logic;
         count_old : in  std_logic_vector(6 downto 0);
         count_new : in  std_logic_vector(6 downto 0);
         count     : out std_logic_vector(6 downto 0));
  end component;

  component DEL01BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL0BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD0BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL02BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL1BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL3BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL2BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component BUFFD5BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component BUFFD10BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD6BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD8BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OAI33D1BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OA211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OA31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AOI221D1BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI222D1BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AO222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; Z : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component BUFFD1BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR3XD1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component LNQD1BWP7T
    port(D, EN : in std_logic; Q : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D8BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OA221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component OA22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AOI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IINR4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component MUX2D0BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component LHQD1BWP7T
    port(D, E : in std_logic; Q : out std_logic);
  end component;

  component TIELBWP7T
    port(ZN : out std_logic);
  end component;

  component TIEHBWP7T
    port(Z : out std_logic);
  end component;

  signal FE_PHN120_L3b_L1_n_18, FE_PHN119_L3b_L1_n_16, FE_PHN118_L3b_L1_n_17, FE_PHN117_L3a_L1_n_21, FE_PHN116_L3a_L1_n_20 : std_logic;
  signal FE_PHN115_L3b_L1_n_0, FE_PHN114_L6a_LBL1_n_21, FE_PHN113_L3a_L1_n_22, FE_PHN112_L3c_PC1_n_5, FE_PHN111_L3c_PC1_state_0 : std_logic;
  signal FE_PHN110_L6a_LBL1_state_3, FE_PHN109_L6a_LBL1_state_0, FE_PHN108_row_old_ghost2_1, FE_PHN107_row_old_ghost2_4, FE_PHN106_L1a_coin_memory_28 : std_logic;
  signal FE_PHN105_col_old_ghost2_2, FE_PHN104_L1a_coin_memory_40, FE_PHN103_row_old_ghost2_0, FE_PHN102_col_old_ghost2_3, FE_PHN101_row_old_ghost2_2 : std_logic;
  signal FE_PHN100_col_old_ghost1_4, FE_PHN99_L3a_data_buffed_1, FE_PHN98_col_old_ghost2_4, FE_PHN97_col_old_ghost2_1, FE_PHN96_L3b_data_buffed_0 : std_logic;
  signal FE_PHN95_row_old_ghost1_1, FE_PHN94_col_old_ghost2_0, FE_PHN93_L6a_LBL1_n_2, FE_PHN92_L3a_data_buffed_2, FE_PHN91_col_old_ghost1_1 : std_logic;
  signal FE_PHN90_row_old_ghost1_0, FE_PHN89_L3a_data_buffed_0, FE_PHN88_row_old_ghost1_3, FE_PHN87_col_old_pacman_1, FE_PHN86_col_old_ghost1_3 : std_logic;
  signal FE_PHN85_row_old_ghost1_4, FE_PHN84_L1a_coin_memory_3, FE_PHN83_L1a_coin_memory_0, FE_PHN82_col_old_ghost1_0, FE_PHN81_col_old_ghost1_2 : std_logic;
  signal FE_PHN80_L3b_data_buffed_1, FE_PHN79_row_old_ghost2_3, FE_PHN78_dir_ghost1_1, FE_PHN77_row_old_ghost1_2, FE_PHN76_col_old_pacman_0 : std_logic;
  signal FE_PHN75_L1a_coin_memory_18, FE_PHN74_L1a_coin_memory_26, FE_PHN73_L3c_PC1_state_1, FE_PHN72_L1a_coin_memory_39, FE_PHN71_row_old_pacman_1 : std_logic;
  signal FE_PHN70_dir_ghost2_3, FE_PHN69_row_old_pacman_2, FE_PHN68_col_old_pacman_2, FE_PHN67_col_old_pacman_3, FE_PHN66_col_old_pacman_4 : std_logic;
  signal FE_PHN65_L3b_data_buffed_2, FE_PHN64_row_old_pacman_0, FE_PHN63_L1a_coin_memory_10, FE_PHN62_L1a_coin_memory_17, FE_PHN61_L1a_coin_memory_31 : std_logic;
  signal FE_PHN60_L1a_coin_memory_2, FE_PHN59_L1a_coin_memory_11, FE_PHN58_L1a_coin_memory_25, FE_PHN57_L1a_coin_memory_22, FE_PHN56_L1a_coin_memory_30 : std_logic;
  signal FE_PHN55_L1a_coin_memory_13, FE_PHN54_L1a_coin_memory_27, FE_PHN53_L1a_coin_memory_23, FE_PHN52_row_old_pacman_4, FE_PHN51_L6b_n_3 : std_logic;
  signal FE_PHN50_row_old_pacman_3, FE_PHN49_dir_ghost2_1, FE_PHN48_L6b_n_2, FE_PHN47_L1a_coin_memory_36, FE_PHN46_L1a_coin_memory_15 : std_logic;
  signal FE_PHN45_dir_ghost2_0, FE_PHN44_L1a_coin_memory_47, FE_PHN43_L1a_coin_memory_8, FE_PHN42_L1a_coin_memory_7, FE_PHN41_L1a_coin_memory_14 : std_logic;
  signal FE_PHN40_L1a_coin_memory_16, FE_PHN39_dir_ghost1_0, FE_PHN38_dir_ghost2_2, FE_PHN37_L1a_coin_memory_35, FE_PHN36_L1a_coin_memory_44 : std_logic;
  signal FE_PHN35_L1a_coin_memory_12, FE_PHN34_L1a_coin_memory_46, FE_PHN33_L1a_coin_memory_41, FE_PHN32_L1a_coin_memory_43, FE_PHN31_L1a_coin_memory_33 : std_logic;
  signal FE_PHN30_dir_ghost1_3, FE_PHN29_L1a_coin_memory_38, FE_PHN28_L1a_coin_memory_42, FE_PHN27_L1a_coin_memory_37, FE_PHN26_L1a_coin_memory_5 : std_logic;
  signal FE_PHN25_L1a_coin_memory_32, FE_PHN24_L1a_coin_memory_45, FE_PHN23_L1a_coin_memory_21, FE_PHN22_L1a_coin_memory_24, FE_PHN21_L1a_coin_memory_6 : std_logic;
  signal FE_PHN20_L1a_coin_memory_20, FE_PHN19_L1a_coin_memory_19, FE_PHN18_L1a_coin_memory_1, FE_PHN17_L1a_coin_memory_34, FE_PHN16_L1a_coin_memory_29 : std_logic;
  signal FE_PHN15_L3a_L1_state_2, FE_PHN14_L1a_coin_memory_4, FE_PHN13_dir_ghost1_2, FE_PHN12_L1a_coin_memory_9, FE_PHN11_L3a_L0_data_intermediate_1 : std_logic;
  signal FE_PHN10_L3b_L0_data_intermediate_2, FE_PHN9_L3a_L0_data_intermediate_2, FE_PHN8_L3a_L0_data_intermediate_0, FE_PHN7_L3b_L0_data_intermediate_1, FE_PHN6_L3a_L0_data_intermediate_3 : std_logic;
  signal FE_PHN5_L3b_L0_data_intermediate_3, FE_PHN4_L3b_L0_data_intermediate_0, FE_OFN3_cell_type_2, FE_OFN2_cell_type_1, FE_OFN1_cell_type_0 : std_logic;
  signal FE_OFN0_game_over_out, CTS_12, CTS_11, FE_DBTN1_vc_done_in, FE_DBTN0_game_over_out : std_logic;
  signal row_new_pacman : std_logic_vector(4 downto 0);
  signal col_new_ghost2 : std_logic_vector(4 downto 0);
  signal row_new_ghost2 : std_logic_vector(4 downto 0);
  signal col_new_pacman : std_logic_vector(4 downto 0);
  signal col_old_ghost1 : std_logic_vector(4 downto 0);
  signal row_old_ghost1 : std_logic_vector(4 downto 0);
  signal L3a_move : std_logic_vector(3 downto 0);
  signal L3c_move : std_logic_vector(3 downto 0);
  signal col_old_pacman : std_logic_vector(4 downto 0);
  signal row_old_pacman : std_logic_vector(4 downto 0);
  signal L3c_PC1_state : std_logic_vector(2 downto 0);
  signal col_old_ghost2 : std_logic_vector(4 downto 0);
  signal row_old_ghost2 : std_logic_vector(4 downto 0);
  signal L6a_count_int3 : std_logic_vector(6 downto 0);
  signal L6a_count_intern : std_logic_vector(6 downto 0);
  signal L6a_LBL1_state : std_logic_vector(3 downto 0);
  signal L6a_count_int2 : std_logic_vector(6 downto 0);
  signal L3a_L0_data_intermediate : std_logic_vector(3 downto 0);
  signal L3a_data_buffed : std_logic_vector(3 downto 0);
  signal L6b_state : std_logic_vector(1 downto 0);
  signal L3a_L1_state : std_logic_vector(2 downto 0);
  signal L1a_coin_memory : std_logic_vector(47 downto 0);
  signal row_coin : std_logic_vector(4 downto 0);
  signal col_coin : std_logic_vector(4 downto 0);
  signal L3b_move : std_logic_vector(3 downto 0);
  signal L3b_L1_state : std_logic_vector(2 downto 0);
  signal L3b_data_buffed : std_logic_vector(3 downto 0);
  signal L3b_L0_data_intermediate : std_logic_vector(3 downto 0);
  signal L0_n_1, L0_n_2, L0_n_3, L0_n_4, L0_n_5 : std_logic;
  signal L0_n_6, L0_n_7, L0_n_8, L0_n_9, L0_n_10 : std_logic;
  signal L0_n_11, L0_n_12, L0_n_13, L0_n_14, L0_n_15 : std_logic;
  signal L0_n_16, L0_n_17, L0_n_18, L0_n_19, L0_n_20 : std_logic;
  signal L0_n_21, L0_n_22, L0_n_23, L0_n_24, L0_n_25 : std_logic;
  signal L0_n_26, L0_n_27, L0_n_28, L0_n_29, L0_n_30 : std_logic;
  signal L0_n_31, L0_n_32, L0_n_33, L0_n_34, L0_n_35 : std_logic;
  signal L0_n_36, L0_n_37, L0_n_38, L0_n_39, L0_n_40 : std_logic;
  signal L0_n_41, L0_n_42, L0_n_43, L0_n_44, L0_n_45 : std_logic;
  signal L0_n_46, L0_n_47, L0_n_48, L0_n_50, L0_n_51 : std_logic;
  signal L1a_n_0, L1a_n_1, L1a_n_2, L1a_n_3, L1a_n_5 : std_logic;
  signal L1a_n_6, L1a_n_7, L1a_n_8, L1a_n_9, L1a_n_10 : std_logic;
  signal L1a_n_11, L1a_n_12, L1a_n_13, L1a_n_14, L1a_n_16 : std_logic;
  signal L1a_n_17, L1a_n_18, L1a_n_19, L1a_n_20, L1a_n_21 : std_logic;
  signal L1a_n_22, L1a_n_23, L1a_n_24, L1a_n_25, L1a_n_26 : std_logic;
  signal L1a_n_27, L1a_n_28, L1a_n_29, L1a_n_30, L1a_n_31 : std_logic;
  signal L1a_n_32, L1a_n_33, L1a_n_34, L1a_n_35, L1a_n_36 : std_logic;
  signal L1a_n_37, L1a_n_38, L1a_n_39, L1a_n_40, L1a_n_41 : std_logic;
  signal L1a_n_42, L1a_n_43, L1a_n_44, L1a_n_45, L1a_n_46 : std_logic;
  signal L1a_n_47, L1a_n_48, L1a_n_49, L1a_n_50, L1a_n_51 : std_logic;
  signal L1a_n_52, L1a_n_53, L1a_n_54, L1a_n_55, L1a_n_56 : std_logic;
  signal L1a_n_57, L1a_n_58, L1a_n_59, L1a_n_60, L1a_n_61 : std_logic;
  signal L1a_n_62, L1a_n_63, L1a_n_64, L1a_n_65, L1a_n_66 : std_logic;
  signal L1a_n_67, L1a_n_68, L1a_n_69, L1a_n_70, L1a_n_71 : std_logic;
  signal L1a_n_72, L1a_n_73, L1a_n_74, L1a_n_75, L1a_n_76 : std_logic;
  signal L1a_n_77, L1a_n_78, L1a_n_79, L1a_n_80, L1a_n_81 : std_logic;
  signal L1a_n_82, L1a_n_83, L1a_n_84, L1a_n_85, L1a_n_86 : std_logic;
  signal L1a_n_87, L1a_n_88, L1a_n_89, L1a_n_90, L1a_n_91 : std_logic;
  signal L1a_n_92, L1a_n_93, L1a_n_94, L1a_n_95, L1a_n_96 : std_logic;
  signal L1a_n_97, L1a_n_98, L1a_n_99, L1a_n_100, L1a_n_101 : std_logic;
  signal L1a_n_102, L1a_n_103, L1a_n_104, L1a_n_105, L1a_n_106 : std_logic;
  signal L1a_n_107, L1a_n_108, L1a_n_109, L1a_n_110, L1a_n_111 : std_logic;
  signal L1a_n_112, L1a_n_113, L1a_n_114, L1a_n_115, L1a_n_116 : std_logic;
  signal L1a_n_117, L1a_n_118, L1a_n_119, L1a_n_120, L1a_n_121 : std_logic;
  signal L1a_n_122, L1a_n_123, L1a_n_124, L1a_n_125, L1a_n_126 : std_logic;
  signal L1a_n_127, L1a_n_128, L1a_n_129, L1a_n_130, L1a_n_131 : std_logic;
  signal L1a_n_132, L1a_n_133, L1a_n_134, L1a_n_135, L1a_n_136 : std_logic;
  signal L1a_n_137, L1a_n_138, L1a_n_139, L1a_n_140, L1a_n_141 : std_logic;
  signal L1a_n_142, L1a_n_143, L1a_n_144, L1a_n_145, L1a_n_146 : std_logic;
  signal L1a_n_147, L1a_n_148, L1a_n_149, L1a_n_150, L1a_n_151 : std_logic;
  signal L1a_n_152, L1a_n_153, L1a_n_154, L1a_n_155, L1a_n_156 : std_logic;
  signal L1a_n_157, L1a_n_158, L1a_n_159, L1a_n_160, L1a_n_161 : std_logic;
  signal L1a_n_162, L1a_n_163, L1a_n_164, L1a_n_165, L1a_n_166 : std_logic;
  signal L1a_n_167, L1a_n_168, L1a_n_169, L1a_n_170, L1a_n_171 : std_logic;
  signal L1a_n_172, L1a_n_173, L1a_n_174, L1a_n_175, L1a_n_176 : std_logic;
  signal L1a_n_177, L1a_n_178, L1a_n_179, L1a_n_180, L1a_n_181 : std_logic;
  signal L1a_n_182, L1a_n_183, L1a_n_184, L1a_n_185, L1a_n_186 : std_logic;
  signal L1a_n_187, L1a_n_188, L1a_n_189, L1a_n_190, L1a_n_191 : std_logic;
  signal L1a_n_192, L1a_n_193, L1a_n_194, L1a_n_195, L1a_n_196 : std_logic;
  signal L1a_n_197, L1a_n_198, L1a_n_199, L1a_n_200, L1a_n_201 : std_logic;
  signal L1a_n_202, L1a_n_203, L1a_n_204, L1a_n_206, L1a_n_224 : std_logic;
  signal L1a_n_225, L2_IB1_n_0, L2_IB1_n_1, L2_IB1_n_2, L2_IB1_n_3 : std_logic;
  signal L2_IB1_n_4, L2_IB1_n_5, L2_IB1_n_6, L2_IB1_n_7, L2_IB1_n_8 : std_logic;
  signal L2_IB1_n_9, L2_IB1_n_10, L2_IB1_n_11, L2_IB1_n_12, L2_IB2_n_0 : std_logic;
  signal L2_IB2_n_1, L2_IB2_n_2, L2_IB2_n_3, L2_IB2_n_4, L2_IB2_n_5 : std_logic;
  signal L2_IB2_n_6, L2_IB2_n_7, L2_IB2_n_8, L2_IB2_n_9, L2_IB2_n_10 : std_logic;
  signal L2_IB2_n_11, L2_IB2_n_12, L2_c_g1, L2_c_g2, L3a_L1_n_1 : std_logic;
  signal L3a_L1_n_3, L3a_L1_n_4, L3a_L1_n_5, L3a_L1_n_7, L3a_L1_n_9 : std_logic;
  signal L3a_L1_n_10, L3a_L1_n_12, L3a_L1_n_13, L3a_L1_n_14, L3a_L1_n_15 : std_logic;
  signal L3a_L1_n_16, L3a_L1_n_17, L3a_L1_n_19, L3a_L1_n_20, L3a_L1_n_21 : std_logic;
  signal L3a_L1_n_22, L3a_L1_n_23, L3a_L1_n_24, L3a_L1_n_25, L3a_L1_n_26 : std_logic;
  signal L3a_L1_n_27, L3a_L1_n_34, L3a_L1_n_35, L3a_L1_n_36, L3a_L1_n_37 : std_logic;
  signal L3a_L1_n_38, L3a_mux_select, L3b_L1_n_0, L3b_L1_n_2, L3b_L1_n_3 : std_logic;
  signal L3b_L1_n_4, L3b_L1_n_6, L3b_L1_n_7, L3b_L1_n_8, L3b_L1_n_11 : std_logic;
  signal L3b_L1_n_12, L3b_L1_n_13, L3b_L1_n_14, L3b_L1_n_15, L3b_L1_n_16 : std_logic;
  signal L3b_L1_n_17, L3b_L1_n_18, L3b_L1_n_19, L3b_L1_n_20, L3b_L1_n_21 : std_logic;
  signal L3b_L1_n_22, L3b_L1_n_23, L3b_L1_n_24, L3b_L1_n_25, L3b_L1_n_26 : std_logic;
  signal L3b_L1_n_27, L3b_L1_n_34, L3b_L1_n_36, L3b_mux_select, L3b_n_0 : std_logic;
  signal L3b_n_1, L3b_n_2, L3b_n_3, L3b_n_4, L3b_n_5 : std_logic;
  signal L3b_n_6, L3b_n_7, L3b_n_8, L3b_n_9, L3b_n_10 : std_logic;
  signal L3b_n_11, L3b_n_12, L3b_n_13, L3b_n_14, L3b_n_15 : std_logic;
  signal L3b_n_16, L3b_n_17, L3b_n_18, L3b_n_19, L3b_n_20 : std_logic;
  signal L3b_n_21, L3b_n_22, L3b_n_23, L3b_n_24, L3b_n_25 : std_logic;
  signal L3b_n_26, L3b_n_37, L3b_n_38, L3b_n_39, L3b_n_40 : std_logic;
  signal L3b_n_41, L3b_n_42, L3b_n_43, L3b_n_44, L3b_n_45 : std_logic;
  signal L3b_n_46, L3b_n_47, L3b_n_48, L3b_n_49, L3b_n_50 : std_logic;
  signal L3b_n_51, L3b_n_52, L3b_n_53, L3b_n_54, L3b_n_55 : std_logic;
  signal L3b_n_56, L3b_n_57, L3b_n_58, L3b_n_59, L3b_n_60 : std_logic;
  signal L3b_n_61, L3b_n_62, L3b_n_63, L3b_n_64, L3b_n_65 : std_logic;
  signal L3b_n_66, L3b_n_67, L3b_n_68, L3b_n_69, L3b_n_70 : std_logic;
  signal L3b_n_71, L3b_n_72, L3b_n_74, L3b_n_75, L3b_n_76 : std_logic;
  signal L3b_n_77, L3b_n_78, L3b_n_79, L3b_n_80, L3c_PC1_n_0 : std_logic;
  signal L3c_PC1_n_1, L3c_PC1_n_2, L3c_PC1_n_3, L3c_PC1_n_4, L3c_PC1_n_5 : std_logic;
  signal L3c_n_0, L3c_n_1, L3c_n_2, L3c_n_3, L3c_n_4 : std_logic;
  signal L3c_n_5, L3c_n_6, L3c_n_7, L3c_n_8, L3c_n_9 : std_logic;
  signal L3c_n_10, L3c_n_11, L3c_n_12, L3c_n_13, L3c_n_14 : std_logic;
  signal L3c_n_15, L3c_n_16, L3c_n_17, L3c_n_18, L3c_n_19 : std_logic;
  signal L3c_n_20, L3c_n_21, L3c_n_22, L3c_n_23, L3c_n_24 : std_logic;
  signal L3c_n_25, L3c_n_26, L3c_n_27, L3c_n_28, L3c_n_29 : std_logic;
  signal L3c_n_30, L3c_n_31, L3c_n_32, L3c_n_33, L3c_n_34 : std_logic;
  signal L3c_n_35, L3c_n_36, L3c_n_37, L3c_n_38, L3c_n_39 : std_logic;
  signal L3c_n_40, L3c_n_41, L3c_n_42, L3c_n_43, L3c_n_44 : std_logic;
  signal L3c_n_45, L3c_n_46, L3c_n_47, L3c_n_48, L3c_n_49 : std_logic;
  signal L3c_n_50, L3c_n_51, L3c_n_52, L3c_n_53, L3c_n_54 : std_logic;
  signal L3c_n_55, L3c_n_56, L3c_n_57, L3c_n_58, L3c_n_59 : std_logic;
  signal L3c_n_60, L6a_LBL1_n_0, L6a_LBL1_n_1, L6a_LBL1_n_2, L6a_LBL1_n_3 : std_logic;
  signal L6a_LBL1_n_4, L6a_LBL1_n_5, L6a_LBL1_n_6, L6a_LBL1_n_7, L6a_LBL1_n_8 : std_logic;
  signal L6a_LBL1_n_9, L6a_LBL1_n_10, L6a_LBL1_n_12, L6a_LBL1_n_13, L6a_LBL1_n_14 : std_logic;
  signal L6a_LBL1_n_15, L6a_LBL1_n_16, L6a_LBL1_n_18, L6a_LBL1_n_19, L6a_LBL1_n_20 : std_logic;
  signal L6a_LBL1_n_21, L6a_LBL1_n_22, L6a_LBL1_n_23, L6a_LBL1_n_24, L6a_LBL1_n_25 : std_logic;
  signal L6a_LBL1_n_26, L6a_LBL1_n_27, L6a_LBL1_n_28, L6a_LBL1_n_29, L6a_LBL1_n_30 : std_logic;
  signal L6a_LBL1_n_31, L6a_LBL1_n_32, L6a_LBL1_n_33, L6a_LBL1_n_34, L6a_LBL1_n_35 : std_logic;
  signal L6a_LBL1_n_37, L6a_LBL1_n_38, L6a_LBL1_n_39, L6a_LBL1_n_40, L6a_LBL1_n_41 : std_logic;
  signal L6a_LBL1_n_42, L6a_LBL1_n_43, L6a_LBL1_n_44, L6a_LBL1_n_45, L6a_LBL1_n_46 : std_logic;
  signal L6a_LBL1_n_47, L6a_LBL1_n_48, L6a_LBL1_n_49, L6a_LBL1_n_50, L6a_LBL1_n_51 : std_logic;
  signal L6a_LBL1_n_52, L6a_LBL1_n_53, L6a_LBL1_n_55, L6a_LBL1_n_56, L6a_LBL1_n_58 : std_logic;
  signal L6a_LBL1_n_59, L6a_LBL1_n_60, L6a_LBL1_n_61, L6a_LBL1_n_62, L6a_LBL1_n_63 : std_logic;
  signal L6a_LBL1_n_65, L6a_LBL1_n_66, L6a_LBL1_n_67, L6a_LBL1_n_68, L6a_LBL1_n_69 : std_logic;
  signal L6a_LBL1_n_70, L6a_LBL1_n_71, L6a_LBL1_n_76, L6a_LBL1_n_77, L6a_LBL1_n_90 : std_logic;
  signal L6a_LBL1_n_91, L6a_LBL1_n_92, L6a_LBL2_n_0, L6a_LBL4_n_0, L6a_LBL4_n_1 : std_logic;
  signal L6a_LBL4_n_2, L6a_LBL4_n_3, L6a_LBL4_n_4, L6a_LBL4_n_5, L6a_LBL4_n_12 : std_logic;
  signal L6a_LBL4_plus_6_50_1, L6a_LBL4_plus_6_50_2, L6a_LBL4_plus_6_50_3, L6a_LBL4_plus_6_50_4, L6a_LBL4_plus_6_50_5 : std_logic;
  signal L6a_c_rst_int, L6a_n_0, L6a_n_1, L6a_n_2, L6a_n_3 : std_logic;
  signal L6a_n_4, L6a_n_5, L6a_n_6, L6b_n_1, L6b_n_2 : std_logic;
  signal L6b_n_3, coin_present, coin_register_reset, ghost1_map_select, ghost1_ready : std_logic;
  signal ghost1_start, ghost2_start, logic_0_1_net, logic_1_1_net, n_0 : std_logic;
  signal n_1, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_9, n_10 : std_logic;
  signal n_11, n_12, n_13, n_14, n_16 : std_logic;
  signal n_17, n_18, n_19, n_20, n_21 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_29, n_30, n_31 : std_logic;
  signal n_32, n_33, n_34, n_35, n_36 : std_logic;
  signal n_37, n_38, n_39, n_40, n_41 : std_logic;
  signal n_42, n_43, n_44, n_45, n_46 : std_logic;
  signal n_47, n_48, n_49, n_50, n_52 : std_logic;
  signal n_53, n_54, n_55, n_56, n_57 : std_logic;
  signal n_58, n_59, n_60, n_61, n_62 : std_logic;
  signal n_63, n_64, n_65, n_67, n_68 : std_logic;
  signal n_69, n_70, n_71, n_72, n_73 : std_logic;
  signal n_74, n_75, n_76, n_77, n_78 : std_logic;
  signal n_79, n_80, n_81, n_82, n_83 : std_logic;
  signal n_84, n_85, n_86, n_87, n_88 : std_logic;
  signal n_89, n_90, n_91, n_92, n_93 : std_logic;
  signal n_94, n_95, n_96, n_97, n_98 : std_logic;
  signal n_99, n_100, n_101, n_102, n_103 : std_logic;
  signal n_104, n_105, n_106, n_107, n_108 : std_logic;
  signal n_109, n_110, n_111, n_112, n_113 : std_logic;
  signal n_114, n_115, n_116, n_117, n_118 : std_logic;
  signal n_119, n_120, n_121, n_122, n_123 : std_logic;
  signal n_124, n_125, n_126, n_127, n_128 : std_logic;
  signal n_129, n_130, n_131, n_132, n_133 : std_logic;
  signal n_136, n_137, n_138, n_139, n_140 : std_logic;
  signal n_141, n_142, n_143, n_144, n_145 : std_logic;
  signal n_164, pacman_map_select, pacman_ready, pacman_start, pos_is_wall : std_logic;
  signal vc_done_pulse, wall_present, write_coin, zero_coins : std_logic;

begin

  game_over_out <= score_reset_out;
  FE_PHC120_L3b_L1_n_18 : DEL01BWP7T port map(I => L3b_L1_n_18, Z => FE_PHN120_L3b_L1_n_18);
  FE_PHC119_L3b_L1_n_16 : DEL0BWP7T port map(I => L3b_L1_n_16, Z => FE_PHN119_L3b_L1_n_16);
  FE_PHC118_L3b_L1_n_17 : DEL0BWP7T port map(I => L3b_L1_n_17, Z => FE_PHN118_L3b_L1_n_17);
  FE_PHC117_L3a_L1_n_21 : CKBD0BWP7T port map(I => FE_PHN117_L3a_L1_n_21, Z => L3a_L1_n_21);
  FE_PHC116_L3a_L1_n_20 : DEL0BWP7T port map(I => L3a_L1_n_20, Z => FE_PHN116_L3a_L1_n_20);
  FE_PHC115_L3b_L1_n_0 : DEL02BWP7T port map(I => L3b_L1_n_0, Z => FE_PHN115_L3b_L1_n_0);
  FE_PHC114_L6a_LBL1_n_21 : DEL01BWP7T port map(I => L6a_LBL1_n_21, Z => FE_PHN114_L6a_LBL1_n_21);
  FE_PHC113_L3a_L1_n_22 : CKBD0BWP7T port map(I => L3a_L1_n_22, Z => FE_PHN113_L3a_L1_n_22);
  FE_PHC112_L3c_PC1_n_5 : DEL1BWP7T port map(I => FE_PHN112_L3c_PC1_n_5, Z => L3c_PC1_n_5);
  FE_PHC111_L3c_PC1_state_0 : DEL1BWP7T port map(I => L3c_PC1_state(0), Z => FE_PHN111_L3c_PC1_state_0);
  FE_PHC110_L6a_LBL1_state_3 : DEL01BWP7T port map(I => FE_PHN110_L6a_LBL1_state_3, Z => L6a_LBL1_state(3));
  FE_PHC109_L6a_LBL1_state_0 : CKBD0BWP7T port map(I => FE_PHN109_L6a_LBL1_state_0, Z => L6a_LBL1_state(0));
  FE_PHC108_row_old_ghost2_1 : DEL0BWP7T port map(I => row_old_ghost2(1), Z => FE_PHN108_row_old_ghost2_1);
  FE_PHC107_row_old_ghost2_4 : DEL0BWP7T port map(I => row_old_ghost2(4), Z => FE_PHN107_row_old_ghost2_4);
  FE_PHC106_L1a_coin_memory_28 : DEL4BWP7T port map(I => L1a_coin_memory(28), Z => FE_PHN106_L1a_coin_memory_28);
  FE_PHC105_col_old_ghost2_2 : DEL0BWP7T port map(I => col_old_ghost2(2), Z => FE_PHN105_col_old_ghost2_2);
  FE_PHC104_L1a_coin_memory_40 : DEL3BWP7T port map(I => L1a_coin_memory(40), Z => FE_PHN104_L1a_coin_memory_40);
  FE_PHC103_row_old_ghost2_0 : DEL0BWP7T port map(I => row_old_ghost2(0), Z => FE_PHN103_row_old_ghost2_0);
  FE_PHC102_col_old_ghost2_3 : DEL0BWP7T port map(I => col_old_ghost2(3), Z => FE_PHN102_col_old_ghost2_3);
  FE_PHC101_row_old_ghost2_2 : DEL0BWP7T port map(I => row_old_ghost2(2), Z => FE_PHN101_row_old_ghost2_2);
  FE_PHC100_col_old_ghost1_4 : DEL1BWP7T port map(I => col_old_ghost1(4), Z => FE_PHN100_col_old_ghost1_4);
  FE_PHC99_L3a_data_buffed_1 : CKBD0BWP7T port map(I => L3a_data_buffed(1), Z => FE_PHN99_L3a_data_buffed_1);
  FE_PHC98_col_old_ghost2_4 : DEL0BWP7T port map(I => col_old_ghost2(4), Z => FE_PHN98_col_old_ghost2_4);
  FE_PHC97_col_old_ghost2_1 : DEL0BWP7T port map(I => col_old_ghost2(1), Z => FE_PHN97_col_old_ghost2_1);
  FE_PHC96_L3b_data_buffed_0 : DEL02BWP7T port map(I => FE_PHN96_L3b_data_buffed_0, Z => L3b_data_buffed(0));
  FE_PHC95_row_old_ghost1_1 : DEL0BWP7T port map(I => row_old_ghost1(1), Z => FE_PHN95_row_old_ghost1_1);
  FE_PHC94_col_old_ghost2_0 : DEL0BWP7T port map(I => col_old_ghost2(0), Z => FE_PHN94_col_old_ghost2_0);
  FE_PHC93_L6a_LBL1_n_2 : CKBD0BWP7T port map(I => L6a_LBL1_n_2, Z => FE_PHN93_L6a_LBL1_n_2);
  FE_PHC92_L3a_data_buffed_2 : DEL02BWP7T port map(I => FE_PHN92_L3a_data_buffed_2, Z => L3a_data_buffed(2));
  FE_PHC91_col_old_ghost1_1 : DEL0BWP7T port map(I => col_old_ghost1(1), Z => FE_PHN91_col_old_ghost1_1);
  FE_PHC90_row_old_ghost1_0 : DEL0BWP7T port map(I => row_old_ghost1(0), Z => FE_PHN90_row_old_ghost1_0);
  FE_PHC89_L3a_data_buffed_0 : DEL02BWP7T port map(I => L3a_data_buffed(0), Z => FE_PHN89_L3a_data_buffed_0);
  FE_PHC88_row_old_ghost1_3 : DEL0BWP7T port map(I => row_old_ghost1(3), Z => FE_PHN88_row_old_ghost1_3);
  FE_PHC87_col_old_pacman_1 : DEL0BWP7T port map(I => col_old_pacman(1), Z => FE_PHN87_col_old_pacman_1);
  FE_PHC86_col_old_ghost1_3 : DEL0BWP7T port map(I => col_old_ghost1(3), Z => FE_PHN86_col_old_ghost1_3);
  FE_PHC85_row_old_ghost1_4 : DEL0BWP7T port map(I => row_old_ghost1(4), Z => FE_PHN85_row_old_ghost1_4);
  FE_PHC84_L1a_coin_memory_3 : DEL1BWP7T port map(I => L1a_coin_memory(3), Z => FE_PHN84_L1a_coin_memory_3);
  FE_PHC83_L1a_coin_memory_0 : DEL0BWP7T port map(I => L1a_coin_memory(0), Z => FE_PHN83_L1a_coin_memory_0);
  FE_PHC82_col_old_ghost1_0 : DEL0BWP7T port map(I => col_old_ghost1(0), Z => FE_PHN82_col_old_ghost1_0);
  FE_PHC81_col_old_ghost1_2 : DEL0BWP7T port map(I => col_old_ghost1(2), Z => FE_PHN81_col_old_ghost1_2);
  FE_PHC80_L3b_data_buffed_1 : CKBD0BWP7T port map(I => FE_PHN80_L3b_data_buffed_1, Z => L3b_data_buffed(1));
  FE_PHC79_row_old_ghost2_3 : CKBD0BWP7T port map(I => row_old_ghost2(3), Z => FE_PHN79_row_old_ghost2_3);
  FE_PHC78_dir_ghost1_1 : DEL2BWP7T port map(I => dir_ghost1(1), Z => FE_PHN78_dir_ghost1_1);
  FE_PHC77_row_old_ghost1_2 : DEL0BWP7T port map(I => row_old_ghost1(2), Z => FE_PHN77_row_old_ghost1_2);
  FE_PHC76_col_old_pacman_0 : DEL0BWP7T port map(I => col_old_pacman(0), Z => FE_PHN76_col_old_pacman_0);
  FE_PHC75_L1a_coin_memory_18 : DEL2BWP7T port map(I => L1a_coin_memory(18), Z => FE_PHN75_L1a_coin_memory_18);
  FE_PHC74_L1a_coin_memory_26 : DEL2BWP7T port map(I => L1a_coin_memory(26), Z => FE_PHN74_L1a_coin_memory_26);
  FE_PHC73_L3c_PC1_state_1 : DEL1BWP7T port map(I => L3c_PC1_state(1), Z => FE_PHN73_L3c_PC1_state_1);
  FE_PHC72_L1a_coin_memory_39 : DEL1BWP7T port map(I => L1a_coin_memory(39), Z => FE_PHN72_L1a_coin_memory_39);
  FE_PHC71_row_old_pacman_1 : DEL0BWP7T port map(I => row_old_pacman(1), Z => FE_PHN71_row_old_pacman_1);
  FE_PHC70_dir_ghost2_3 : DEL1BWP7T port map(I => dir_ghost2(3), Z => FE_PHN70_dir_ghost2_3);
  FE_PHC69_row_old_pacman_2 : DEL0BWP7T port map(I => row_old_pacman(2), Z => FE_PHN69_row_old_pacman_2);
  FE_PHC68_col_old_pacman_2 : DEL0BWP7T port map(I => col_old_pacman(2), Z => FE_PHN68_col_old_pacman_2);
  FE_PHC67_col_old_pacman_3 : DEL0BWP7T port map(I => col_old_pacman(3), Z => FE_PHN67_col_old_pacman_3);
  FE_PHC66_col_old_pacman_4 : DEL0BWP7T port map(I => col_old_pacman(4), Z => FE_PHN66_col_old_pacman_4);
  FE_PHC65_L3b_data_buffed_2 : DEL02BWP7T port map(I => FE_PHN65_L3b_data_buffed_2, Z => L3b_data_buffed(2));
  FE_PHC64_row_old_pacman_0 : DEL0BWP7T port map(I => row_old_pacman(0), Z => FE_PHN64_row_old_pacman_0);
  FE_PHC63_L1a_coin_memory_10 : DEL1BWP7T port map(I => L1a_coin_memory(10), Z => FE_PHN63_L1a_coin_memory_10);
  FE_PHC62_L1a_coin_memory_17 : DEL1BWP7T port map(I => L1a_coin_memory(17), Z => FE_PHN62_L1a_coin_memory_17);
  FE_PHC61_L1a_coin_memory_31 : DEL1BWP7T port map(I => L1a_coin_memory(31), Z => FE_PHN61_L1a_coin_memory_31);
  FE_PHC60_L1a_coin_memory_2 : DEL1BWP7T port map(I => L1a_coin_memory(2), Z => FE_PHN60_L1a_coin_memory_2);
  FE_PHC59_L1a_coin_memory_11 : DEL1BWP7T port map(I => L1a_coin_memory(11), Z => FE_PHN59_L1a_coin_memory_11);
  FE_PHC58_L1a_coin_memory_25 : DEL1BWP7T port map(I => L1a_coin_memory(25), Z => FE_PHN58_L1a_coin_memory_25);
  FE_PHC57_L1a_coin_memory_22 : DEL1BWP7T port map(I => L1a_coin_memory(22), Z => FE_PHN57_L1a_coin_memory_22);
  FE_PHC56_L1a_coin_memory_30 : DEL1BWP7T port map(I => L1a_coin_memory(30), Z => FE_PHN56_L1a_coin_memory_30);
  FE_PHC55_L1a_coin_memory_13 : DEL1BWP7T port map(I => L1a_coin_memory(13), Z => FE_PHN55_L1a_coin_memory_13);
  FE_PHC54_L1a_coin_memory_27 : DEL1BWP7T port map(I => L1a_coin_memory(27), Z => FE_PHN54_L1a_coin_memory_27);
  FE_PHC53_L1a_coin_memory_23 : DEL1BWP7T port map(I => L1a_coin_memory(23), Z => FE_PHN53_L1a_coin_memory_23);
  FE_PHC52_row_old_pacman_4 : DEL0BWP7T port map(I => row_old_pacman(4), Z => FE_PHN52_row_old_pacman_4);
  FE_PHC51_L6b_n_3 : DEL1BWP7T port map(I => L6b_n_3, Z => FE_PHN51_L6b_n_3);
  FE_PHC50_row_old_pacman_3 : DEL0BWP7T port map(I => row_old_pacman(3), Z => FE_PHN50_row_old_pacman_3);
  FE_PHC49_dir_ghost2_1 : DEL0BWP7T port map(I => dir_ghost2(1), Z => FE_PHN49_dir_ghost2_1);
  FE_PHC48_L6b_n_2 : DEL0BWP7T port map(I => L6b_n_2, Z => FE_PHN48_L6b_n_2);
  FE_PHC47_L1a_coin_memory_36 : DEL0BWP7T port map(I => L1a_coin_memory(36), Z => FE_PHN47_L1a_coin_memory_36);
  FE_PHC46_L1a_coin_memory_15 : DEL0BWP7T port map(I => L1a_coin_memory(15), Z => FE_PHN46_L1a_coin_memory_15);
  FE_PHC45_dir_ghost2_0 : DEL0BWP7T port map(I => dir_ghost2(0), Z => FE_PHN45_dir_ghost2_0);
  FE_PHC44_L1a_coin_memory_47 : DEL0BWP7T port map(I => L1a_coin_memory(47), Z => FE_PHN44_L1a_coin_memory_47);
  FE_PHC43_L1a_coin_memory_8 : DEL0BWP7T port map(I => L1a_coin_memory(8), Z => FE_PHN43_L1a_coin_memory_8);
  FE_PHC42_L1a_coin_memory_7 : DEL0BWP7T port map(I => L1a_coin_memory(7), Z => FE_PHN42_L1a_coin_memory_7);
  FE_PHC41_L1a_coin_memory_14 : DEL0BWP7T port map(I => L1a_coin_memory(14), Z => FE_PHN41_L1a_coin_memory_14);
  FE_PHC40_L1a_coin_memory_16 : DEL0BWP7T port map(I => L1a_coin_memory(16), Z => FE_PHN40_L1a_coin_memory_16);
  FE_PHC39_dir_ghost1_0 : DEL0BWP7T port map(I => dir_ghost1(0), Z => FE_PHN39_dir_ghost1_0);
  FE_PHC38_dir_ghost2_2 : DEL0BWP7T port map(I => dir_ghost2(2), Z => FE_PHN38_dir_ghost2_2);
  FE_PHC37_L1a_coin_memory_35 : DEL0BWP7T port map(I => L1a_coin_memory(35), Z => FE_PHN37_L1a_coin_memory_35);
  FE_PHC36_L1a_coin_memory_44 : DEL0BWP7T port map(I => L1a_coin_memory(44), Z => FE_PHN36_L1a_coin_memory_44);
  FE_PHC35_L1a_coin_memory_12 : DEL0BWP7T port map(I => L1a_coin_memory(12), Z => FE_PHN35_L1a_coin_memory_12);
  FE_PHC34_L1a_coin_memory_46 : DEL0BWP7T port map(I => L1a_coin_memory(46), Z => FE_PHN34_L1a_coin_memory_46);
  FE_PHC33_L1a_coin_memory_41 : DEL0BWP7T port map(I => L1a_coin_memory(41), Z => FE_PHN33_L1a_coin_memory_41);
  FE_PHC32_L1a_coin_memory_43 : DEL0BWP7T port map(I => L1a_coin_memory(43), Z => FE_PHN32_L1a_coin_memory_43);
  FE_PHC31_L1a_coin_memory_33 : DEL0BWP7T port map(I => L1a_coin_memory(33), Z => FE_PHN31_L1a_coin_memory_33);
  FE_PHC30_dir_ghost1_3 : DEL0BWP7T port map(I => dir_ghost1(3), Z => FE_PHN30_dir_ghost1_3);
  FE_PHC29_L1a_coin_memory_38 : DEL0BWP7T port map(I => L1a_coin_memory(38), Z => FE_PHN29_L1a_coin_memory_38);
  FE_PHC28_L1a_coin_memory_42 : DEL0BWP7T port map(I => L1a_coin_memory(42), Z => FE_PHN28_L1a_coin_memory_42);
  FE_PHC27_L1a_coin_memory_37 : DEL0BWP7T port map(I => L1a_coin_memory(37), Z => FE_PHN27_L1a_coin_memory_37);
  FE_PHC26_L1a_coin_memory_5 : DEL0BWP7T port map(I => L1a_coin_memory(5), Z => FE_PHN26_L1a_coin_memory_5);
  FE_PHC25_L1a_coin_memory_32 : DEL0BWP7T port map(I => L1a_coin_memory(32), Z => FE_PHN25_L1a_coin_memory_32);
  FE_PHC24_L1a_coin_memory_45 : DEL0BWP7T port map(I => L1a_coin_memory(45), Z => FE_PHN24_L1a_coin_memory_45);
  FE_PHC23_L1a_coin_memory_21 : DEL0BWP7T port map(I => L1a_coin_memory(21), Z => FE_PHN23_L1a_coin_memory_21);
  FE_PHC22_L1a_coin_memory_24 : DEL0BWP7T port map(I => L1a_coin_memory(24), Z => FE_PHN22_L1a_coin_memory_24);
  FE_PHC21_L1a_coin_memory_6 : DEL0BWP7T port map(I => L1a_coin_memory(6), Z => FE_PHN21_L1a_coin_memory_6);
  FE_PHC20_L1a_coin_memory_20 : DEL0BWP7T port map(I => L1a_coin_memory(20), Z => FE_PHN20_L1a_coin_memory_20);
  FE_PHC19_L1a_coin_memory_19 : DEL0BWP7T port map(I => L1a_coin_memory(19), Z => FE_PHN19_L1a_coin_memory_19);
  FE_PHC18_L1a_coin_memory_1 : DEL0BWP7T port map(I => L1a_coin_memory(1), Z => FE_PHN18_L1a_coin_memory_1);
  FE_PHC17_L1a_coin_memory_34 : DEL0BWP7T port map(I => L1a_coin_memory(34), Z => FE_PHN17_L1a_coin_memory_34);
  FE_PHC16_L1a_coin_memory_29 : DEL0BWP7T port map(I => L1a_coin_memory(29), Z => FE_PHN16_L1a_coin_memory_29);
  FE_PHC15_L3a_L1_state_2 : DEL0BWP7T port map(I => L3a_L1_state(2), Z => FE_PHN15_L3a_L1_state_2);
  FE_PHC14_L1a_coin_memory_4 : DEL0BWP7T port map(I => L1a_coin_memory(4), Z => FE_PHN14_L1a_coin_memory_4);
  FE_PHC13_dir_ghost1_2 : DEL0BWP7T port map(I => dir_ghost1(2), Z => FE_PHN13_dir_ghost1_2);
  FE_PHC12_L1a_coin_memory_9 : DEL0BWP7T port map(I => L1a_coin_memory(9), Z => FE_PHN12_L1a_coin_memory_9);
  FE_PHC11_L3a_L0_data_intermediate_1 : DEL1BWP7T port map(I => FE_PHN11_L3a_L0_data_intermediate_1, Z => L3a_L0_data_intermediate(1));
  FE_PHC10_L3b_L0_data_intermediate_2 : DEL1BWP7T port map(I => L3b_L0_data_intermediate(2), Z => FE_PHN10_L3b_L0_data_intermediate_2);
  FE_PHC9_L3a_L0_data_intermediate_2 : DEL1BWP7T port map(I => FE_PHN9_L3a_L0_data_intermediate_2, Z => L3a_L0_data_intermediate(2));
  FE_PHC8_L3a_L0_data_intermediate_0 : DEL1BWP7T port map(I => FE_PHN8_L3a_L0_data_intermediate_0, Z => L3a_L0_data_intermediate(0));
  FE_PHC7_L3b_L0_data_intermediate_1 : DEL1BWP7T port map(I => FE_PHN7_L3b_L0_data_intermediate_1, Z => L3b_L0_data_intermediate(1));
  FE_PHC6_L3a_L0_data_intermediate_3 : DEL1BWP7T port map(I => FE_PHN6_L3a_L0_data_intermediate_3, Z => L3a_L0_data_intermediate(3));
  FE_PHC5_L3b_L0_data_intermediate_3 : DEL1BWP7T port map(I => L3b_L0_data_intermediate(3), Z => FE_PHN5_L3b_L0_data_intermediate_3);
  FE_PHC4_L3b_L0_data_intermediate_0 : DEL1BWP7T port map(I => FE_PHN4_L3b_L0_data_intermediate_0, Z => L3b_L0_data_intermediate(0));
  FE_RC_0_0 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => FE_PHN98_col_old_ghost2_4, B1 => L3b_n_0, B2 => col_new_ghost2(4), Z => L3b_n_5);
  FE_OFC3_cell_type_2 : BUFFD5BWP7T port map(I => FE_OFN3_cell_type_2, Z => cell_type(2));
  FE_OFC2_cell_type_1 : BUFFD5BWP7T port map(I => FE_OFN2_cell_type_1, Z => cell_type(1));
  FE_OFC1_cell_type_0 : BUFFD5BWP7T port map(I => FE_OFN1_cell_type_0, Z => cell_type(0));
  FE_OFC0_game_over_out : BUFFD10BWP7T port map(I => FE_OFN0_game_over_out, Z => score_reset_out);
  CTS_ccl_a_BUF_clk_G0_L1_2 : CKBD6BWP7T port map(I => clk, Z => CTS_12);
  CTS_ccl_a_BUF_clk_G0_L1_1 : CKBD8BWP7T port map(I => clk, Z => CTS_11);
  FE_DBTC1_vc_done_in : INVD0BWP7T port map(I => vc_done_in, ZN => FE_DBTN1_vc_done_in);
  FE_DBTC0_game_over_out : INVD1BWP7T port map(I => score_reset_out, ZN => FE_DBTN0_game_over_out);
  L3a_L5 : ghost_cont port map(clk => clk, reset => score_reset_out, ghost_start => ghost1_start, pos_is_wall => pos_is_wall, en_cor_ghost => L3a_mux_select, ghost_ready => ghost1_ready, en_wall => ghost1_map_select);
  L3c_IS1 : input_system port map(clk => clk, reset => score_reset_out, data_input => dir_pacman, data_output => L3c_move);
  L6a_LBL3 : multiplexer port map(vc_done => vc_done_pulse, count_old(6) => L6a_n_6, count_old(5) => L6a_n_1, count_old(4) => L6a_n_0, count_old(3) => L6a_n_3, count_old(2) => L6a_n_2, count_old(1) => L6a_n_5, count_old(0) => L6a_n_4, count_new(6) => L6a_count_int3(6), count_new(5) => L6a_LBL4_plus_6_50_5, count_new(4) => L6a_LBL4_plus_6_50_4, count_new(3) => L6a_LBL4_plus_6_50_3, count_new(2) => L6a_LBL4_plus_6_50_2, count_new(1) => L6a_LBL4_plus_6_50_1, count_new(0) => L6a_LBL4_n_5, count => L6a_count_intern);
  L3b_L5 : ghost_cont_SPC_1 port map(clk => clk, reset => score_reset_out, ghost_start => ghost2_start, pos_is_wall => pos_is_wall, en_cor_ghost => L3b_mux_select, ghost_ready => L3b_n_79, en_wall => L3b_n_80);
  g3368 : IND4D0BWP7T port map(A1 => n_124, B1 => n_121, B2 => n_132, B3 => n_133, ZN => pos_is_wall);
  g3369 : AOI211XD0BWP7T port map(A1 => n_129, A2 => n_89, B => n_131, C => n_114, ZN => n_133);
  g3370 : IAO21D0BWP7T port map(A1 => n_127, A2 => n_89, B => n_130, ZN => n_132);
  g3371 : OAI31D0BWP7T port map(A1 => n_75, A2 => n_86, A3 => n_111, B => n_128, ZN => n_131);
  g3372 : OAI32D1BWP7T port map(A1 => n_88, A2 => n_103, A3 => n_122, B1 => n_94, B2 => n_125, ZN => n_130);
  g3373 : NR2D1BWP7T port map(A1 => n_126, A2 => n_99, ZN => n_129);
  g3374 : ND4D0BWP7T port map(A1 => n_119, A2 => n_83, A3 => n_80, A4 => n_65, ZN => n_128);
  g3375 : MAOI22D0BWP7T port map(A1 => n_120, A2 => n_102, B1 => n_123, B2 => n_103, ZN => n_127);
  g3376 : OA21D0BWP7T port map(A1 => n_105, A2 => n_98, B => n_123, Z => n_126);
  g3377 : AO211D0BWP7T port map(A1 => n_118, A2 => n_108, B => n_99, C => n_89, Z => n_125);
  g3378 : OAI33D1BWP7T port map(A1 => n_86, A2 => n_97, A3 => n_117, B1 => n_93, B2 => n_99, B3 => n_116, ZN => n_124);
  g3379 : OA211D0BWP7T port map(A1 => n_96, A2 => n_104, B => n_117, C => n_112, Z => n_123);
  g3380 : OA211D0BWP7T port map(A1 => n_100, A2 => n_104, B => n_118, C => n_110, Z => n_122);
  g3381 : MAOI22D0BWP7T port map(A1 => n_109, A2 => n_101, B1 => n_115, B2 => n_104, ZN => n_121);
  g3382 : OAI211D1BWP7T port map(A1 => n_79, A2 => n_107, B => n_112, C => n_108, ZN => n_120);
  g3383 : OAI22D0BWP7T port map(A1 => n_113, A2 => n_75, B1 => n_107, B2 => n_97, ZN => n_119);
  g3384 : OR2D1BWP7T port map(A1 => n_112, A2 => n_96, Z => n_118);
  g3385 : OA31D1BWP7T port map(A1 => n_79, A2 => n_95, A3 => n_100, B => n_110, Z => n_117);
  g3386 : OA21D0BWP7T port map(A1 => n_107, A2 => n_78, B => n_110, Z => n_116);
  g3387 : MAOI22D0BWP7T port map(A1 => n_102, A2 => n_95, B1 => n_107, B2 => n_86, ZN => n_115);
  g3388 : NR4D0BWP7T port map(A1 => n_99, A2 => n_93, A3 => n_88, A4 => n_87, ZN => n_114);
  g3389 : OA21D0BWP7T port map(A1 => n_100, A2 => n_78, B => n_108, Z => n_113);
  g3390 : OA21D0BWP7T port map(A1 => n_106, A2 => n_100, B => n_104, Z => n_111);
  g3391 : ND3D0BWP7T port map(A1 => n_101, A2 => n_97, A3 => n_78, ZN => n_112);
  g3392 : INR2D1BWP7T port map(A1 => n_102, B1 => n_105, ZN => n_109);
  g3393 : IND2D1BWP7T port map(A1 => n_105, B1 => n_100, ZN => n_110);
  g3394 : OR2D1BWP7T port map(A1 => n_106, A2 => n_78, Z => n_108);
  g3395 : ND2D1BWP7T port map(A1 => n_101, A2 => n_95, ZN => n_107);
  g3396 : NR2XD0BWP7T port map(A1 => n_98, A2 => n_96, ZN => n_106);
  g3397 : ND2D1BWP7T port map(A1 => n_96, A2 => n_79, ZN => n_105);
  g3398 : ND2D1BWP7T port map(A1 => n_98, A2 => n_79, ZN => n_104);
  g3399 : INVD1BWP7T port map(I => n_101, ZN => n_100);
  g3400 : IND3D1BWP7T port map(A1 => n_80, B1 => n_94, B2 => n_90, ZN => n_103);
  g3401 : NR3D0BWP7T port map(A1 => n_91, A2 => n_94, A3 => n_80, ZN => n_102);
  g3402 : AOI211XD0BWP7T port map(A1 => n_85, A2 => n_72, B => n_92, C => n_87, ZN => n_101);
  g3403 : IND2D1BWP7T port map(A1 => n_80, B1 => n_91, ZN => n_99);
  g3404 : INVD0BWP7T port map(I => n_98, ZN => n_97);
  g3405 : INVD1BWP7T port map(I => n_96, ZN => n_95);
  g3406 : MAOI22D0BWP7T port map(A1 => n_85, A2 => n_56, B1 => n_85, B2 => n_56, ZN => n_98);
  g3407 : MOAI22D0BWP7T port map(A1 => n_85, A2 => n_61, B1 => n_85, B2 => n_61, ZN => n_96);
  g3408 : INVD0BWP7T port map(I => n_94, ZN => n_93);
  g3409 : NR2D1BWP7T port map(A1 => n_85, A2 => n_72, ZN => n_92);
  g3410 : MOAI22D0BWP7T port map(A1 => n_83, A2 => n_57, B1 => n_83, B2 => n_57, ZN => n_94);
  g3411 : INVD0BWP7T port map(I => n_91, ZN => n_90);
  g3412 : INVD0BWP7T port map(I => n_89, ZN => n_88);
  g3413 : MOAI22D0BWP7T port map(A1 => n_83, A2 => n_71, B1 => n_83, B2 => n_71, ZN => n_91);
  g3414 : MAOI22D0BWP7T port map(A1 => n_83, A2 => n_60, B1 => n_83, B2 => n_60, ZN => n_89);
  g3415 : NR2D1BWP7T port map(A1 => n_84, A2 => n_79, ZN => n_87);
  g3416 : IND3D1BWP7T port map(A1 => n_65, B1 => n_80, B2 => n_83, ZN => n_86);
  g3417 : OAI21D0BWP7T port map(A1 => n_79, A2 => n_72, B => n_84, ZN => n_85);
  g3418 : AOI221D0BWP7T port map(A1 => row_new_pacman(4), A2 => n_26, B1 => FE_DBTN1_vc_done_in, B2 => row_request(4), C => n_82, ZN => n_84);
  g3419 : AOI221D0BWP7T port map(A1 => col_new_ghost2(4), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => col_request(4), C => n_81, ZN => n_83);
  g3420 : MOAI22D0BWP7T port map(A1 => n_76, A2 => n_27, B1 => row_new_ghost2(4), B2 => n_16, ZN => n_82);
  g3421 : MOAI22D0BWP7T port map(A1 => n_77, A2 => n_27, B1 => col_new_pacman(4), B2 => n_26, ZN => n_81);
  g3422 : AO221D0BWP7T port map(A1 => col_new_pacman(3), A2 => n_26, B1 => FE_DBTN1_vc_done_in, B2 => col_request(3), C => n_73, Z => n_80);
  g3423 : INVD1BWP7T port map(I => n_79, ZN => n_78);
  g3424 : AOI221D1BWP7T port map(A1 => row_new_pacman(3), A2 => n_26, B1 => FE_DBTN1_vc_done_in, B2 => row_request(3), C => n_74, ZN => n_79);
  g3425 : INVD0BWP7T port map(I => n_77, ZN => n_145);
  g3426 : INVD0BWP7T port map(I => n_76, ZN => n_140);
  g3427 : AOI222D0BWP7T port map(A1 => n_68, A2 => n_39, B1 => n_164, B2 => n_36, C1 => col_old_ghost1(4), C2 => n_37, ZN => n_77);
  g3428 : AOI222D0BWP7T port map(A1 => n_68, A2 => n_12, B1 => n_164, B2 => n_32, C1 => row_old_ghost1(4), C2 => n_35, ZN => n_76);
  g3429 : MOAI22D0BWP7T port map(A1 => n_69, A2 => n_27, B1 => row_new_ghost2(3), B2 => n_16, ZN => n_74);
  g3430 : MOAI22D0BWP7T port map(A1 => n_70, A2 => n_27, B1 => col_new_ghost2(3), B2 => n_16, ZN => n_73);
  g3431 : MAOI22D0BWP7T port map(A1 => n_71, A2 => n_60, B1 => n_71, B2 => n_60, ZN => n_75);
  g3432 : AOI221D0BWP7T port map(A1 => row_new_ghost2(2), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => row_request(2), C => n_64, ZN => n_72);
  g3433 : AOI221D0BWP7T port map(A1 => col_new_ghost2(2), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => col_request(2), C => n_67, ZN => n_71);
  g3434 : INVD0BWP7T port map(I => n_70, ZN => n_144);
  g3435 : INVD0BWP7T port map(I => n_69, ZN => n_139);
  g3436 : AOI222D0BWP7T port map(A1 => n_55, A2 => n_36, B1 => col_old_ghost1(3), B2 => n_37, C1 => n_63, C2 => n_39, ZN => n_70);
  g3437 : AOI222D0BWP7T port map(A1 => n_55, A2 => n_32, B1 => n_63, B2 => n_12, C1 => row_old_ghost1(3), C2 => n_35, ZN => n_69);
  g3438 : MOAI22D0BWP7T port map(A1 => n_59, A2 => n_27, B1 => col_new_pacman(2), B2 => n_26, ZN => n_67);
  g3439 : MOAI22D0BWP7T port map(A1 => n_62, A2 => n_24, B1 => n_62, B2 => n_24, ZN => n_68);
  g3440 : MOAI22D0BWP7T port map(A1 => n_58, A2 => n_27, B1 => row_new_pacman(2), B2 => n_26, ZN => n_64);
  g3442 : MAOI22D0BWP7T port map(A1 => n_57, A2 => n_60, B1 => n_57, B2 => n_60, ZN => n_65);
  g3443 : HA1D0BWP7T port map(A => n_20, B => n_46, CO => n_62, S => n_63);
  g3444 : AOI221D0BWP7T port map(A1 => row_new_ghost2(1), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => row_request(1), C => n_53, ZN => n_61);
  g3445 : AO221D0BWP7T port map(A1 => col_new_ghost2(0), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => col_request(0), C => n_54, Z => n_60);
  g3446 : INVD0BWP7T port map(I => n_59, ZN => n_143);
  g3447 : INVD0BWP7T port map(I => n_58, ZN => n_138);
  g3448 : AOI222D0BWP7T port map(A1 => n_48, A2 => n_39, B1 => n_43, B2 => n_36, C1 => col_old_ghost1(2), C2 => n_37, ZN => n_59);
  g3449 : AOI222D0BWP7T port map(A1 => n_48, A2 => n_12, B1 => n_43, B2 => n_32, C1 => row_old_ghost1(2), C2 => n_35, ZN => n_58);
  g3450 : AOI221D0BWP7T port map(A1 => col_new_ghost2(1), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => col_request(1), C => n_52, ZN => n_57);
  g3451 : AOI221D0BWP7T port map(A1 => row_new_ghost2(0), A2 => n_16, B1 => FE_DBTN1_vc_done_in, B2 => row_request(0), C => n_49, ZN => n_56);
  g3452 : OAI21D0BWP7T port map(A1 => n_41, A2 => n_30, B => n_50, ZN => n_55);
  g3453 : MOAI22D0BWP7T port map(A1 => n_44, A2 => n_27, B1 => col_new_pacman(0), B2 => n_26, ZN => n_54);
  g3454 : MOAI22D0BWP7T port map(A1 => n_45, A2 => n_27, B1 => row_new_pacman(1), B2 => n_26, ZN => n_53);
  g3455 : MOAI22D0BWP7T port map(A1 => n_47, A2 => n_27, B1 => col_new_pacman(1), B2 => n_26, ZN => n_52);
  g3457 : ND2D1BWP7T port map(A1 => n_41, A2 => n_30, ZN => n_50);
  g3458 : MOAI22D0BWP7T port map(A1 => n_42, A2 => n_27, B1 => row_new_pacman(0), B2 => n_26, ZN => n_49);
  g3459 : INVD0BWP7T port map(I => n_47, ZN => n_142);
  g3460 : HA1D0BWP7T port map(A => n_19, B => n_38, CO => n_46, S => n_48);
  g3461 : AOI222D0BWP7T port map(A1 => n_39, A2 => n_40, B1 => n_34, B2 => n_36, C1 => col_old_ghost1(1), C2 => n_37, ZN => n_47);
  g3462 : INVD0BWP7T port map(I => n_45, ZN => n_137);
  g3463 : INVD0BWP7T port map(I => n_44, ZN => n_141);
  g3464 : AOI222D0BWP7T port map(A1 => n_34, A2 => n_32, B1 => n_12, B2 => n_40, C1 => row_old_ghost1(1), C2 => n_35, ZN => n_45);
  g3465 : AOI222D0BWP7T port map(A1 => n_36, A2 => n_28, B1 => n_39, B2 => n_23, C1 => col_old_ghost1(0), C2 => n_37, ZN => n_44);
  g3466 : AO21D0BWP7T port map(A1 => n_33, A2 => n_25, B => n_41, Z => n_43);
  g3467 : INVD0BWP7T port map(I => n_42, ZN => n_136);
  g3468 : AOI222D0BWP7T port map(A1 => n_12, A2 => n_23, B1 => n_32, B2 => n_28, C1 => row_old_ghost1(0), C2 => n_35, ZN => n_42);
  g3469 : NR2D1BWP7T port map(A1 => n_33, A2 => n_25, ZN => n_41);
  g3470 : HA1D0BWP7T port map(A => n_21, B => n_22, CO => n_38, S => n_40);
  g3471 : AN3D0BWP7T port map(A1 => n_18, A2 => n_14, A3 => L3a_move(0), Z => n_39);
  g3472 : OAI211D0BWP7T port map(A1 => n_13, A2 => n_14, B => n_17, C => n_18, ZN => n_37);
  g3473 : INR3D0BWP7T port map(A1 => n_18, B1 => L3a_move(0), B2 => n_14, ZN => n_36);
  g3474 : AO211D0BWP7T port map(A1 => L3a_move(3), A2 => L3a_move(1), B => n_18, C => n_17, Z => n_35);
  g3475 : OAI21D0BWP7T port map(A1 => n_28, A2 => n_31, B => n_33, ZN => n_34);
  g3476 : ND2D1BWP7T port map(A1 => n_28, A2 => n_31, ZN => n_33);
  g3477 : INR3D0BWP7T port map(A1 => L3a_move(1), B1 => L3a_move(3), B2 => n_17, ZN => n_32);
  g3479 : AOI22D0BWP7T port map(A1 => row_old_ghost1(1), A2 => n_14, B1 => col_old_ghost1(1), B2 => L3a_move(2), ZN => n_31);
  g3480 : AOI22D0BWP7T port map(A1 => row_old_ghost1(3), A2 => n_14, B1 => col_old_ghost1(3), B2 => L3a_move(2), ZN => n_30);
  g3481 : OAI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => L3a_move(2), B1 => col_old_ghost1(4), B2 => n_14, ZN => n_29);
  g3482 : AOI22D0BWP7T port map(A1 => row_old_ghost1(0), A2 => n_14, B1 => col_old_ghost1(0), B2 => L3a_move(2), ZN => n_28);
  g3483 : IND3D1BWP7T port map(A1 => pacman_map_select, B1 => ghost1_map_select, B2 => vc_done_in, ZN => n_27);
  g3484 : AN3D1BWP7T port map(A1 => pacman_map_select, A2 => vc_done_in, A3 => ghost1_map_select, Z => n_26);
  g3485 : INVD0BWP7T port map(I => n_23, ZN => n_22);
  g3486 : AO22D0BWP7T port map(A1 => row_old_ghost1(2), A2 => n_14, B1 => L3a_move(2), B2 => col_old_ghost1(2), Z => n_25);
  g3487 : AOI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => L3a_move(3), B1 => col_old_ghost1(4), B2 => L3a_move(0), ZN => n_24);
  g3488 : AO22D0BWP7T port map(A1 => row_old_ghost1(1), A2 => L3a_move(3), B1 => L3a_move(0), B2 => col_old_ghost1(1), Z => n_21);
  g3489 : AO22D0BWP7T port map(A1 => row_old_ghost1(3), A2 => L3a_move(3), B1 => L3a_move(0), B2 => col_old_ghost1(3), Z => n_20);
  g3490 : AO22D0BWP7T port map(A1 => row_old_ghost1(2), A2 => L3a_move(3), B1 => L3a_move(0), B2 => col_old_ghost1(2), Z => n_19);
  g3491 : AOI22D0BWP7T port map(A1 => row_old_ghost1(0), A2 => L3a_move(3), B1 => col_old_ghost1(0), B2 => L3a_move(0), ZN => n_23);
  g3492 : OR2D1BWP7T port map(A1 => zero_coins, A2 => FE_OFN0_game_over_out, Z => coin_register_reset);
  g3493 : NR2D0BWP7T port map(A1 => L3a_move(3), A2 => L3a_move(1), ZN => n_18);
  g3494 : ND2D0BWP7T port map(A1 => n_14, A2 => n_13, ZN => n_17);
  g3495 : NR2D1BWP7T port map(A1 => FE_DBTN1_vc_done_in, A2 => ghost1_map_select, ZN => n_16);
  g3497 : INVD1BWP7T port map(I => L3a_move(2), ZN => n_14);
  g3499 : CKND1BWP7T port map(I => L3a_move(0), ZN => n_13);
  g2 : INR3D0BWP7T port map(A1 => L3a_move(3), B1 => n_17, B2 => L3a_move(1), ZN => n_12);
  L3a_L4_column_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => n_7, Q => col_old_ghost1(0));
  L3a_L4_column_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => n_11, Q => col_old_ghost1(1));
  L3a_L4_row_number_out_reg_3 : DFQD1BWP7T port map(CP => CTS_12, D => n_8, Q => row_old_ghost1(3));
  L3a_L4_column_number_out_reg_3 : DFQD1BWP7T port map(CP => CTS_12, D => n_9, Q => col_old_ghost1(3));
  L3a_L4_row_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => n_10, Q => row_old_ghost1(0));
  L3a_L4_row_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => n_6, Q => row_old_ghost1(1));
  g1092 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN91_col_old_ghost1_1, B1 => n_0, B2 => n_142, C => FE_OFN0_game_over_out, Z => n_11);
  L3a_L4_column_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => n_4, Q => col_old_ghost1(2));
  L3a_L4_row_number_out_reg_4 : DFQD1BWP7T port map(CP => CTS_12, D => n_5, Q => row_old_ghost1(4));
  L3a_L4_row_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => n_2, Q => row_old_ghost1(2));
  L3a_L4_column_number_out_reg_4 : DFQD1BWP7T port map(CP => CTS_12, D => n_3, Q => col_old_ghost1(4));
  g1097 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN90_row_old_ghost1_0, B1 => n_0, B2 => n_136, C => FE_OFN0_game_over_out, Z => n_10);
  g1098 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN86_col_old_ghost1_3, B1 => n_0, B2 => n_144, C => FE_OFN0_game_over_out, Z => n_9);
  g1099 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN88_row_old_ghost1_3, B1 => n_0, B2 => n_139, C => FE_OFN0_game_over_out, Z => n_8);
  g1100 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN82_col_old_ghost1_0, B1 => n_0, B2 => n_141, C => FE_OFN0_game_over_out, Z => n_7);
  g1101 : AO221D0BWP7T port map(A1 => n_1, A2 => FE_PHN95_row_old_ghost1_1, B1 => n_0, B2 => n_137, C => FE_OFN0_game_over_out, Z => n_6);
  g1102 : AO22D0BWP7T port map(A1 => n_1, A2 => FE_PHN85_row_old_ghost1_4, B1 => n_140, B2 => n_0, Z => n_5);
  g1103 : AO22D0BWP7T port map(A1 => n_1, A2 => FE_PHN81_col_old_ghost1_2, B1 => n_143, B2 => n_0, Z => n_4);
  g1104 : AO22D0BWP7T port map(A1 => n_1, A2 => FE_PHN100_col_old_ghost1_4, B1 => n_145, B2 => n_0, Z => n_3);
  g1105 : AO22D0BWP7T port map(A1 => n_1, A2 => FE_PHN77_row_old_ghost1_2, B1 => n_138, B2 => n_0, Z => n_2);
  g1106 : NR2XD0BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => L3a_mux_select, ZN => n_1);
  g1107 : INR2D1BWP7T port map(A1 => L3a_mux_select, B1 => FE_OFN0_game_over_out, ZN => n_0);
  g3500 : CKXOR2D1BWP7T port map(A1 => n_50, A2 => n_29, Z => n_164);
  L3c_g1491 : OAI222D1BWP7T port map(A1 => L3c_n_58, A2 => L3c_n_45, B1 => L3c_n_41, B2 => L3c_n_59, C1 => L3c_n_43, C2 => L3c_n_15, ZN => row_new_pacman(4));
  L3c_g1492 : OAI222D0BWP7T port map(A1 => L3c_n_59, A2 => L3c_n_32, B1 => L3c_n_30, B2 => L3c_n_58, C1 => L3c_n_38, C2 => L3c_n_14, ZN => col_new_pacman(4));
  L3c_g1493 : OAI21D0BWP7T port map(A1 => L3c_n_54, A2 => L3c_n_32, B => L3c_n_60, ZN => col_new_pacman(3));
  L3c_g1494 : OAI222D0BWP7T port map(A1 => L3c_n_54, A2 => L3c_n_41, B1 => L3c_n_45, B2 => L3c_n_57, C1 => L3c_n_43, C2 => L3c_n_13, ZN => row_new_pacman(3));
  L3c_g1495 : MAOI22D0BWP7T port map(A1 => col_old_pacman(3), A2 => L3c_n_39, B1 => L3c_n_57, B2 => L3c_n_30, ZN => L3c_n_60);
  L3c_g1496 : MAOI22D0BWP7T port map(A1 => L3c_n_52, A2 => L3c_n_23, B1 => L3c_n_52, B2 => L3c_n_23, ZN => L3c_n_59);
  L3c_g1497 : MAOI22D0BWP7T port map(A1 => L3c_n_56, A2 => L3c_n_28, B1 => L3c_n_56, B2 => L3c_n_28, ZN => L3c_n_58);
  L3c_g1498 : HA1D0BWP7T port map(A => L3c_n_24, B => L3c_n_48, CO => L3c_n_56, S => L3c_n_57);
  L3c_g1499 : OAI21D0BWP7T port map(A1 => L3c_n_50, A2 => L3c_n_41, B => L3c_n_53, ZN => row_new_pacman(2));
  L3c_g1500 : OAI21D0BWP7T port map(A1 => L3c_n_50, A2 => L3c_n_32, B => L3c_n_55, ZN => col_new_pacman(2));
  L3c_g1501 : AOI22D0BWP7T port map(A1 => L3c_n_51, A2 => L3c_n_29, B1 => col_old_pacman(2), B2 => L3c_n_39, ZN => L3c_n_55);
  L3c_g1502 : AOI22D0BWP7T port map(A1 => L3c_n_51, A2 => L3c_n_44, B1 => row_old_pacman(2), B2 => L3c_n_42, ZN => L3c_n_53);
  L3c_g1503 : MAOI22D0BWP7T port map(A1 => L3c_n_47, A2 => L3c_n_22, B1 => L3c_n_47, B2 => L3c_n_22, ZN => L3c_n_54);
  L3c_g1504 : INR2XD0BWP7T port map(A1 => L3c_n_47, B1 => L3c_n_22, ZN => L3c_n_52);
  L3c_g1505 : OAI21D0BWP7T port map(A1 => L3c_n_36, A2 => L3c_n_32, B => L3c_n_49, ZN => col_new_pacman(1));
  L3c_g1506 : AO221D0BWP7T port map(A1 => L3c_n_37, A2 => L3c_n_44, B1 => row_old_pacman(1), B2 => L3c_n_42, C => L3c_n_46, Z => row_new_pacman(1));
  L3c_g1507 : AO222D0BWP7T port map(A1 => L3c_n_44, A2 => L3c_n_25, B1 => L3c_n_40, B2 => L3c_n_19, C1 => row_old_pacman(0), C2 => L3c_n_42, Z => row_new_pacman(0));
  L3c_g1508 : AO222D0BWP7T port map(A1 => L3c_n_31, A2 => L3c_n_19, B1 => L3c_n_29, B2 => L3c_n_25, C1 => col_old_pacman(0), C2 => L3c_n_39, Z => col_new_pacman(0));
  L3c_g1509 : AO21D0BWP7T port map(A1 => L3c_n_34, A2 => L3c_n_27, B => L3c_n_48, Z => L3c_n_51);
  L3c_g1510 : AOI22D0BWP7T port map(A1 => L3c_n_37, A2 => L3c_n_29, B1 => col_old_pacman(1), B2 => L3c_n_39, ZN => L3c_n_49);
  L3c_g1511 : MAOI22D0BWP7T port map(A1 => L3c_n_33, A2 => L3c_n_20, B1 => L3c_n_33, B2 => L3c_n_20, ZN => L3c_n_50);
  L3c_g1512 : NR2XD0BWP7T port map(A1 => L3c_n_34, A2 => L3c_n_27, ZN => L3c_n_48);
  L3c_g1513 : NR2D0BWP7T port map(A1 => L3c_n_36, A2 => L3c_n_41, ZN => L3c_n_46);
  L3c_g1514 : INR2XD0BWP7T port map(A1 => L3c_n_33, B1 => L3c_n_20, ZN => L3c_n_47);
  L3c_g1515 : INVD0BWP7T port map(I => L3c_n_45, ZN => L3c_n_44);
  L3c_g1516 : IND3D0BWP7T port map(A1 => L3c_move(3), B1 => L3c_move(1), B2 => L3c_n_18, ZN => L3c_n_45);
  L3c_g1517 : INVD0BWP7T port map(I => L3c_n_43, ZN => L3c_n_42);
  L3c_g1518 : CKND1BWP7T port map(I => L3c_n_41, ZN => L3c_n_40);
  L3c_g1519 : AOI211D0BWP7T port map(A1 => L3c_move(3), A2 => L3c_move(1), B => L3c_n_17, C => L3c_n_35, ZN => L3c_n_43);
  L3c_g1520 : IND3D0BWP7T port map(A1 => L3c_move(1), B1 => L3c_move(3), B2 => L3c_n_18, ZN => L3c_n_41);
  L3c_g1521 : CKND1BWP7T port map(I => L3c_n_39, ZN => L3c_n_38);
  L3c_g1522 : OAI211D0BWP7T port map(A1 => L3c_n_12, A2 => L3c_n_16, B => L3c_n_35, C => L3c_n_17, ZN => L3c_n_39);
  L3c_g1523 : OAI21D0BWP7T port map(A1 => L3c_n_25, A2 => L3c_n_26, B => L3c_n_34, ZN => L3c_n_37);
  L3c_g1524 : XNR2D1BWP7T port map(A1 => L3c_n_19, A2 => L3c_n_21, ZN => L3c_n_36);
  L3c_g1525 : CKND1BWP7T port map(I => L3c_n_18, ZN => L3c_n_35);
  L3c_g1526 : ND2D1BWP7T port map(A1 => L3c_n_25, A2 => L3c_n_26, ZN => L3c_n_34);
  L3c_g1527 : NR2XD0BWP7T port map(A1 => L3c_n_19, A2 => L3c_n_21, ZN => L3c_n_33);
  L3c_g1528 : CKND1BWP7T port map(I => L3c_n_32, ZN => L3c_n_31);
  L3c_g1529 : INVD0BWP7T port map(I => L3c_n_30, ZN => L3c_n_29);
  L3c_g1530 : ND3D0BWP7T port map(A1 => L3c_n_17, A2 => L3c_n_12, A3 => L3c_move(0), ZN => L3c_n_32);
  L3c_g1531 : ND3D0BWP7T port map(A1 => L3c_n_17, A2 => L3c_n_16, A3 => L3c_move(2), ZN => L3c_n_30);
  L3c_g1532 : AOI22D0BWP7T port map(A1 => row_old_pacman(3), A2 => L3c_n_12, B1 => col_old_pacman(3), B2 => L3c_move(2), ZN => L3c_n_24);
  L3c_g1533 : OAI22D0BWP7T port map(A1 => row_old_pacman(4), A2 => L3c_move(2), B1 => col_old_pacman(4), B2 => L3c_n_12, ZN => L3c_n_28);
  L3c_g1534 : AO22D0BWP7T port map(A1 => row_old_pacman(2), A2 => L3c_n_12, B1 => L3c_move(2), B2 => col_old_pacman(2), Z => L3c_n_27);
  L3c_g1535 : AOI22D0BWP7T port map(A1 => row_old_pacman(1), A2 => L3c_n_12, B1 => col_old_pacman(1), B2 => L3c_move(2), ZN => L3c_n_26);
  L3c_g1536 : AOI22D0BWP7T port map(A1 => row_old_pacman(0), A2 => L3c_n_12, B1 => col_old_pacman(0), B2 => L3c_move(2), ZN => L3c_n_25);
  L3c_g1537 : AOI22D0BWP7T port map(A1 => row_old_pacman(4), A2 => L3c_move(3), B1 => col_old_pacman(4), B2 => L3c_move(0), ZN => L3c_n_23);
  L3c_g1538 : AOI22D0BWP7T port map(A1 => row_old_pacman(3), A2 => L3c_move(3), B1 => col_old_pacman(3), B2 => L3c_move(0), ZN => L3c_n_22);
  L3c_g1539 : AOI22D0BWP7T port map(A1 => row_old_pacman(1), A2 => L3c_move(3), B1 => col_old_pacman(1), B2 => L3c_move(0), ZN => L3c_n_21);
  L3c_g1540 : AOI22D0BWP7T port map(A1 => row_old_pacman(2), A2 => L3c_move(3), B1 => col_old_pacman(2), B2 => L3c_move(0), ZN => L3c_n_20);
  L3c_g1541 : AOI22D0BWP7T port map(A1 => row_old_pacman(0), A2 => L3c_move(3), B1 => col_old_pacman(0), B2 => L3c_move(0), ZN => L3c_n_19);
  L3c_g1542 : NR2D0BWP7T port map(A1 => L3c_move(2), A2 => L3c_move(0), ZN => L3c_n_18);
  L3c_g1543 : NR2D0BWP7T port map(A1 => L3c_move(3), A2 => L3c_move(1), ZN => L3c_n_17);
  L3c_g1544 : CKND1BWP7T port map(I => L3c_move(0), ZN => L3c_n_16);
  L3c_g1548 : INVD1BWP7T port map(I => L3c_move(2), ZN => L3c_n_12);
  L3c_CR1_column_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_8, Q => col_old_pacman(0));
  L3c_CR1_column_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_10, Q => col_old_pacman(1));
  L3c_CR1_column_number_out_reg_3 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_11, Q => col_old_pacman(3));
  L3c_CR1_row_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_7, Q => row_old_pacman(1));
  L3c_CR1_row_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_4, Q => row_old_pacman(0));
  L3c_CR1_column_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_6, Q => col_old_pacman(2));
  L3c_CR1_row_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_n_3, Q => row_old_pacman(2));
  L3c_g493 : AO221D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN67_col_old_pacman_3, B1 => L3c_n_0, B2 => col_new_pacman(3), C => score_reset_out, Z => L3c_n_11);
  L3c_g494 : AO221D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN87_col_old_pacman_1, B1 => L3c_n_0, B2 => col_new_pacman(1), C => FE_OFN0_game_over_out, Z => L3c_n_10);
  L3c_g495 : AO221D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN52_row_old_pacman_4, B1 => L3c_n_0, B2 => row_new_pacman(4), C => score_reset_out, Z => L3c_n_9);
  L3c_g496 : AO221D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN76_col_old_pacman_0, B1 => L3c_n_0, B2 => col_new_pacman(0), C => FE_OFN0_game_over_out, Z => L3c_n_8);
  L3c_g497 : AO221D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN71_row_old_pacman_1, B1 => L3c_n_0, B2 => row_new_pacman(1), C => score_reset_out, Z => L3c_n_7);
  L3c_g498 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN68_col_old_pacman_2, B1 => col_new_pacman(2), B2 => L3c_n_0, Z => L3c_n_6);
  L3c_g499 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN66_col_old_pacman_4, B1 => col_new_pacman(4), B2 => L3c_n_0, Z => L3c_n_5);
  L3c_g500 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN64_row_old_pacman_0, B1 => row_new_pacman(0), B2 => L3c_n_0, Z => L3c_n_4);
  L3c_g501 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN69_row_old_pacman_2, B1 => row_new_pacman(2), B2 => L3c_n_0, Z => L3c_n_3);
  L3c_g502 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => FE_PHN50_row_old_pacman_3, B1 => row_new_pacman(3), B2 => L3c_n_0, Z => L3c_n_2);
  L3c_g503 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => write_coin, ZN => L3c_n_1);
  L3c_g504 : INR2D1BWP7T port map(A1 => write_coin, B1 => score_reset_out, ZN => L3c_n_0);
  L3c_CR1_row_number_out_reg_4 : DFD1BWP7T port map(CP => CTS_12, D => L3c_n_9, Q => row_old_pacman(4), QN => L3c_n_15);
  L3c_CR1_column_number_out_reg_4 : DFD1BWP7T port map(CP => CTS_12, D => L3c_n_5, Q => col_old_pacman(4), QN => L3c_n_14);
  L3c_CR1_row_number_out_reg_3 : DFD1BWP7T port map(CP => CTS_12, D => L3c_n_2, Q => row_old_pacman(3), QN => L3c_n_13);
  L3c_PC1_g182 : OR2D1BWP7T port map(A1 => write_coin, A2 => L3c_PC1_state(1), Z => pacman_ready);
  L3c_PC1_g183 : INR2XD0BWP7T port map(A1 => FE_PHN111_L3c_PC1_state_0, B1 => L3c_PC1_state(1), ZN => pacman_map_select);
  L3c_PC1_state_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => L3c_PC1_n_5, Q => L3c_PC1_state(0));
  L3c_PC1_state_reg_1 : DFQD1BWP7T port map(CP => CTS_11, D => L3c_PC1_n_4, Q => L3c_PC1_state(1));
  L3c_PC1_g255 : OAI21D0BWP7T port map(A1 => L3c_PC1_n_1, A2 => FE_PHN111_L3c_PC1_state_0, B => L3c_PC1_n_3, ZN => FE_PHN112_L3c_PC1_n_5);
  L3c_PC1_state_reg_2 : DFKCNQD1BWP7T port map(CN => FE_PHN111_L3c_PC1_state_0, CP => CTS_12, D => L3c_PC1_n_2, Q => write_coin);
  L3c_PC1_g257 : INVD0BWP7T port map(I => L3c_PC1_n_3, ZN => L3c_PC1_n_4);
  L3c_PC1_g258 : ND3D0BWP7T port map(A1 => pos_is_wall, A2 => L3c_PC1_n_0, A3 => FE_PHN111_L3c_PC1_state_0, ZN => L3c_PC1_n_3);
  L3c_PC1_g259 : INR2D1BWP7T port map(A1 => L3c_PC1_n_0, B1 => pos_is_wall, ZN => L3c_PC1_n_2);
  L3c_PC1_g260 : IND3D0BWP7T port map(A1 => write_coin, B1 => pacman_start, B2 => L3c_PC1_n_0, ZN => L3c_PC1_n_1);
  L3c_PC1_g261 : NR2XD0BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => FE_PHN73_L3c_PC1_state_1, ZN => L3c_PC1_n_0);
  L0_g1399 : OR2D1BWP7T port map(A1 => L0_n_51, A2 => wall_present, Z => FE_OFN3_cell_type_2);
  L0_g1400 : OR2D1BWP7T port map(A1 => L0_n_51, A2 => L0_n_50, Z => FE_OFN1_cell_type_0);
  L0_g1401 : INR4D0BWP7T port map(A1 => coin_present, B1 => wall_present, B2 => L0_n_43, B3 => L0_n_46, ZN => L0_n_51);
  L0_g1402 : NR2XD0BWP7T port map(A1 => L0_n_47, A2 => wall_present, ZN => L0_n_50);
  L0_g1403 : OR2D1BWP7T port map(A1 => L0_n_48, A2 => wall_present, Z => FE_OFN2_cell_type_1);
  L0_g1404 : INR2XD0BWP7T port map(A1 => L0_n_46, B1 => L0_n_43, ZN => L0_n_48);
  L0_g1405 : AOI21D0BWP7T port map(A1 => L0_n_44, A2 => L0_n_45, B => L0_n_43, ZN => L0_n_47);
  L0_g1406 : IND2D1BWP7T port map(A1 => L0_n_44, B1 => L0_n_45, ZN => L0_n_46);
  L0_g1407 : ND4D0BWP7T port map(A1 => L0_n_39, A2 => L0_n_40, A3 => L0_n_34, A4 => L0_n_19, ZN => L0_n_45);
  L0_g1408 : NR4D0BWP7T port map(A1 => L0_n_38, A2 => L0_n_42, A3 => L0_n_36, A4 => L0_n_30, ZN => L0_n_44);
  L0_g1409 : NR4D0BWP7T port map(A1 => L0_n_37, A2 => L0_n_41, A3 => L0_n_35, A4 => L0_n_8, ZN => L0_n_43);
  L0_g1410 : ND3D0BWP7T port map(A1 => L0_n_33, A2 => L0_n_25, A3 => L0_n_23, ZN => L0_n_42);
  L0_g1411 : ND3D0BWP7T port map(A1 => L0_n_17, A2 => L0_n_14, A3 => L0_n_10, ZN => L0_n_41);
  L0_g1412 : NR3D0BWP7T port map(A1 => L0_n_12, A2 => L0_n_13, A3 => L0_n_15, ZN => L0_n_40);
  L0_g1413 : NR4D0BWP7T port map(A1 => L0_n_24, A2 => L0_n_21, A3 => L0_n_27, A4 => L0_n_29, ZN => L0_n_39);
  L0_g1414 : ND4D0BWP7T port map(A1 => L0_n_9, A2 => L0_n_20, A3 => L0_n_32, A4 => L0_n_31, ZN => L0_n_38);
  L0_g1415 : ND4D0BWP7T port map(A1 => L0_n_26, A2 => L0_n_11, A3 => L0_n_22, A4 => L0_n_16, ZN => L0_n_37);
  L0_g1416 : OAI211D1BWP7T port map(A1 => L0_n_3, A2 => col_old_ghost2(4), B => L0_n_28, C => L0_n_6, ZN => L0_n_36);
  L0_g1417 : OAI211D1BWP7T port map(A1 => L0_n_2, A2 => col_old_pacman(1), B => L0_n_7, C => L0_n_5, ZN => L0_n_35);
  L0_g1418 : AOI211XD0BWP7T port map(A1 => col_old_ghost1(0), A2 => L0_n_1, B => L0_n_18, C => L0_n_4, ZN => L0_n_34);
  L0_g1419 : XNR2D1BWP7T port map(A1 => col_old_ghost2(3), A2 => col_request(3), ZN => L0_n_33);
  L0_g1420 : XNR2D1BWP7T port map(A1 => row_old_ghost2(0), A2 => row_request(0), ZN => L0_n_32);
  L0_g1421 : XNR2D1BWP7T port map(A1 => col_old_ghost2(2), A2 => col_request(2), ZN => L0_n_31);
  L0_g1422 : MOAI22D0BWP7T port map(A1 => col_old_ghost2(1), A2 => L0_n_2, B1 => col_old_ghost2(1), B2 => L0_n_2, ZN => L0_n_30);
  L0_g1423 : CKXOR2D1BWP7T port map(A1 => row_old_ghost1(2), A2 => row_request(2), Z => L0_n_29);
  L0_g1424 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(0), A2 => L0_n_1, B1 => col_old_ghost2(0), B2 => L0_n_1, ZN => L0_n_28);
  L0_g1425 : CKXOR2D1BWP7T port map(A1 => row_old_ghost1(1), A2 => row_request(1), Z => L0_n_27);
  L0_g1426 : XNR2D1BWP7T port map(A1 => row_old_pacman(1), A2 => row_request(1), ZN => L0_n_26);
  L0_g1427 : XNR2D1BWP7T port map(A1 => row_old_ghost2(4), A2 => row_request(4), ZN => L0_n_25);
  L0_g1428 : MOAI22D0BWP7T port map(A1 => col_old_ghost1(4), A2 => L0_n_3, B1 => col_old_ghost1(4), B2 => L0_n_3, ZN => L0_n_24);
  L0_g1429 : XNR2D1BWP7T port map(A1 => row_old_ghost2(3), A2 => row_request(3), ZN => L0_n_23);
  L0_g1430 : MAOI22D0BWP7T port map(A1 => col_old_pacman(4), A2 => L0_n_3, B1 => col_old_pacman(4), B2 => L0_n_3, ZN => L0_n_22);
  L0_g1431 : CKXOR2D1BWP7T port map(A1 => row_old_ghost1(0), A2 => row_request(0), Z => L0_n_21);
  L0_g1432 : XNR2D1BWP7T port map(A1 => row_old_ghost2(1), A2 => row_request(1), ZN => L0_n_20);
  L0_g1433 : XNR2D1BWP7T port map(A1 => col_old_ghost1(3), A2 => col_request(3), ZN => L0_n_19);
  L0_g1434 : CKXOR2D1BWP7T port map(A1 => col_old_ghost1(2), A2 => col_request(2), Z => L0_n_18);
  L0_g1435 : XNR2D1BWP7T port map(A1 => row_old_pacman(4), A2 => row_request(4), ZN => L0_n_17);
  L0_g1436 : XNR2D1BWP7T port map(A1 => col_old_pacman(3), A2 => col_request(3), ZN => L0_n_16);
  L0_g1437 : MOAI22D0BWP7T port map(A1 => col_old_ghost1(1), A2 => L0_n_2, B1 => col_old_ghost1(1), B2 => L0_n_2, ZN => L0_n_15);
  L0_g1438 : XNR2D1BWP7T port map(A1 => row_old_pacman(3), A2 => row_request(3), ZN => L0_n_14);
  L0_g1439 : CKXOR2D1BWP7T port map(A1 => row_old_ghost1(4), A2 => row_request(4), Z => L0_n_13);
  L0_g1440 : CKXOR2D1BWP7T port map(A1 => row_old_ghost1(3), A2 => row_request(3), Z => L0_n_12);
  L0_g1441 : XNR2D1BWP7T port map(A1 => row_old_pacman(0), A2 => row_request(0), ZN => L0_n_11);
  L0_g1442 : XNR2D1BWP7T port map(A1 => col_old_pacman(2), A2 => col_request(2), ZN => L0_n_10);
  L0_g1443 : XNR2D1BWP7T port map(A1 => row_old_ghost2(2), A2 => row_request(2), ZN => L0_n_9);
  L0_g1444 : CKXOR2D1BWP7T port map(A1 => row_old_pacman(2), A2 => row_request(2), Z => L0_n_8);
  L0_g1445 : MAOI22D0BWP7T port map(A1 => col_old_pacman(0), A2 => L0_n_1, B1 => col_old_pacman(0), B2 => L0_n_1, ZN => L0_n_7);
  L0_g1446 : ND2D1BWP7T port map(A1 => col_old_ghost2(4), A2 => L0_n_3, ZN => L0_n_6);
  L0_g1447 : ND2D1BWP7T port map(A1 => col_old_pacman(1), A2 => L0_n_2, ZN => L0_n_5);
  L0_g1448 : NR2XD0BWP7T port map(A1 => col_old_ghost1(0), A2 => L0_n_1, ZN => L0_n_4);
  L0_g1449 : INVD1BWP7T port map(I => col_request(4), ZN => L0_n_3);
  L0_g1450 : INVD1BWP7T port map(I => col_request(1), ZN => L0_n_2);
  L0_g1451 : INVD1BWP7T port map(I => col_request(0), ZN => L0_n_1);
  L2_g2 : OR2D1BWP7T port map(A1 => L2_c_g2, A2 => L2_c_g1, Z => FE_OFN0_game_over_out);
  L2_IB1_g349 : NR4D0BWP7T port map(A1 => L2_IB1_n_12, A2 => L2_IB1_n_2, A3 => L2_IB1_n_7, A4 => L2_IB1_n_11, ZN => L2_c_g1);
  L2_IB1_g350 : ND4D0BWP7T port map(A1 => L2_IB1_n_3, A2 => L2_IB1_n_1, A3 => L2_IB1_n_10, A4 => L2_IB1_n_5, ZN => L2_IB1_n_12);
  L2_IB1_g351 : ND3D0BWP7T port map(A1 => L2_IB1_n_6, A2 => L2_IB1_n_4, A3 => L2_IB1_n_0, ZN => L2_IB1_n_11);
  L2_IB1_g352 : NR2XD0BWP7T port map(A1 => L2_IB1_n_8, A2 => L2_IB1_n_9, ZN => L2_IB1_n_10);
  L2_IB1_g353 : CKXOR2D0BWP7T port map(A1 => row_new_pacman(1), A2 => row_old_ghost1(1), Z => L2_IB1_n_9);
  L2_IB1_g354 : CKXOR2D0BWP7T port map(A1 => row_new_pacman(2), A2 => row_old_ghost1(2), Z => L2_IB1_n_8);
  L2_IB1_g355 : MAOI22D0BWP7T port map(A1 => row_old_ghost1(3), A2 => row_new_pacman(3), B1 => row_old_ghost1(3), B2 => row_new_pacman(3), ZN => L2_IB1_n_7);
  L2_IB1_g356 : XNR2D1BWP7T port map(A1 => col_old_ghost1(2), A2 => col_new_pacman(2), ZN => L2_IB1_n_6);
  L2_IB1_g357 : XNR2D1BWP7T port map(A1 => row_old_ghost1(0), A2 => row_new_pacman(0), ZN => L2_IB1_n_5);
  L2_IB1_g358 : XNR2D1BWP7T port map(A1 => col_old_ghost1(1), A2 => col_new_pacman(1), ZN => L2_IB1_n_4);
  L2_IB1_g359 : XNR2D1BWP7T port map(A1 => col_old_ghost1(4), A2 => col_new_pacman(4), ZN => L2_IB1_n_3);
  L2_IB1_g360 : MAOI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => row_new_pacman(4), B1 => row_old_ghost1(4), B2 => row_new_pacman(4), ZN => L2_IB1_n_2);
  L2_IB1_g361 : XNR2D1BWP7T port map(A1 => col_old_ghost1(3), A2 => col_new_pacman(3), ZN => L2_IB1_n_1);
  L2_IB1_g362 : XNR2D1BWP7T port map(A1 => col_old_ghost1(0), A2 => col_new_pacman(0), ZN => L2_IB1_n_0);
  L2_IB2_g349 : NR4D0BWP7T port map(A1 => L2_IB2_n_12, A2 => L2_IB2_n_2, A3 => L2_IB2_n_7, A4 => L2_IB2_n_11, ZN => L2_c_g2);
  L2_IB2_g350 : ND4D0BWP7T port map(A1 => L2_IB2_n_3, A2 => L2_IB2_n_1, A3 => L2_IB2_n_10, A4 => L2_IB2_n_5, ZN => L2_IB2_n_12);
  L2_IB2_g351 : ND3D0BWP7T port map(A1 => L2_IB2_n_6, A2 => L2_IB2_n_4, A3 => L2_IB2_n_0, ZN => L2_IB2_n_11);
  L2_IB2_g352 : NR2XD0BWP7T port map(A1 => L2_IB2_n_8, A2 => L2_IB2_n_9, ZN => L2_IB2_n_10);
  L2_IB2_g353 : CKXOR2D0BWP7T port map(A1 => row_new_pacman(1), A2 => row_old_ghost2(1), Z => L2_IB2_n_9);
  L2_IB2_g354 : CKXOR2D0BWP7T port map(A1 => row_new_pacman(2), A2 => row_old_ghost2(2), Z => L2_IB2_n_8);
  L2_IB2_g355 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => row_new_pacman(3), B1 => row_old_ghost2(3), B2 => row_new_pacman(3), ZN => L2_IB2_n_7);
  L2_IB2_g356 : XNR2D1BWP7T port map(A1 => col_old_ghost2(2), A2 => col_new_pacman(2), ZN => L2_IB2_n_6);
  L2_IB2_g357 : XNR2D1BWP7T port map(A1 => row_old_ghost2(0), A2 => row_new_pacman(0), ZN => L2_IB2_n_5);
  L2_IB2_g358 : XNR2D1BWP7T port map(A1 => col_old_ghost2(1), A2 => col_new_pacman(1), ZN => L2_IB2_n_4);
  L2_IB2_g359 : XNR2D1BWP7T port map(A1 => col_old_ghost2(4), A2 => col_new_pacman(4), ZN => L2_IB2_n_3);
  L2_IB2_g360 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => row_new_pacman(4), B1 => row_old_ghost2(4), B2 => row_new_pacman(4), ZN => L2_IB2_n_2);
  L2_IB2_g361 : XNR2D1BWP7T port map(A1 => col_old_ghost2(3), A2 => col_new_pacman(3), ZN => L2_IB2_n_1);
  L2_IB2_g362 : XNR2D1BWP7T port map(A1 => col_old_ghost2(0), A2 => col_new_pacman(0), ZN => L2_IB2_n_0);
  L6a_cdn_loop_breaker : BUFFD1BWP7T port map(I => L6a_count_intern(6), Z => L6a_n_6);
  L6a_cdn_loop_breaker7 : BUFFD1BWP7T port map(I => L6a_count_intern(1), Z => L6a_n_5);
  L6a_cdn_loop_breaker8 : BUFFD1BWP7T port map(I => L6a_count_intern(0), Z => L6a_n_4);
  L6a_cdn_loop_breaker9 : BUFFD1BWP7T port map(I => L6a_count_intern(3), Z => L6a_n_3);
  L6a_cdn_loop_breaker10 : BUFFD1BWP7T port map(I => L6a_count_intern(2), Z => L6a_n_2);
  L6a_cdn_loop_breaker11 : BUFFD1BWP7T port map(I => L6a_count_intern(5), Z => L6a_n_1);
  L6a_cdn_loop_breaker12 : BUFFD1BWP7T port map(I => L6a_count_intern(4), Z => L6a_n_0);
  L6a_LBL1_g1597 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_70, A2 => L6a_LBL1_state(0), B => L6a_LBL1_n_69, ZN => pacman_start);
  L6a_LBL1_g1598 : OAI221D0BWP7T port map(A1 => L6a_LBL1_n_71, A2 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(2), B2 => L6a_LBL1_n_76, C => L6a_LBL1_n_68, ZN => L6a_c_rst_int);
  L6a_LBL1_g1599 : MAOI22D0BWP7T port map(A1 => L6a_LBL1_n_67, A2 => L6a_LBL1_state(1), B1 => L6a_LBL1_n_71, B2 => L6a_LBL1_n_76, ZN => L6a_LBL1_n_69);
  L6a_LBL1_g1600 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_66, A2 => L6a_LBL1_n_65, B => L6a_LBL1_state(2), ZN => ghost1_start);
  L6a_LBL1_g1601 : NR4D0BWP7T port map(A1 => L6a_LBL1_n_3, A2 => L6a_LBL1_state(0), A3 => L6a_LBL1_state(3), A4 => L6a_LBL1_state(1), ZN => ghost2_start);
  L6a_LBL1_g1602 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_66, A2 => L6a_LBL1_n_3, Z => L6a_LBL1_n_70);
  L6a_LBL1_g1603 : CKND1BWP7T port map(I => L6a_LBL1_n_67, ZN => L6a_LBL1_n_68);
  L6a_LBL1_g1604 : INR2XD0BWP7T port map(A1 => L6a_LBL1_n_77, B1 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_67);
  L6a_LBL1_g1605 : ND2D0BWP7T port map(A1 => L6a_LBL1_state(0), A2 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_65);
  L6a_LBL1_g1606 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(1), B1 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_66);
  L6a_LBL1_g1607 : INR2D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => L6a_LBL1_n_3, ZN => L6a_LBL1_n_77);
  L6a_LBL1_g1608 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(3), B1 => L6a_LBL1_n_3, ZN => L6a_LBL1_n_71);
  L6a_LBL1_g1609 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_76);
  L6a_LBL1_state_reg_0 : DFQD1BWP7T port map(CP => CTS_11, D => L6a_LBL1_n_61, Q => FE_PHN109_L6a_LBL1_state_0);
  L6a_LBL1_g3254 : AO211D0BWP7T port map(A1 => L6a_LBL1_n_9, A2 => L6a_LBL1_n_90, B => L6a_LBL1_n_42, C => reset, Z => L6a_LBL1_n_63);
  L6a_LBL1_g3255 : AO221D0BWP7T port map(A1 => L6a_LBL1_n_24, A2 => L6a_LBL1_n_59, B1 => L6a_LBL1_n_26, B2 => L6a_LBL1_n_28, C => L6a_LBL1_n_56, Z => L6a_LBL1_n_62);
  L6a_LBL1_g3256 : AO221D0BWP7T port map(A1 => L6a_LBL1_n_8, A2 => L6a_LBL1_n_55, B1 => L6a_LBL1_n_9, B2 => L6a_LBL1_n_52, C => reset, Z => L6a_LBL1_n_61);
  L6a_LBL1_g3257 : OAI31D0BWP7T port map(A1 => reset, A2 => FE_PHN114_L6a_LBL1_n_21, A3 => coin_register_reset, B => L6a_LBL1_n_58, ZN => L6a_LBL1_n_60);
  L6a_LBL1_g3258 : OAI31D0BWP7T port map(A1 => L6a_LBL1_n_50, A2 => L6a_LBL1_state(3), A3 => L6a_LBL1_n_6, B => L6a_LBL1_n_27, ZN => L6a_LBL1_n_59);
  L6a_LBL1_g3259 : AOI22D0BWP7T port map(A1 => L6a_LBL1_n_26, A2 => L6a_LBL1_n_53, B1 => L6a_LBL1_n_24, B2 => L6a_LBL1_n_91, ZN => L6a_LBL1_n_58);
  L6a_LBL1_g3261 : MOAI22D0BWP7T port map(A1 => L6a_LBL1_n_47, A2 => L6a_LBL1_n_7, B1 => L6a_LBL1_n_26, B2 => L6a_LBL1_n_51, ZN => L6a_LBL1_n_56);
  L6a_LBL1_g3262 : AO221D0BWP7T port map(A1 => L6a_LBL1_n_18, A2 => L6a_LBL1_n_43, B1 => L6a_LBL1_n_19, B2 => L6a_LBL1_state(1), C => L6a_LBL1_n_51, Z => L6a_LBL1_n_55);
  L6a_LBL1_g3264 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_70, A2 => L6a_LBL1_n_13, B => L6a_LBL1_n_49, ZN => L6a_LBL1_n_53);
  L6a_LBL1_g3265 : MOAI22D0BWP7T port map(A1 => L6a_LBL1_n_3, A2 => L6a_LBL1_n_46, B1 => L6a_LBL1_n_19, B2 => L6a_LBL1_n_3, ZN => L6a_LBL1_n_52);
  L6a_LBL1_g3266 : AOI31D0BWP7T port map(A1 => L6a_LBL1_n_40, A2 => pacman_ready, A3 => L6a_LBL1_n_10, B => L6a_LBL1_n_7, ZN => L6a_LBL1_n_51);
  L6a_LBL1_g3267 : IAO21D0BWP7T port map(A1 => L6a_LBL1_n_38, A2 => ghost1_ready, B => L6a_LBL1_n_48, ZN => L6a_LBL1_n_50);
  L6a_LBL1_g3268 : AOI22D0BWP7T port map(A1 => L6a_LBL1_n_18, A2 => L6a_LBL1_n_45, B1 => L6a_LBL1_n_32, B2 => L6a_LBL1_n_7, ZN => L6a_LBL1_n_49);
  L6a_LBL1_g3269 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_45, B1 => L6a_LBL1_n_13, ZN => L6a_LBL1_n_48);
  L6a_LBL1_g3270 : OAI21D0BWP7T port map(A1 => pacman_ready, A2 => L6a_LBL1_n_41, B => L6a_LBL1_n_24, ZN => L6a_LBL1_n_47);
  L6a_LBL1_g3271 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_2, A2 => L6a_LBL1_n_39, B => L6a_LBL1_n_4, ZN => L6a_LBL1_n_46);
  L6a_LBL1_g3272 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_38, A2 => L6a_LBL1_n_0, B => ghost1_ready, ZN => L6a_LBL1_n_44);
  L6a_LBL1_g3273 : IAO21D0BWP7T port map(A1 => L6a_LBL1_n_37, A2 => pacman_ready, B => ghost1_ready, ZN => L6a_LBL1_n_45);
  L6a_LBL1_g3274 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_37, A2 => ghost1_ready, B => L6a_LBL1_n_0, ZN => L6a_LBL1_n_43);
  L6a_LBL1_g3275 : OA21D0BWP7T port map(A1 => L6a_LBL1_n_5, A2 => L6a_LBL1_n_92, B => L6a_LBL1_n_8, Z => L6a_LBL1_n_42);
  L6a_LBL1_g3276 : OAI21D0BWP7T port map(A1 => L6a_count_intern(6), A2 => L6a_LBL1_n_35, B => L6a_LBL1_n_10, ZN => L6a_LBL1_n_41);
  L6a_LBL1_g3277 : OA21D0BWP7T port map(A1 => L6a_LBL1_n_34, A2 => L6a_LBL1_n_33, B => L6a_LBL1_n_30, Z => L6a_LBL1_n_40);
  L6a_LBL1_g3278 : OAI31D0BWP7T port map(A1 => pacman_ready, A2 => L6a_LBL1_n_25, A3 => L6a_LBL1_n_30, B => L6a_LBL1_n_13, ZN => L6a_LBL1_n_39);
  L6a_LBL1_g3279 : AO211D0BWP7T port map(A1 => L6a_count_intern(6), A2 => L6a_LBL1_n_22, B => L6a_LBL1_n_29, C => L6a_LBL1_n_25, Z => L6a_LBL1_n_38);
  L6a_LBL1_g3281 : NR3D0BWP7T port map(A1 => L6a_count_intern(6), A2 => L6a_LBL1_n_31, A3 => L6a_LBL1_n_16, ZN => L6a_LBL1_n_37);
  L6a_LBL1_g3282 : INR2XD0BWP7T port map(A1 => L6a_LBL1_n_16, B1 => L6a_LBL1_n_31, ZN => L6a_LBL1_n_35);
  L6a_LBL1_g3283 : OA21D0BWP7T port map(A1 => L6a_LBL1_n_20, A2 => L6a_LBL1_n_14, B => L6a_LBL1_n_25, Z => L6a_LBL1_n_34);
  L6a_LBL1_g3284 : CKAN2D1BWP7T port map(A1 => L6a_LBL1_n_20, A2 => L6a_LBL1_n_22, Z => L6a_LBL1_n_33);
  L6a_LBL1_g3286 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_14, A2 => L6a_LBL1_n_1, B => L6a_count_intern(6), ZN => L6a_LBL1_n_29);
  L6a_LBL1_g3287 : ND3D0BWP7T port map(A1 => L6a_LBL1_n_14, A2 => L6a_count_intern(4), A3 => L6a_count_intern(2), ZN => L6a_LBL1_n_31);
  L6a_LBL1_g3288 : ND3D0BWP7T port map(A1 => L6a_count_intern(6), A2 => L6a_LBL1_n_14, A3 => L6a_count_intern(4), ZN => L6a_LBL1_n_30);
  L6a_LBL1_g3289 : INVD1BWP7T port map(I => L6a_LBL1_n_27, ZN => L6a_LBL1_n_28);
  L6a_LBL1_g3290 : ND2D0BWP7T port map(A1 => L6a_LBL1_state(3), A2 => L6a_LBL1_n_12, ZN => L6a_LBL1_n_23);
  L6a_LBL1_g3291 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_15, A2 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_27);
  L6a_LBL1_g3292 : INR2D1BWP7T port map(A1 => L6a_LBL1_n_8, B1 => reset, ZN => L6a_LBL1_n_26);
  L6a_LBL1_g3293 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_16, A2 => L6a_count_intern(2), Z => L6a_LBL1_n_25);
  L6a_LBL1_g3294 : INR2D1BWP7T port map(A1 => L6a_LBL1_n_9, B1 => reset, ZN => L6a_LBL1_n_24);
  L6a_LBL1_g3296 : OR3XD1BWP7T port map(A1 => L6a_count_intern(3), A2 => L6a_count_intern(5), A3 => L6a_LBL1_n_1, Z => L6a_LBL1_n_22);
  L6a_LBL1_g3297 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_7, A2 => L6a_LBL1_n_4, Z => L6a_LBL1_n_21);
  L6a_LBL1_g3298 : AO21D0BWP7T port map(A1 => L6a_count_intern(4), A2 => L6a_count_intern(5), B => L6a_count_intern(6), Z => L6a_LBL1_n_20);
  L6a_LBL1_g3299 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_76, A2 => L6a_LBL1_state(3), B => L6a_LBL1_n_77, ZN => L6a_LBL1_n_19);
  L6a_LBL1_g3300 : NR3D0BWP7T port map(A1 => L6a_LBL1_state(1), A2 => L6a_LBL1_state(2), A3 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_18);
  L6a_LBL1_g3301 : INVD0BWP7T port map(I => L6a_LBL1_n_13, ZN => L6a_LBL1_n_12);
  L6a_LBL1_g3303 : OR2D1BWP7T port map(A1 => L6a_count_intern(0), A2 => L6a_count_intern(1), Z => L6a_LBL1_n_16);
  L6a_LBL1_g3304 : NR2D1BWP7T port map(A1 => L6a_LBL1_n_2, A2 => L6a_LBL1_state(2), ZN => L6a_LBL1_n_15);
  L6a_LBL1_g3305 : CKAN2D1BWP7T port map(A1 => L6a_count_intern(5), A2 => L6a_count_intern(3), Z => L6a_LBL1_n_14);
  L6a_LBL1_g3306 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_0, A2 => ghost1_ready, ZN => L6a_LBL1_n_13);
  L6a_LBL1_g3307 : INVD1BWP7T port map(I => L6a_LBL1_n_5, ZN => L6a_LBL1_n_6);
  L6a_LBL1_g3308 : NR2XD0BWP7T port map(A1 => L6a_LBL1_n_4, A2 => ghost1_ready, ZN => L6a_LBL1_n_10);
  L6a_LBL1_g3309 : NR2D1BWP7T port map(A1 => coin_register_reset, A2 => L6a_LBL1_state(0), ZN => L6a_LBL1_n_9);
  L6a_LBL1_g3310 : INR2D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => coin_register_reset, ZN => L6a_LBL1_n_8);
  L6a_LBL1_g3311 : CKND2D1BWP7T port map(A1 => L6a_LBL1_state(2), A2 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_7);
  L6a_LBL1_g3312 : NR2D1BWP7T port map(A1 => L6a_LBL1_n_3, A2 => L6a_LBL1_n_4, ZN => L6a_LBL1_n_5);
  L6a_LBL1_g3316 : CKND1BWP7T port map(I => L6a_count_intern(4), ZN => L6a_LBL1_n_1);
  L6a_LBL1_g3317 : INVD0BWP7T port map(I => pacman_ready, ZN => L6a_LBL1_n_0);
  L6a_LBL1_g3320 : INVD0BWP7T port map(I => L6a_LBL1_n_19, ZN => L6a_LBL1_n_32);
  L6a_LBL1_g2 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_48, A2 => L6a_LBL1_n_6, B => FE_PHN93_L6a_LBL1_n_2, ZN => L6a_LBL1_n_90);
  L6a_LBL1_g3321 : OAI31D0BWP7T port map(A1 => L6a_LBL1_n_44, A2 => L6a_LBL1_n_12, A3 => L6a_LBL1_n_6, B => L6a_LBL1_n_19, ZN => L6a_LBL1_n_91);
  L6a_LBL1_g3322 : AO221D0BWP7T port map(A1 => L6a_LBL1_n_18, A2 => L6a_LBL1_n_12, B1 => L6a_LBL1_state(2), B2 => L6a_LBL1_n_23, C => L6a_LBL1_n_15, Z => L6a_LBL1_n_92);
  L6a_LBL1_state_reg_2 : DFD1BWP7T port map(CP => CTS_11, D => L6a_LBL1_n_63, Q => L6a_LBL1_state(2), QN => L6a_LBL1_n_3);
  L6a_LBL1_state_reg_1 : DFD1BWP7T port map(CP => CTS_11, D => L6a_LBL1_n_60, Q => L6a_LBL1_state(1), QN => L6a_LBL1_n_4);
  L6a_LBL1_state_reg_3 : DFD1BWP7T port map(CP => CTS_11, D => L6a_LBL1_n_62, Q => FE_PHN110_L6a_LBL1_state_3, QN => L6a_LBL1_n_2);
  L6a_LBL2_count_out_reg_6 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(6), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(6));
  L6a_LBL2_count_out_reg_4 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(4), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(4));
  L6a_LBL2_count_out_reg_2 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(2), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(2));
  L6a_LBL2_count_out_reg_5 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(5), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(5));
  L6a_LBL2_count_out_reg_3 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(3), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(3));
  L6a_LBL2_count_out_reg_0 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(0), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(0));
  L6a_LBL2_count_out_reg_1 : DFKCNQD1BWP7T port map(CN => L6a_count_int2(1), CP => CTS_11, D => L6a_LBL2_n_0, Q => L6a_count_intern(1));
  L6a_LBL2_g16 : INVD1BWP7T port map(I => L6a_c_rst_int, ZN => L6a_LBL2_n_0);
  L6a_LBL4_cdn_loop_breaker : BUFFD1BWP7T port map(I => L6a_count_intern(6), Z => L6a_LBL4_n_12);
  L6a_LBL4_g35 : INVD0BWP7T port map(I => L6a_count_intern(0), ZN => L6a_LBL4_n_5);
  L6a_LBL4_g112 : MOAI22D0BWP7T port map(A1 => L6a_LBL4_n_4, A2 => L6a_LBL4_n_12, B1 => L6a_LBL4_n_4, B2 => L6a_LBL4_n_12, ZN => L6a_count_int3(6));
  L6a_LBL4_g113 : MOAI22D0BWP7T port map(A1 => L6a_LBL4_n_3, A2 => L6a_count_intern(5), B1 => L6a_LBL4_n_3, B2 => L6a_count_intern(5), ZN => L6a_LBL4_plus_6_50_5);
  L6a_LBL4_g114 : IND2D1BWP7T port map(A1 => L6a_LBL4_n_3, B1 => L6a_count_intern(5), ZN => L6a_LBL4_n_4);
  L6a_LBL4_g115 : MOAI22D0BWP7T port map(A1 => L6a_LBL4_n_2, A2 => L6a_count_intern(4), B1 => L6a_LBL4_n_2, B2 => L6a_count_intern(4), ZN => L6a_LBL4_plus_6_50_4);
  L6a_LBL4_g116 : IND2D1BWP7T port map(A1 => L6a_LBL4_n_2, B1 => L6a_count_intern(4), ZN => L6a_LBL4_n_3);
  L6a_LBL4_g117 : MOAI22D0BWP7T port map(A1 => L6a_LBL4_n_1, A2 => L6a_count_intern(3), B1 => L6a_LBL4_n_1, B2 => L6a_count_intern(3), ZN => L6a_LBL4_plus_6_50_3);
  L6a_LBL4_g118 : IND2D1BWP7T port map(A1 => L6a_LBL4_n_1, B1 => L6a_count_intern(3), ZN => L6a_LBL4_n_2);
  L6a_LBL4_g119 : MOAI22D0BWP7T port map(A1 => L6a_LBL4_n_0, A2 => L6a_count_intern(2), B1 => L6a_LBL4_n_0, B2 => L6a_count_intern(2), ZN => L6a_LBL4_plus_6_50_2);
  L6a_LBL4_g120 : IND2D1BWP7T port map(A1 => L6a_LBL4_n_0, B1 => L6a_count_intern(2), ZN => L6a_LBL4_n_1);
  L6a_LBL4_g121 : CKXOR2D0BWP7T port map(A1 => L6a_count_intern(0), A2 => L6a_count_intern(1), Z => L6a_LBL4_plus_6_50_1);
  L6a_LBL4_g122 : ND2D1BWP7T port map(A1 => L6a_count_intern(0), A2 => L6a_count_intern(1), ZN => L6a_LBL4_n_0);
  L3a_L0_FF1_data_out_reg_3 : DFKCNQD1BWP7T port map(CN => FE_PHN30_dir_ghost1_3, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN6_L3a_L0_data_intermediate_3);
  L3a_L0_FF1_data_out_reg_2 : DFKCNQD1BWP7T port map(CN => FE_PHN13_dir_ghost1_2, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN9_L3a_L0_data_intermediate_2);
  L3a_L0_FF1_data_out_reg_0 : DFKCNQD1BWP7T port map(CN => FE_PHN39_dir_ghost1_0, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN8_L3a_L0_data_intermediate_0);
  L3a_L0_FF1_data_out_reg_1 : DFKCNQD1BWP7T port map(CN => FE_PHN78_dir_ghost1_1, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN11_L3a_L0_data_intermediate_1);
  L3a_L0_FF2_data_out_reg_3 : DFKCNQD1BWP7T port map(CN => L3a_L0_data_intermediate(3), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3a_data_buffed(3));
  L3a_L0_FF2_data_out_reg_2 : DFKCNQD1BWP7T port map(CN => L3a_L0_data_intermediate(2), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN92_L3a_data_buffed_2);
  L3a_L0_FF2_data_out_reg_0 : DFKCNQD1BWP7T port map(CN => L3a_L0_data_intermediate(0), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3a_data_buffed(0));
  L3a_L0_FF2_data_out_reg_1 : DFKCNQD1BWP7T port map(CN => L3a_L0_data_intermediate(1), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3a_data_buffed(1));
  L6b_state_reg_0 : DFQD1BWP7T port map(CP => CTS_11, D => FE_PHN51_L6b_n_3, Q => L6b_state(0));
  L6b_state_reg_1 : DFQD1BWP7T port map(CP => CTS_11, D => FE_PHN48_L6b_n_2, Q => vc_done_pulse);
  L6b_g107 : AO211D0BWP7T port map(A1 => L6b_state(0), A2 => FE_DBTN1_vc_done_in, B => L6b_n_1, C => reset, Z => L6b_n_3);
  L6b_g108 : INR3D0BWP7T port map(A1 => L6b_state(0), B1 => reset, B2 => L6b_n_1, ZN => L6b_n_2);
  L6b_g109 : NR2D1BWP7T port map(A1 => vc_done_pulse, A2 => vc_done_in, ZN => L6b_n_1);
  L3a_L1_move_out_reg_1 : LNQD1BWP7T port map(D => L3a_L1_n_23, EN => L3a_L1_n_34, Q => L3a_move(1));
  L3a_L1_g310 : NR2D0BWP7T port map(A1 => L3a_L1_n_35, A2 => L3a_L1_n_26, ZN => L3a_L1_n_23);
  L3a_L1_g311 : INR2D0BWP7T port map(A1 => L3a_L1_n_24, B1 => L3a_L1_n_25, ZN => L3a_L1_n_34);
  L3a_L1_g312 : ND2D1BWP7T port map(A1 => L3a_L1_n_25, A2 => L3a_L1_state(0), ZN => L3a_L1_n_35);
  L3a_L1_g313 : ND2D1BWP7T port map(A1 => L3a_L1_n_27, A2 => L3a_L1_n_26, ZN => L3a_L1_n_24);
  L3a_L1_g648 : OR2D1BWP7T port map(A1 => L3a_L1_n_36, A2 => L3a_L1_n_19, Z => L3a_L1_n_22);
  L3a_L1_g649 : AO22D0BWP7T port map(A1 => L3a_L1_n_14, A2 => L3a_L1_n_15, B1 => L3a_L1_n_17, B2 => L3a_L1_n_1, Z => FE_PHN117_L3a_L1_n_21);
  L3a_L1_g650 : AO32D1BWP7T port map(A1 => L3a_L1_n_7, A2 => L3a_L1_n_16, A3 => L3a_L1_n_10, B1 => L3a_L1_n_1, B2 => L3a_L1_n_9, Z => L3a_L1_n_20);
  L3a_L1_g651 : NR4D0BWP7T port map(A1 => score_reset_out, A2 => L3a_L1_n_35, A3 => L3a_L1_n_13, A4 => L3a_L1_n_9, ZN => L3a_L1_n_19);
  L3a_L1_g653 : INR3D0BWP7T port map(A1 => L3a_L1_n_10, B1 => L3a_L1_n_9, B2 => L3a_L1_n_26, ZN => L3a_L1_n_17);
  L3a_L1_g654 : INVD0BWP7T port map(I => L3a_L1_n_15, ZN => L3a_L1_n_16);
  L3a_L1_g655 : IND2D1BWP7T port map(A1 => L3a_L1_n_13, B1 => L3a_L1_n_12, ZN => L3a_L1_n_15);
  L3a_L1_move_out_reg_3 : LNQD1BWP7T port map(D => L3a_L1_n_5, EN => L3a_L1_n_34, Q => L3a_move(3));
  L3a_L1_move_out_reg_2 : LNQD1BWP7T port map(D => L3a_L1_n_38, EN => L3a_L1_n_34, Q => L3a_move(2));
  L3a_L1_g659 : INR4D0BWP7T port map(A1 => L3a_data_buffed(2), B1 => FE_PHN89_L3a_data_buffed_0, B2 => FE_PHN99_L3a_data_buffed_1, B3 => L3a_data_buffed(3), ZN => L3a_L1_n_13);
  L3a_L1_g660 : IND3D1BWP7T port map(A1 => FE_PHN89_L3a_data_buffed_0, B1 => FE_PHN99_L3a_data_buffed_1, B2 => L3a_L1_n_4, ZN => L3a_L1_n_12);
  L3a_L1_g662 : IND3D1BWP7T port map(A1 => FE_PHN99_L3a_data_buffed_1, B1 => FE_PHN89_L3a_data_buffed_0, B2 => L3a_L1_n_4, ZN => L3a_L1_n_10);
  L3a_L1_g663 : INR4D0BWP7T port map(A1 => L3a_data_buffed(3), B1 => FE_PHN89_L3a_data_buffed_0, B2 => FE_PHN99_L3a_data_buffed_1, B3 => L3a_data_buffed(2), ZN => L3a_L1_n_9);
  L3a_L1_move_out_reg_0 : LNQD1BWP7T port map(D => L3a_L1_n_3, EN => L3a_L1_n_34, Q => L3a_move(0));
  L3a_L1_g667 : NR3D0BWP7T port map(A1 => L3a_L1_n_25, A2 => L3a_L1_state(0), A3 => L3a_L1_state(1), ZN => L3a_L1_n_5);
  L3a_L1_g668 : NR3D0BWP7T port map(A1 => score_reset_out, A2 => L3a_L1_n_24, A3 => L3a_L1_n_25, ZN => L3a_L1_n_7);
  L3a_L1_g669 : NR2D0BWP7T port map(A1 => L3a_L1_n_35, A2 => L3a_L1_state(1), ZN => L3a_L1_n_3);
  L3a_L1_g670 : NR2XD0BWP7T port map(A1 => L3a_data_buffed(2), A2 => L3a_data_buffed(3), ZN => L3a_L1_n_4);
  L3a_L1_g673 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => FE_PHN15_L3a_L1_state_2, ZN => L3a_L1_n_1);
  L3a_L1_g677 : INVD0BWP7T port map(I => L3a_L1_n_37, ZN => L3a_L1_n_14);
  L3a_L1_g2 : AOI21D0BWP7T port map(A1 => L3a_L1_n_12, A2 => L3a_L1_n_10, B => L3a_L1_n_37, ZN => L3a_L1_n_36);
  L3a_L1_g678 : NR2D1BWP7T port map(A1 => L3a_L1_n_1, A2 => L3a_L1_n_7, ZN => L3a_L1_n_37);
  L3a_L1_state_reg_0 : DFD1BWP7T port map(CP => CTS_12, D => FE_PHN113_L3a_L1_n_22, Q => L3a_L1_state(0), QN => L3a_L1_n_27);
  L3a_L1_state_reg_2 : DFD1BWP7T port map(CP => CTS_12, D => FE_PHN116_L3a_L1_n_20, Q => L3a_L1_state(2), QN => L3a_L1_n_25);
  L3a_L1_state_reg_1 : DFD1BWP7T port map(CP => CTS_12, D => L3a_L1_n_21, Q => L3a_L1_state(1), QN => L3a_L1_n_26);
  L3a_L1_g685 : NR3D0BWP7T port map(A1 => L3a_L1_n_26, A2 => L3a_L1_state(0), A3 => L3a_L1_state(2), ZN => L3a_L1_n_38);
  L1a_g3828 : INVD1BWP7T port map(I => coin_register_reset, ZN => L1a_n_180);
  L1a_g9812 : AN4D0BWP7T port map(A1 => L1a_n_179, A2 => L1a_coin_memory(13), A3 => L1a_coin_memory(14), A4 => L1a_coin_memory(15), Z => zero_coins);
  L1a_g9813 : AN4D0BWP7T port map(A1 => L1a_n_178, A2 => L1a_coin_memory(10), A3 => L1a_coin_memory(11), A4 => L1a_coin_memory(12), Z => L1a_n_179);
  L1a_g9814 : AN4D0BWP7T port map(A1 => L1a_n_177, A2 => L1a_coin_memory(6), A3 => L1a_coin_memory(7), A4 => L1a_coin_memory(9), Z => L1a_n_178);
  L1a_g9815 : AN4D0BWP7T port map(A1 => L1a_n_176, A2 => L1a_coin_memory(43), A3 => L1a_coin_memory(4), A4 => L1a_coin_memory(5), Z => L1a_n_177);
  L1a_g9816 : AN4D0BWP7T port map(A1 => L1a_n_175, A2 => L1a_coin_memory(40), A3 => L1a_coin_memory(41), A4 => L1a_coin_memory(42), Z => L1a_n_176);
  L1a_g9817 : AN4D0BWP7T port map(A1 => L1a_n_174, A2 => L1a_coin_memory(37), A3 => L1a_coin_memory(38), A4 => L1a_coin_memory(39), Z => L1a_n_175);
  L1a_g9818 : AN4D0BWP7T port map(A1 => L1a_n_173, A2 => L1a_coin_memory(47), A3 => L1a_coin_memory(8), A4 => L1a_coin_memory(36), Z => L1a_n_174);
  L1a_g9819 : AN4D0BWP7T port map(A1 => L1a_n_172, A2 => L1a_coin_memory(44), A3 => L1a_coin_memory(45), A4 => L1a_coin_memory(46), Z => L1a_n_173);
  L1a_g9820 : CKAN2D8BWP7T port map(A1 => coin_present, A2 => write_coin, Z => score_pulse);
  L1a_g9821 : NR3D0BWP7T port map(A1 => L1a_n_171, A2 => L1a_n_162, A3 => L1a_n_134, ZN => coin_present);
  L1a_g9822 : AN4D0BWP7T port map(A1 => L1a_n_169, A2 => L1a_coin_memory(2), A3 => L1a_coin_memory(3), A4 => L1a_coin_memory(35), Z => L1a_n_172);
  L1a_g9823 : OAI221D0BWP7T port map(A1 => L1a_n_147, A2 => L1a_n_206, B1 => L1a_n_195, B2 => L1a_n_138, C => L1a_n_170, ZN => L1a_n_171);
  L1a_g9824 : AOI21D0BWP7T port map(A1 => L1a_n_168, A2 => L1a_n_153, B => L1a_n_159, ZN => L1a_n_170);
  L1a_g9825 : AN4D0BWP7T port map(A1 => L1a_n_167, A2 => L1a_coin_memory(21), A3 => L1a_coin_memory(0), A4 => L1a_coin_memory(1), Z => L1a_n_169);
  L1a_g9826 : AOI211D1BWP7T port map(A1 => L1a_n_136, A2 => L1a_n_104, B => L1a_n_166, C => L1a_n_129, ZN => L1a_n_168);
  L1a_g9827 : AN4D0BWP7T port map(A1 => L1a_n_164, A2 => L1a_coin_memory(23), A3 => L1a_coin_memory(22), A4 => L1a_coin_memory(20), Z => L1a_n_167);
  L1a_g9828 : OAI221D0BWP7T port map(A1 => L1a_n_142, A2 => L1a_n_196, B1 => L1a_n_197, B2 => L1a_n_135, C => L1a_n_165, ZN => L1a_n_166);
  L1a_g9829 : OA221D0BWP7T port map(A1 => L1a_n_113, A2 => L1a_n_203, B1 => L1a_n_183, B2 => L1a_n_202, C => L1a_n_163, Z => L1a_n_165);
  L1a_g9830 : AN4D0BWP7T port map(A1 => L1a_n_161, A2 => L1a_coin_memory(18), A3 => L1a_coin_memory(17), A4 => L1a_coin_memory(16), Z => L1a_n_164);
  L1a_g9831 : AN4D0BWP7T port map(A1 => L1a_n_160, A2 => L1a_n_154, A3 => L1a_n_133, A4 => L1a_n_128, Z => L1a_n_163);
  L1a_g9832 : ND4D0BWP7T port map(A1 => L1a_n_157, A2 => L1a_n_155, A3 => L1a_n_158, A4 => L1a_n_156, ZN => L1a_n_162);
  L1a_g9833 : AN4D0BWP7T port map(A1 => L1a_n_151, A2 => L1a_coin_memory(31), A3 => L1a_coin_memory(19), A4 => L1a_coin_memory(24), Z => L1a_n_161);
  L1a_g9834 : AN4D0BWP7T port map(A1 => L1a_n_152, A2 => L1a_n_150, A3 => L1a_n_139, A4 => L1a_n_115, Z => L1a_n_160);
  L1a_g9835 : OAI221D0BWP7T port map(A1 => L1a_n_145, A2 => L1a_n_194, B1 => L1a_n_193, B2 => L1a_n_119, C => L1a_n_141, ZN => L1a_n_159);
  L1a_g9836 : OA221D0BWP7T port map(A1 => L1a_n_149, A2 => L1a_n_203, B1 => L1a_n_202, B2 => L1a_n_126, C => L1a_n_132, Z => L1a_n_158);
  L1a_g9837 : OA221D0BWP7T port map(A1 => L1a_n_146, A2 => L1a_n_197, B1 => L1a_n_196, B2 => L1a_n_127, C => L1a_n_131, Z => L1a_n_157);
  L1a_g9838 : OA221D0BWP7T port map(A1 => L1a_n_148, A2 => L1a_n_199, B1 => L1a_n_198, B2 => L1a_n_137, C => L1a_n_130, Z => L1a_n_156);
  L1a_g9839 : OA221D0BWP7T port map(A1 => L1a_n_144, A2 => L1a_n_201, B1 => L1a_n_200, B2 => L1a_n_125, C => L1a_n_112, Z => L1a_n_155);
  L1a_g9840 : IAO21D0BWP7T port map(A1 => L1a_n_142, A2 => L1a_n_199, B => L1a_n_140, ZN => L1a_n_154);
  L1a_g9841 : OA22D0BWP7T port map(A1 => L1a_n_143, A2 => L1a_n_200, B1 => L1a_n_201, B2 => L1a_n_116, Z => L1a_n_153);
  L1a_g9842 : OA22D0BWP7T port map(A1 => L1a_n_143, A2 => L1a_n_206, B1 => L1a_n_185, B2 => L1a_n_195, Z => L1a_n_152);
  L1a_g9843 : AN4D0BWP7T port map(A1 => L1a_n_109, A2 => L1a_coin_memory(28), A3 => L1a_coin_memory(29), A4 => L1a_coin_memory(30), Z => L1a_n_151);
  L1a_g9844 : OAI21D0BWP7T port map(A1 => L1a_n_136, A2 => L1a_n_93, B => L1a_n_106, ZN => L1a_n_150);
  L1a_g9845 : CKAN2D1BWP7T port map(A1 => L1a_n_123, A2 => L1a_n_124, Z => L1a_n_149);
  L1a_g9846 : CKAN2D1BWP7T port map(A1 => L1a_n_110, A2 => L1a_n_122, Z => L1a_n_148);
  L1a_g9847 : CKAN2D1BWP7T port map(A1 => L1a_n_111, A2 => L1a_n_121, Z => L1a_n_147);
  L1a_g9848 : CKAN2D1BWP7T port map(A1 => L1a_n_120, A2 => L1a_n_107, Z => L1a_n_146);
  L1a_g9849 : CKAN2D1BWP7T port map(A1 => L1a_n_118, A2 => L1a_n_108, Z => L1a_n_145);
  L1a_g9850 : AOI221D0BWP7T port map(A1 => L1a_n_99, A2 => L1a_coin_memory(41), B1 => L1a_n_91, B2 => L1a_coin_memory(40), C => L1a_n_117, ZN => L1a_n_144);
  L1a_g9851 : AOI32D1BWP7T port map(A1 => L1a_n_105, A2 => L1a_n_84, A3 => L1a_coin_memory(7), B1 => L1a_n_114, B2 => L1a_coin_memory(14), ZN => L1a_n_141);
  L1a_g9852 : AOI21D0BWP7T port map(A1 => L1a_n_198, A2 => L1a_n_195, B => L1a_n_135, ZN => L1a_n_140);
  L1a_g9853 : AO21D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_113, B => L1a_n_193, Z => L1a_n_139);
  L1a_g9854 : AOI222D0BWP7T port map(A1 => L1a_n_100, A2 => L1a_coin_memory(6), B1 => L1a_n_99, B2 => L1a_coin_memory(5), C1 => L1a_n_91, C2 => L1a_coin_memory(4), ZN => L1a_n_138);
  L1a_g9855 : AOI222D0BWP7T port map(A1 => L1a_n_100, A2 => L1a_coin_memory(22), B1 => L1a_n_99, B2 => L1a_coin_memory(21), C1 => L1a_n_91, C2 => L1a_coin_memory(20), ZN => L1a_n_137);
  L1a_g9856 : AN3D0BWP7T port map(A1 => L1a_n_113, A2 => L1a_n_187, A3 => L1a_n_204, Z => L1a_n_143);
  L1a_g9857 : AN3D0BWP7T port map(A1 => L1a_n_113, A2 => L1a_n_189, A3 => L1a_n_185, Z => L1a_n_142);
  L1a_g9858 : INR3D0BWP7T port map(A1 => L1a_coin_memory(47), B1 => L1a_n_204, B2 => L1a_n_200, ZN => L1a_n_134);
  L1a_g9859 : AO21D0BWP7T port map(A1 => L1a_n_188, A2 => L1a_n_185, B => L1a_n_201, Z => L1a_n_133);
  L1a_g9860 : IND3D1BWP7T port map(A1 => L1a_n_196, B1 => L1a_coin_memory(31), B2 => L1a_n_84, ZN => L1a_n_132);
  L1a_g9861 : IND3D0BWP7T port map(A1 => L1a_n_198, B1 => L1a_coin_memory(23), B2 => L1a_n_84, ZN => L1a_n_131);
  L1a_g9862 : IND3D1BWP7T port map(A1 => L1a_n_193, B1 => L1a_coin_memory(15), B2 => L1a_n_98, ZN => L1a_n_130);
  L1a_g9863 : AOI21D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_192, B => L1a_n_203, ZN => L1a_n_129);
  L1a_g9864 : IOA21D1BWP7T port map(A1 => L1a_n_198, A2 => L1a_n_197, B => L1a_n_91, ZN => L1a_n_128);
  L1a_g9865 : AOI222D0BWP7T port map(A1 => L1a_n_98, A2 => L1a_coin_memory(30), B1 => L1a_n_91, B2 => L1a_coin_memory(28), C1 => L1a_n_92, C2 => L1a_coin_memory(29), ZN => L1a_n_127);
  L1a_g9866 : ND3D0BWP7T port map(A1 => L1a_n_191, A2 => L1a_n_182, A3 => L1a_n_190, ZN => L1a_n_136);
  L1a_g9867 : AN2D0BWP7T port map(A1 => L1a_n_116, A2 => L1a_n_188, Z => L1a_n_135);
  L1a_g9868 : AOI222D0BWP7T port map(A1 => L1a_n_102, A2 => L1a_coin_memory(38), B1 => L1a_n_94, B2 => L1a_coin_memory(36), C1 => L1a_n_93, C2 => L1a_coin_memory(37), ZN => L1a_n_126);
  L1a_g9869 : AOI222D0BWP7T port map(A1 => L1a_n_98, A2 => L1a_coin_memory(46), B1 => L1a_n_86, B2 => L1a_coin_memory(44), C1 => L1a_n_92, C2 => L1a_coin_memory(45), ZN => L1a_n_125);
  L1a_g9870 : AOI22D0BWP7T port map(A1 => L1a_n_92, A2 => L1a_coin_memory(32), B1 => L1a_n_103, B2 => L1a_coin_memory(34), ZN => L1a_n_124);
  L1a_g9871 : AOI22D0BWP7T port map(A1 => L1a_n_101, A2 => L1a_coin_memory(33), B1 => L1a_n_98, B2 => L1a_coin_memory(35), ZN => L1a_n_123);
  L1a_g9872 : AOI22D0BWP7T port map(A1 => L1a_n_98, A2 => L1a_coin_memory(18), B1 => L1a_n_92, B2 => L1a_coin_memory(17), ZN => L1a_n_122);
  L1a_g9873 : AOI22D0BWP7T port map(A1 => L1a_n_98, A2 => L1a_coin_memory(2), B1 => L1a_n_95, B2 => L1a_coin_memory(3), ZN => L1a_n_121);
  L1a_g9874 : AOI22D0BWP7T port map(A1 => L1a_n_99, A2 => L1a_coin_memory(25), B1 => L1a_n_100, B2 => L1a_coin_memory(26), ZN => L1a_n_120);
  L1a_g9875 : AOI22D0BWP7T port map(A1 => L1a_n_101, A2 => L1a_coin_memory(13), B1 => L1a_n_92, B2 => L1a_coin_memory(12), ZN => L1a_n_119);
  L1a_g9876 : AOI22D0BWP7T port map(A1 => L1a_n_102, A2 => L1a_coin_memory(10), B1 => L1a_n_93, B2 => L1a_coin_memory(9), ZN => L1a_n_118);
  L1a_g9877 : AO22D0BWP7T port map(A1 => L1a_n_84, A2 => L1a_coin_memory(43), B1 => L1a_coin_memory(42), B2 => L1a_n_100, Z => L1a_n_117);
  L1a_g9878 : INVD0BWP7T port map(I => L1a_n_114, ZN => L1a_n_115);
  L1a_g9879 : IND3D1BWP7T port map(A1 => L1a_n_182, B1 => L1a_coin_memory(39), B2 => L1a_n_104, ZN => L1a_n_112);
  L1a_g9880 : NR2D1BWP7T port map(A1 => L1a_n_100, A2 => L1a_n_84, ZN => L1a_n_116);
  L1a_g9881 : NR2XD0BWP7T port map(A1 => L1a_n_192, A2 => L1a_n_193, ZN => L1a_n_114);
  L1a_g9882 : NR2D1BWP7T port map(A1 => L1a_n_98, A2 => L1a_n_92, ZN => L1a_n_113);
  L1a_g9883 : AOI22D0BWP7T port map(A1 => L1a_n_86, A2 => L1a_coin_memory(0), B1 => L1a_n_92, B2 => L1a_coin_memory(1), ZN => L1a_n_111);
  L1a_g9884 : AOI22D0BWP7T port map(A1 => L1a_n_91, A2 => L1a_coin_memory(16), B1 => L1a_n_84, B2 => L1a_coin_memory(19), ZN => L1a_n_110);
  L1a_g9885 : AN4D0BWP7T port map(A1 => L1a_n_75, A2 => L1a_coin_memory(25), A3 => L1a_coin_memory(26), A4 => L1a_coin_memory(27), Z => L1a_n_109);
  L1a_g9886 : AOI22D0BWP7T port map(A1 => L1a_n_94, A2 => L1a_coin_memory(8), B1 => L1a_n_85, B2 => L1a_coin_memory(11), ZN => L1a_n_108);
  L1a_g9887 : AOI22D0BWP7T port map(A1 => L1a_n_91, A2 => L1a_coin_memory(24), B1 => L1a_n_84, B2 => L1a_coin_memory(27), ZN => L1a_n_107);
  L1a_g9888 : INVD0BWP7T port map(I => L1a_n_106, ZN => L1a_n_194);
  L1a_g9889 : INVD0BWP7T port map(I => L1a_n_195, ZN => L1a_n_105);
  L1a_g9890 : INVD0BWP7T port map(I => L1a_n_202, ZN => L1a_n_104);
  L1a_g9891 : NR2XD0BWP7T port map(A1 => L1a_n_90, A2 => row_coin(1), ZN => L1a_n_106);
  L1a_g9892 : OR2D1BWP7T port map(A1 => L1a_n_97, A2 => row_coin(1), Z => L1a_n_199);
  L1a_g9893 : OR2D1BWP7T port map(A1 => L1a_n_89, A2 => row_coin(1), Z => L1a_n_201);
  L1a_g9894 : ND2D1BWP7T port map(A1 => L1a_n_88, A2 => L1a_n_65, ZN => L1a_n_203);
  L1a_g9895 : IND2D1BWP7T port map(A1 => L1a_n_89, B1 => row_coin(1), ZN => L1a_n_200);
  L1a_g9896 : ND2D1BWP7T port map(A1 => L1a_n_96, A2 => row_coin(1), ZN => L1a_n_195);
  L1a_g9898 : ND2D1BWP7T port map(A1 => L1a_n_88, A2 => row_coin(1), ZN => L1a_n_202);
  L1a_g9899 : IND2D1BWP7T port map(A1 => L1a_n_97, B1 => row_coin(1), ZN => L1a_n_198);
  L1a_g9900 : INVD1BWP7T port map(I => L1a_n_103, ZN => L1a_n_192);
  L1a_g9901 : INVD0BWP7T port map(I => L1a_n_191, ZN => L1a_n_102);
  L1a_g9902 : INVD1BWP7T port map(I => L1a_n_101, ZN => L1a_n_181);
  L1a_g9903 : INVD1BWP7T port map(I => L1a_n_184, ZN => L1a_n_100);
  L1a_g9904 : INVD1BWP7T port map(I => L1a_n_99, ZN => L1a_n_188);
  L1a_g9905 : INVD1BWP7T port map(I => L1a_n_186, ZN => L1a_n_98);
  L1a_g9906 : ND2D1BWP7T port map(A1 => L1a_n_96, A2 => L1a_n_65, ZN => L1a_n_206);
  L1a_g9907 : ND2D1BWP7T port map(A1 => L1a_n_87, A2 => row_coin(1), ZN => L1a_n_196);
  L1a_g9908 : ND2D1BWP7T port map(A1 => L1a_n_87, A2 => L1a_n_65, ZN => L1a_n_197);
  L1a_g9909 : NR3D0BWP7T port map(A1 => L1a_n_79, A2 => L1a_n_66, A3 => col_coin(0), ZN => L1a_n_103);
  L1a_g9910 : IND3D1BWP7T port map(A1 => col_coin(2), B1 => col_coin(4), B2 => L1a_n_82, ZN => L1a_n_191);
  L1a_g9911 : NR3D0BWP7T port map(A1 => L1a_n_83, A2 => col_coin(1), A3 => L1a_n_67, ZN => L1a_n_101);
  L1a_g9912 : IND3D1BWP7T port map(A1 => L1a_n_79, B1 => col_coin(0), B2 => col_coin(1), ZN => L1a_n_184);
  L1a_g9913 : NR3D0BWP7T port map(A1 => L1a_n_83, A2 => col_coin(1), A3 => col_coin(0), ZN => L1a_n_99);
  L1a_g9914 : IND3D1BWP7T port map(A1 => col_coin(2), B1 => col_coin(4), B2 => L1a_n_80, ZN => L1a_n_186);
  L1a_g9915 : INVD0BWP7T port map(I => L1a_n_204, ZN => L1a_n_95);
  L1a_g9916 : INVD0BWP7T port map(I => L1a_n_190, ZN => L1a_n_94);
  L1a_g9917 : INVD0BWP7T port map(I => L1a_n_183, ZN => L1a_n_93);
  L1a_g9919 : INVD1BWP7T port map(I => L1a_n_185, ZN => L1a_n_91);
  L1a_g9920 : ND2D1BWP7T port map(A1 => L1a_n_78, A2 => row_coin(3), ZN => L1a_n_97);
  L1a_g9921 : INR2XD0BWP7T port map(A1 => L1a_n_78, B1 => row_coin(3), ZN => L1a_n_96);
  L1a_g9922 : IND2D1BWP7T port map(A1 => L1a_n_72, B1 => L1a_n_82, ZN => L1a_n_204);
  L1a_g9923 : IND2D1BWP7T port map(A1 => L1a_n_81, B1 => L1a_n_68, ZN => L1a_n_190);
  L1a_g9924 : ND2D1BWP7T port map(A1 => L1a_n_80, A2 => L1a_n_70, ZN => L1a_n_183);
  L1a_g9925 : NR2XD0BWP7T port map(A1 => L1a_n_69, A2 => L1a_n_81, ZN => L1a_n_92);
  L1a_g9926 : ND2D1BWP7T port map(A1 => L1a_n_68, A2 => L1a_n_80, ZN => L1a_n_185);
  L1a_g9928 : INVD0BWP7T port map(I => L1a_n_187, ZN => L1a_n_86);
  L1a_g9929 : INVD0BWP7T port map(I => L1a_n_182, ZN => L1a_n_85);
  L1a_g9930 : INVD1BWP7T port map(I => L1a_n_84, ZN => L1a_n_189);
  L1a_g9931 : IND3D1BWP7T port map(A1 => row_coin(3), B1 => row_coin(2), B2 => L1a_n_71, ZN => L1a_n_90);
  L1a_g9932 : ND2D1BWP7T port map(A1 => L1a_n_76, A2 => row_coin(2), ZN => L1a_n_89);
  L1a_g9933 : NR2XD0BWP7T port map(A1 => L1a_n_77, A2 => row_coin(2), ZN => L1a_n_88);
  L1a_g9934 : IINR4D0BWP7T port map(A1 => row_coin(3), A2 => row_coin(2), B1 => row_coin(4), B2 => row_coin(0), ZN => L1a_n_87);
  L1a_g9935 : ND3D0BWP7T port map(A1 => L1a_n_68, A2 => L1a_n_74, A3 => col_coin(1), ZN => L1a_n_187);
  L1a_g9936 : IND2D1BWP7T port map(A1 => L1a_n_72, B1 => L1a_n_80, ZN => L1a_n_182);
  L1a_g9937 : NR2XD0BWP7T port map(A1 => L1a_n_72, A2 => L1a_n_81, ZN => L1a_n_84);
  L1a_g9938 : ND2D1BWP7T port map(A1 => L1a_n_68, A2 => col_coin(3), ZN => L1a_n_83);
  L1a_g9939 : CKAN2D1BWP7T port map(A1 => L1a_n_73, A2 => L1a_n_66, Z => L1a_n_82);
  L1a_g9940 : ND2D1BWP7T port map(A1 => L1a_n_73, A2 => col_coin(1), ZN => L1a_n_81);
  L1a_g9941 : CKAN2D1BWP7T port map(A1 => L1a_n_74, A2 => L1a_n_66, Z => L1a_n_80);
  L1a_g9942 : INVD0BWP7T port map(I => L1a_n_76, ZN => L1a_n_77);
  L1a_g9943 : AN3D0BWP7T port map(A1 => L1a_coin_memory(33), A2 => L1a_coin_memory(32), A3 => L1a_coin_memory(34), Z => L1a_n_75);
  L1a_g9944 : ND2D1BWP7T port map(A1 => L1a_n_70, A2 => col_coin(3), ZN => L1a_n_79);
  L1a_g9945 : INR2XD0BWP7T port map(A1 => L1a_n_71, B1 => row_coin(2), ZN => L1a_n_78);
  L1a_g9946 : INR3D0BWP7T port map(A1 => row_coin(4), B1 => row_coin(0), B2 => row_coin(3), ZN => L1a_n_76);
  L1a_g9947 : NR2XD0BWP7T port map(A1 => col_coin(3), A2 => L1a_n_67, ZN => L1a_n_74);
  L1a_g9948 : NR2XD0BWP7T port map(A1 => col_coin(3), A2 => col_coin(0), ZN => L1a_n_73);
  L1a_g9949 : ND2D1BWP7T port map(A1 => col_coin(4), A2 => col_coin(2), ZN => L1a_n_72);
  L1a_g9950 : INVD0BWP7T port map(I => L1a_n_70, ZN => L1a_n_69);
  L1a_g9951 : INR2XD0BWP7T port map(A1 => row_coin(0), B1 => row_coin(4), ZN => L1a_n_71);
  L1a_g9952 : INR2XD0BWP7T port map(A1 => col_coin(2), B1 => col_coin(4), ZN => L1a_n_70);
  L1a_g9953 : NR2XD0BWP7T port map(A1 => col_coin(4), A2 => col_coin(2), ZN => L1a_n_68);
  L1a_g9954 : INVD1BWP7T port map(I => col_coin(0), ZN => L1a_n_67);
  L1a_g9955 : INVD0BWP7T port map(I => col_coin(1), ZN => L1a_n_66);
  L1a_g9957 : INVD1BWP7T port map(I => row_coin(1), ZN => L1a_n_65);
  L1a_g2 : IND2D1BWP7T port map(A1 => L1a_n_90, B1 => row_coin(1), ZN => L1a_n_193);
  L1a_coin_memory_reg_0 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_18, Q => L1a_coin_memory(0));
  L1a_coin_memory_reg_1 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_48, Q => L1a_coin_memory(1));
  L1a_coin_memory_reg_2 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_46, Q => L1a_coin_memory(2));
  L1a_coin_memory_reg_3 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_19, Q => L1a_coin_memory(3));
  L1a_coin_memory_reg_4 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_36, Q => L1a_coin_memory(4));
  L1a_coin_memory_reg_5 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_39, Q => L1a_coin_memory(5));
  L1a_coin_memory_reg_6 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_34, Q => L1a_coin_memory(6));
  L1a_coin_memory_reg_7 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_33, Q => L1a_coin_memory(7));
  L1a_coin_memory_reg_8 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_28, Q => L1a_coin_memory(8));
  L1a_coin_memory_reg_9 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_27, Q => L1a_coin_memory(9));
  L1a_coin_memory_reg_10 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_63, Q => L1a_coin_memory(10));
  L1a_coin_memory_reg_11 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_61, Q => L1a_coin_memory(11));
  L1a_coin_memory_reg_12 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_59, Q => L1a_coin_memory(12));
  L1a_coin_memory_reg_13 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_24, Q => L1a_coin_memory(13));
  L1a_coin_memory_reg_14 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_21, Q => L1a_coin_memory(14));
  L1a_coin_memory_reg_15 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_56, Q => L1a_coin_memory(15));
  L1a_coin_memory_reg_16 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_55, Q => L1a_coin_memory(16));
  L1a_coin_memory_reg_17 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_54, Q => L1a_coin_memory(17));
  L1a_coin_memory_reg_18 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_53, Q => L1a_coin_memory(18));
  L1a_coin_memory_reg_19 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_52, Q => L1a_coin_memory(19));
  L1a_coin_memory_reg_20 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_51, Q => L1a_coin_memory(20));
  L1a_coin_memory_reg_21 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_50, Q => L1a_coin_memory(21));
  L1a_coin_memory_reg_22 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_64, Q => L1a_coin_memory(22));
  L1a_coin_memory_reg_23 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_47, Q => L1a_coin_memory(23));
  L1a_coin_memory_reg_24 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_45, Q => L1a_coin_memory(24));
  L1a_coin_memory_reg_25 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_44, Q => L1a_coin_memory(25));
  L1a_coin_memory_reg_26 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_43, Q => L1a_coin_memory(26));
  L1a_coin_memory_reg_27 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_42, Q => L1a_coin_memory(27));
  L1a_coin_memory_reg_28 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_41, Q => L1a_coin_memory(28));
  L1a_coin_memory_reg_29 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_40, Q => L1a_coin_memory(29));
  L1a_coin_memory_reg_30 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_38, Q => L1a_coin_memory(30));
  L1a_coin_memory_reg_31 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_37, Q => L1a_coin_memory(31));
  L1a_coin_memory_reg_32 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_35, Q => L1a_coin_memory(32));
  L1a_coin_memory_reg_33 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_20, Q => L1a_coin_memory(33));
  L1a_coin_memory_reg_34 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_17, Q => L1a_coin_memory(34));
  L1a_coin_memory_reg_35 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_32, Q => L1a_coin_memory(35));
  L1a_coin_memory_reg_36 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_31, Q => L1a_coin_memory(36));
  L1a_coin_memory_reg_37 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_30, Q => L1a_coin_memory(37));
  L1a_coin_memory_reg_38 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_29, Q => L1a_coin_memory(38));
  L1a_coin_memory_reg_39 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_26, Q => L1a_coin_memory(39));
  L1a_coin_memory_reg_40 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_25, Q => L1a_coin_memory(40));
  L1a_coin_memory_reg_41 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_49, Q => L1a_coin_memory(41));
  L1a_coin_memory_reg_42 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_62, Q => L1a_coin_memory(42));
  L1a_coin_memory_reg_43 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_60, Q => L1a_coin_memory(43));
  L1a_coin_memory_reg_44 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_22, Q => L1a_coin_memory(44));
  L1a_coin_memory_reg_45 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_58, Q => L1a_coin_memory(45));
  L1a_coin_memory_reg_46 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_57, Q => L1a_coin_memory(46));
  L1a_coin_memory_reg_47 : DFQD1BWP7T port map(CP => CTS_11, D => L1a_n_23, Q => L1a_coin_memory(47));
  L1a_g5074 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_198, B1 => L1a_n_180, B2 => FE_PHN57_L1a_coin_memory_22, ZN => L1a_n_64);
  L1a_g5075 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_191, B1 => L1a_n_180, B2 => FE_PHN63_L1a_coin_memory_10, ZN => L1a_n_63);
  L1a_g5076 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_201, B1 => L1a_n_180, B2 => FE_PHN28_L1a_coin_memory_42, ZN => L1a_n_62);
  L1a_g5077 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_182, B1 => L1a_n_180, B2 => FE_PHN59_L1a_coin_memory_11, ZN => L1a_n_61);
  L1a_g5078 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_201, B1 => L1a_n_180, B2 => FE_PHN32_L1a_coin_memory_43, ZN => L1a_n_60);
  L1a_g5079 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_193, B1 => L1a_n_180, B2 => FE_PHN35_L1a_coin_memory_12, ZN => L1a_n_59);
  L1a_g5080 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_200, B1 => L1a_n_180, B2 => FE_PHN24_L1a_coin_memory_45, ZN => L1a_n_58);
  L1a_g5081 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_200, B1 => L1a_n_180, B2 => FE_PHN34_L1a_coin_memory_46, ZN => L1a_n_57);
  L1a_g5082 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_193, B1 => L1a_n_180, B2 => FE_PHN46_L1a_coin_memory_15, ZN => L1a_n_56);
  L1a_g5083 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_199, B1 => L1a_n_180, B2 => FE_PHN40_L1a_coin_memory_16, ZN => L1a_n_55);
  L1a_g5084 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_199, B1 => L1a_n_180, B2 => FE_PHN62_L1a_coin_memory_17, ZN => L1a_n_54);
  L1a_g5085 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_199, B1 => L1a_n_180, B2 => FE_PHN75_L1a_coin_memory_18, ZN => L1a_n_53);
  L1a_g5086 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_199, B1 => L1a_n_180, B2 => FE_PHN19_L1a_coin_memory_19, ZN => L1a_n_52);
  L1a_g5087 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_198, B1 => L1a_n_180, B2 => FE_PHN20_L1a_coin_memory_20, ZN => L1a_n_51);
  L1a_g5088 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_198, B1 => L1a_n_180, B2 => FE_PHN23_L1a_coin_memory_21, ZN => L1a_n_50);
  L1a_g5089 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_201, B1 => L1a_n_180, B2 => FE_PHN33_L1a_coin_memory_41, ZN => L1a_n_49);
  L1a_g5098 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_206, B1 => L1a_n_180, B2 => FE_PHN18_L1a_coin_memory_1, ZN => L1a_n_48);
  L1a_g5099 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_198, B1 => L1a_n_180, B2 => FE_PHN53_L1a_coin_memory_23, ZN => L1a_n_47);
  L1a_g5100 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_206, B1 => L1a_n_180, B2 => FE_PHN60_L1a_coin_memory_2, ZN => L1a_n_46);
  L1a_g5101 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_197, B1 => L1a_n_180, B2 => FE_PHN22_L1a_coin_memory_24, ZN => L1a_n_45);
  L1a_g5102 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_197, B1 => L1a_n_180, B2 => FE_PHN58_L1a_coin_memory_25, ZN => L1a_n_44);
  L1a_g5103 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_197, B1 => L1a_n_180, B2 => FE_PHN74_L1a_coin_memory_26, ZN => L1a_n_43);
  L1a_g5104 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_197, B1 => L1a_n_180, B2 => FE_PHN54_L1a_coin_memory_27, ZN => L1a_n_42);
  L1a_g5105 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_196, B1 => L1a_n_180, B2 => FE_PHN106_L1a_coin_memory_28, ZN => L1a_n_41);
  L1a_g5106 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_196, B1 => L1a_n_180, B2 => FE_PHN16_L1a_coin_memory_29, ZN => L1a_n_40);
  L1a_g5107 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_195, B1 => L1a_n_180, B2 => FE_PHN26_L1a_coin_memory_5, ZN => L1a_n_39);
  L1a_g5108 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_196, B1 => L1a_n_180, B2 => FE_PHN56_L1a_coin_memory_30, ZN => L1a_n_38);
  L1a_g5109 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_196, B1 => L1a_n_180, B2 => FE_PHN61_L1a_coin_memory_31, ZN => L1a_n_37);
  L1a_g5110 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_195, B1 => L1a_n_180, B2 => FE_PHN14_L1a_coin_memory_4, ZN => L1a_n_36);
  L1a_g5111 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_203, B1 => L1a_n_180, B2 => FE_PHN25_L1a_coin_memory_32, ZN => L1a_n_35);
  L1a_g5112 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_195, B1 => L1a_n_180, B2 => FE_PHN21_L1a_coin_memory_6, ZN => L1a_n_34);
  L1a_g5113 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_195, B1 => L1a_n_180, B2 => FE_PHN42_L1a_coin_memory_7, ZN => L1a_n_33);
  L1a_g5114 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_203, B1 => L1a_n_180, B2 => FE_PHN37_L1a_coin_memory_35, ZN => L1a_n_32);
  L1a_g5115 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_190, B1 => L1a_n_180, B2 => FE_PHN47_L1a_coin_memory_36, ZN => L1a_n_31);
  L1a_g5116 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_183, B1 => L1a_n_180, B2 => FE_PHN27_L1a_coin_memory_37, ZN => L1a_n_30);
  L1a_g5117 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_191, B1 => L1a_n_180, B2 => FE_PHN29_L1a_coin_memory_38, ZN => L1a_n_29);
  L1a_g5118 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_190, B1 => L1a_n_180, B2 => FE_PHN43_L1a_coin_memory_8, ZN => L1a_n_28);
  L1a_g5119 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_183, B1 => L1a_n_180, B2 => FE_PHN12_L1a_coin_memory_9, ZN => L1a_n_27);
  L1a_g5120 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_182, B1 => L1a_n_180, B2 => FE_PHN72_L1a_coin_memory_39, ZN => L1a_n_26);
  L1a_g5121 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_201, B1 => L1a_n_180, B2 => FE_PHN104_L1a_coin_memory_40, ZN => L1a_n_25);
  L1a_g5122 : OAI31D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_193, A3 => L1a_n_225, B => L1a_n_6, ZN => L1a_n_24);
  L1a_g5123 : OAI31D0BWP7T port map(A1 => L1a_n_204, A2 => L1a_n_200, A3 => L1a_n_225, B => L1a_n_7, ZN => L1a_n_23);
  L1a_g5124 : OAI31D0BWP7T port map(A1 => L1a_n_187, A2 => L1a_n_200, A3 => L1a_n_225, B => L1a_n_1, ZN => L1a_n_22);
  L1a_g5125 : OAI31D0BWP7T port map(A1 => L1a_n_192, A2 => L1a_n_193, A3 => L1a_n_225, B => L1a_n_8, ZN => L1a_n_21);
  L1a_g5126 : OAI31D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_203, A3 => L1a_n_225, B => L1a_n_3, ZN => L1a_n_20);
  L1a_g5127 : OAI31D0BWP7T port map(A1 => L1a_n_204, A2 => L1a_n_206, A3 => L1a_n_225, B => L1a_n_0, ZN => L1a_n_19);
  L1a_g5128 : OAI31D0BWP7T port map(A1 => L1a_n_187, A2 => L1a_n_206, A3 => L1a_n_225, B => L1a_n_2, ZN => L1a_n_18);
  L1a_g5129 : OAI31D0BWP7T port map(A1 => L1a_n_192, A2 => L1a_n_203, A3 => L1a_n_225, B => L1a_n_5, ZN => L1a_n_17);
  L1a_g5130 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_186, Z => L1a_n_16);
  L1a_g5132 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_189, Z => L1a_n_14);
  L1a_g5133 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_185, Z => L1a_n_13);
  L1a_g5134 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_202, Z => L1a_n_12);
  L1a_g5135 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_184, Z => L1a_n_11);
  L1a_g5136 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_188, Z => L1a_n_10);
  L1a_g5137 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_194, Z => L1a_n_9);
  L1a_g5138 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN41_L1a_coin_memory_14, ZN => L1a_n_8);
  L1a_g5139 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN44_L1a_coin_memory_47, ZN => L1a_n_7);
  L1a_g5140 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN55_L1a_coin_memory_13, ZN => L1a_n_6);
  L1a_g5141 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN17_L1a_coin_memory_34, ZN => L1a_n_5);
  L1a_g5142 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN31_L1a_coin_memory_33, ZN => L1a_n_3);
  L1a_g5143 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN83_L1a_coin_memory_0, ZN => L1a_n_2);
  L1a_g5144 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN36_L1a_coin_memory_44, ZN => L1a_n_1);
  L1a_g5145 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => FE_PHN84_L1a_coin_memory_3, ZN => L1a_n_0);
  L1a_g9958 : IND2D1BWP7T port map(A1 => L1a_n_225, B1 => L1a_n_92, ZN => L1a_n_224);
  L1a_g9959 : ND2D1BWP7T port map(A1 => write_coin, A2 => L1a_n_180, ZN => L1a_n_225);
  L1b_g182 : AO22D0BWP7T port map(A1 => col_new_pacman(3), A2 => vc_done_in, B1 => col_request(3), B2 => FE_DBTN1_vc_done_in, Z => col_coin(3));
  L1b_g183 : AO22D0BWP7T port map(A1 => row_new_pacman(1), A2 => vc_done_in, B1 => row_request(1), B2 => FE_DBTN1_vc_done_in, Z => row_coin(1));
  L1b_g184 : AO22D0BWP7T port map(A1 => row_new_pacman(4), A2 => vc_done_in, B1 => row_request(4), B2 => FE_DBTN1_vc_done_in, Z => row_coin(4));
  L1b_g185 : AO22D0BWP7T port map(A1 => col_new_pacman(2), A2 => vc_done_in, B1 => col_request(2), B2 => FE_DBTN1_vc_done_in, Z => col_coin(2));
  L1b_g186 : AO22D0BWP7T port map(A1 => row_new_pacman(0), A2 => vc_done_in, B1 => row_request(0), B2 => FE_DBTN1_vc_done_in, Z => row_coin(0));
  L1b_g187 : AO22D0BWP7T port map(A1 => row_new_pacman(3), A2 => vc_done_in, B1 => row_request(3), B2 => FE_DBTN1_vc_done_in, Z => row_coin(3));
  L1b_g188 : AO22D0BWP7T port map(A1 => col_new_pacman(0), A2 => vc_done_in, B1 => col_request(0), B2 => FE_DBTN1_vc_done_in, Z => col_coin(0));
  L1b_g189 : AO22D0BWP7T port map(A1 => col_new_pacman(1), A2 => vc_done_in, B1 => col_request(1), B2 => FE_DBTN1_vc_done_in, Z => col_coin(1));
  L1b_g190 : AO22D0BWP7T port map(A1 => row_new_pacman(2), A2 => vc_done_in, B1 => row_request(2), B2 => FE_DBTN1_vc_done_in, Z => row_coin(2));
  L1b_g191 : AO22D0BWP7T port map(A1 => col_new_pacman(4), A2 => vc_done_in, B1 => col_request(4), B2 => FE_DBTN1_vc_done_in, Z => col_coin(4));
  L3b_g1365 : OAI21D0BWP7T port map(A1 => L3b_n_67, A2 => L3b_n_47, B => L3b_n_71, ZN => col_new_ghost2(4));
  L3b_g1368 : OAI21D0BWP7T port map(A1 => L3b_n_68, A2 => L3b_n_21, B => L3b_n_72, ZN => L3b_n_75);
  L3b_g1369 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => L3b_n_41, B1 => L3b_n_67, B2 => L3b_n_19, ZN => L3b_n_72);
  L3b_g1370 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(4), A2 => L3b_n_48, B1 => L3b_n_68, B2 => L3b_n_51, ZN => L3b_n_71);
  L3b_g1371 : OAI21D0BWP7T port map(A1 => L3b_n_62, A2 => L3b_n_51, B => L3b_n_70, ZN => col_new_ghost2(3));
  L3b_g1373 : OAI21D0BWP7T port map(A1 => L3b_n_66, A2 => L3b_n_19, B => L3b_n_69, ZN => L3b_n_74);
  L3b_g1374 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(3), A2 => L3b_n_48, B1 => L3b_n_66, B2 => L3b_n_47, ZN => L3b_n_70);
  L3b_g1375 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => L3b_n_41, B1 => L3b_n_62, B2 => L3b_n_21, ZN => L3b_n_69);
  L3b_g1377 : MAOI22D0BWP7T port map(A1 => L3b_n_61, A2 => L3b_n_38, B1 => L3b_n_61, B2 => L3b_n_38, ZN => L3b_n_68);
  L3b_g1378 : MAOI22D0BWP7T port map(A1 => L3b_n_65, A2 => L3b_n_44, B1 => L3b_n_65, B2 => L3b_n_44, ZN => L3b_n_67);
  L3b_g1379 : HA1D0BWP7T port map(A => L3b_n_40, B => L3b_n_59, CO => L3b_n_65, S => L3b_n_66);
  L3b_g1380 : OAI21D0BWP7T port map(A1 => L3b_n_60, A2 => L3b_n_47, B => L3b_n_63, ZN => col_new_ghost2(2));
  L3b_g1382 : OAI21D0BWP7T port map(A1 => L3b_n_56, A2 => L3b_n_21, B => L3b_n_64, ZN => L3b_n_76);
  L3b_g1383 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(2), A2 => L3b_n_41, B1 => L3b_n_60, B2 => L3b_n_19, ZN => L3b_n_64);
  L3b_g1384 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(2), A2 => L3b_n_48, B1 => L3b_n_56, B2 => L3b_n_51, ZN => L3b_n_63);
  L3b_g1386 : MAOI22D0BWP7T port map(A1 => L3b_n_54, A2 => L3b_n_37, B1 => L3b_n_54, B2 => L3b_n_37, ZN => L3b_n_62);
  L3b_g1387 : INR2XD0BWP7T port map(A1 => L3b_n_54, B1 => L3b_n_37, ZN => L3b_n_61);
  L3b_g1388 : HA1D0BWP7T port map(A => L3b_n_23, B => L3b_n_49, CO => L3b_n_59, S => L3b_n_60);
  L3b_g1389 : OAI21D0BWP7T port map(A1 => L3b_n_52, A2 => L3b_n_47, B => L3b_n_55, ZN => col_new_ghost2(1));
  L3b_g1390 : OAI21D0BWP7T port map(A1 => L3b_n_47, A2 => L3b_n_42, B => L3b_n_57, ZN => col_new_ghost2(0));
  L3b_g1392 : MOAI22D0BWP7T port map(A1 => L3b_n_53, A2 => L3b_n_17, B1 => row_old_ghost2(0), B2 => L3b_n_17, ZN => row_new_ghost2(0));
  L3b_g1393 : OAI21D0BWP7T port map(A1 => L3b_n_46, A2 => L3b_n_21, B => L3b_n_58, ZN => L3b_n_77);
  L3b_g1394 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(1), A2 => L3b_n_41, B1 => L3b_n_52, B2 => L3b_n_19, ZN => L3b_n_58);
  L3b_g1395 : AOI22D0BWP7T port map(A1 => L3b_n_50, A2 => L3b_n_24, B1 => col_old_ghost2(0), B2 => L3b_n_48, ZN => L3b_n_57);
  L3b_g1396 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(1), A2 => L3b_n_48, B1 => L3b_n_46, B2 => L3b_n_51, ZN => L3b_n_55);
  L3b_g1397 : MAOI22D0BWP7T port map(A1 => L3b_n_45, A2 => L3b_n_26, B1 => L3b_n_45, B2 => L3b_n_26, ZN => L3b_n_56);
  L3b_g1398 : INR2XD0BWP7T port map(A1 => L3b_n_45, B1 => L3b_n_26, ZN => L3b_n_54);
  L3b_g1399 : INVD0BWP7T port map(I => L3b_n_53, ZN => L3b_n_78);
  L3b_g1400 : AOI222D0BWP7T port map(A1 => L3b_n_24, A2 => L3b_n_20, B1 => L3b_n_43, B2 => L3b_n_18, C1 => row_old_ghost2(0), C2 => L3b_n_41, ZN => L3b_n_53);
  L3b_g1401 : CKND1BWP7T port map(I => L3b_n_51, ZN => L3b_n_50);
  L3b_g1402 : HA1D0BWP7T port map(A => L3b_n_39, B => L3b_n_43, CO => L3b_n_49, S => L3b_n_52);
  L3b_g1403 : ND3D0BWP7T port map(A1 => L3b_n_22, A2 => L3b_n_15, A3 => L3b_move(0), ZN => L3b_n_51);
  L3b_g1404 : OAI211D0BWP7T port map(A1 => L3b_n_16, A2 => L3b_n_15, B => L3b_n_17, C => L3b_n_22, ZN => L3b_n_48);
  L3b_g1405 : IND3D0BWP7T port map(A1 => L3b_move(0), B1 => L3b_move(2), B2 => L3b_n_22, ZN => L3b_n_47);
  L3b_g1406 : XNR2D1BWP7T port map(A1 => L3b_n_24, A2 => L3b_n_25, ZN => L3b_n_46);
  L3b_g1407 : NR2XD0BWP7T port map(A1 => L3b_n_24, A2 => L3b_n_25, ZN => L3b_n_45);
  L3b_g1408 : INVD0BWP7T port map(I => L3b_n_43, ZN => L3b_n_42);
  L3b_g1409 : AOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => L3b_n_15, B1 => col_old_ghost2(3), B2 => L3b_move(2), ZN => L3b_n_40);
  L3b_g1410 : AOI22D0BWP7T port map(A1 => row_old_ghost2(1), A2 => L3b_n_15, B1 => col_old_ghost2(1), B2 => L3b_move(2), ZN => L3b_n_39);
  L3b_g1411 : OAI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => L3b_move(2), B1 => col_old_ghost2(4), B2 => L3b_n_15, ZN => L3b_n_44);
  L3b_g1412 : AOI22D0BWP7T port map(A1 => row_old_ghost2(0), A2 => L3b_n_15, B1 => col_old_ghost2(0), B2 => L3b_move(2), ZN => L3b_n_43);
  L3b_g1413 : AO21D0BWP7T port map(A1 => L3b_move(3), A2 => L3b_move(1), B => L3b_n_22, Z => L3b_n_41);
  L3b_g1414 : AOI22D0BWP7T port map(A1 => row_old_ghost2(2), A2 => L3b_n_15, B1 => col_old_ghost2(2), B2 => L3b_move(2), ZN => L3b_n_23);
  L3b_g1415 : AOI22D0BWP7T port map(A1 => col_old_ghost2(4), A2 => L3b_move(0), B1 => row_old_ghost2(4), B2 => L3b_move(3), ZN => L3b_n_38);
  L3b_g1416 : AOI22D0BWP7T port map(A1 => col_old_ghost2(3), A2 => L3b_move(0), B1 => row_old_ghost2(3), B2 => L3b_move(3), ZN => L3b_n_37);
  L3b_g1417 : AOI22D0BWP7T port map(A1 => col_old_ghost2(2), A2 => L3b_move(0), B1 => row_old_ghost2(2), B2 => L3b_move(3), ZN => L3b_n_26);
  L3b_g1418 : AOI22D0BWP7T port map(A1 => col_old_ghost2(1), A2 => L3b_move(0), B1 => row_old_ghost2(1), B2 => L3b_move(3), ZN => L3b_n_25);
  L3b_g1419 : AOI22D0BWP7T port map(A1 => col_old_ghost2(0), A2 => L3b_move(0), B1 => row_old_ghost2(0), B2 => L3b_move(3), ZN => L3b_n_24);
  L3b_g1420 : CKND1BWP7T port map(I => L3b_n_21, ZN => L3b_n_20);
  L3b_g1421 : NR2D0BWP7T port map(A1 => L3b_move(3), A2 => L3b_move(1), ZN => L3b_n_22);
  L3b_g1422 : IND2D0BWP7T port map(A1 => L3b_move(1), B1 => L3b_move(3), ZN => L3b_n_21);
  L3b_g1423 : INVD1BWP7T port map(I => L3b_n_18, ZN => L3b_n_19);
  L3b_g1424 : INR2D0BWP7T port map(A1 => L3b_move(1), B1 => L3b_move(3), ZN => L3b_n_18);
  L3b_g1425 : ND2D0BWP7T port map(A1 => L3b_n_15, A2 => L3b_n_16, ZN => L3b_n_17);
  L3b_g1426 : INVD0BWP7T port map(I => L3b_move(0), ZN => L3b_n_16);
  L3b_g1427 : INVD1BWP7T port map(I => L3b_move(2), ZN => L3b_n_15);
  L3b_g2 : MUX2D0BWP7T port map(I0 => L3b_n_75, I1 => row_old_ghost2(4), S => L3b_n_17, Z => row_new_ghost2(4));
  L3b_g1428 : MUX2D0BWP7T port map(I0 => L3b_n_74, I1 => row_old_ghost2(3), S => L3b_n_17, Z => row_new_ghost2(3));
  L3b_g1429 : MUX2D0BWP7T port map(I0 => L3b_n_76, I1 => row_old_ghost2(2), S => L3b_n_17, Z => row_new_ghost2(2));
  L3b_g1430 : MUX2D0BWP7T port map(I0 => L3b_n_77, I1 => row_old_ghost2(1), S => L3b_n_17, Z => row_new_ghost2(1));
  L3b_L4_row_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_13, Q => row_old_ghost2(1));
  L3b_L4_row_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_14, Q => row_old_ghost2(2));
  L3b_L4_row_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_11, Q => row_old_ghost2(0));
  L3b_L4_row_number_out_reg_3 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_12, Q => row_old_ghost2(3));
  L3b_g620 : AO222D0BWP7T port map(A1 => L3b_n_3, A2 => L3b_n_76, B1 => L3b_n_4, B2 => FE_PHN101_row_old_ghost2_2, C1 => FE_OFN0_game_over_out, C2 => logic_1_1_net, Z => L3b_n_14);
  L3b_g621 : AO222D0BWP7T port map(A1 => L3b_n_3, A2 => L3b_n_77, B1 => L3b_n_4, B2 => FE_PHN108_row_old_ghost2_1, C1 => FE_OFN0_game_over_out, C2 => logic_0_1_net, Z => L3b_n_13);
  L3b_L4_row_number_out_reg_4 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_10, Q => row_old_ghost2(4));
  L3b_L4_column_number_out_reg_1 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_8, Q => col_old_ghost2(1));
  L3b_L4_column_number_out_reg_4 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_5, Q => col_old_ghost2(4));
  L3b_L4_column_number_out_reg_0 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_9, Q => col_old_ghost2(0));
  L3b_L4_column_number_out_reg_2 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_7, Q => col_old_ghost2(2));
  L3b_g627 : AO222D0BWP7T port map(A1 => L3b_n_3, A2 => L3b_n_74, B1 => L3b_n_4, B2 => FE_PHN79_row_old_ghost2_3, C1 => FE_OFN0_game_over_out, C2 => logic_1_1_net, Z => L3b_n_12);
  L3b_g628 : AO222D0BWP7T port map(A1 => L3b_n_3, A2 => L3b_n_78, B1 => L3b_n_4, B2 => FE_PHN103_row_old_ghost2_0, C1 => FE_OFN0_game_over_out, C2 => logic_0_1_net, Z => L3b_n_11);
  L3b_g629 : AO222D0BWP7T port map(A1 => L3b_n_3, A2 => L3b_n_75, B1 => L3b_n_4, B2 => FE_PHN107_row_old_ghost2_4, C1 => FE_OFN0_game_over_out, C2 => logic_0_1_net, Z => L3b_n_10);
  L3b_L4_column_number_out_reg_3 : DFQD1BWP7T port map(CP => CTS_12, D => L3b_n_6, Q => col_old_ghost2(3));
  L3b_g631 : AO222D0BWP7T port map(A1 => L3b_n_1, A2 => FE_PHN94_col_old_ghost2_0, B1 => L3b_n_0, B2 => col_new_ghost2(0), C1 => FE_OFN0_game_over_out, C2 => logic_0_1_net, Z => L3b_n_9);
  L3b_g632 : AO222D0BWP7T port map(A1 => L3b_n_1, A2 => FE_PHN97_col_old_ghost2_1, B1 => L3b_n_0, B2 => col_new_ghost2(1), C1 => FE_OFN0_game_over_out, C2 => logic_0_1_net, Z => L3b_n_8);
  L3b_g633 : AO222D0BWP7T port map(A1 => L3b_n_1, A2 => FE_PHN105_col_old_ghost2_2, B1 => L3b_n_0, B2 => col_new_ghost2(2), C1 => FE_OFN0_game_over_out, C2 => logic_1_1_net, Z => L3b_n_7);
  L3b_g634 : AO222D0BWP7T port map(A1 => L3b_n_1, A2 => FE_PHN102_col_old_ghost2_3, B1 => L3b_n_0, B2 => col_new_ghost2(3), C1 => FE_OFN0_game_over_out, C2 => logic_1_1_net, Z => L3b_n_6);
  L3b_g636 : AOI21D0BWP7T port map(A1 => L3b_n_2, A2 => L3b_mux_select, B => FE_OFN0_game_over_out, ZN => L3b_n_4);
  L3b_g637 : AN2D1BWP7T port map(A1 => L3b_n_0, A2 => L3b_n_2, Z => L3b_n_3);
  L3b_g638 : NR2D0BWP7T port map(A1 => L3b_move(0), A2 => L3b_move(2), ZN => L3b_n_2);
  L3b_g639 : NR2D1BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => L3b_mux_select, ZN => L3b_n_1);
  L3b_g640 : INR2D1BWP7T port map(A1 => L3b_mux_select, B1 => FE_OFN0_game_over_out, ZN => L3b_n_0);
  L3b_L1_move_out_reg_3 : LHQD1BWP7T port map(D => L3b_L1_n_22, E => L3b_L1_n_23, Q => L3b_move(3));
  L3b_L1_move_out_reg_1 : LHQD1BWP7T port map(D => L3b_L1_n_20, E => L3b_L1_n_23, Q => L3b_move(1));
  L3b_L1_move_out_reg_2 : LHQD1BWP7T port map(D => L3b_L1_n_19, E => L3b_L1_n_23, Q => L3b_move(2));
  L3b_L1_move_out_reg_0 : LHQD1BWP7T port map(D => L3b_L1_n_21, E => L3b_L1_n_23, Q => L3b_move(0));
  L3b_L1_g325 : NR2D0BWP7T port map(A1 => L3b_L1_n_24, A2 => L3b_L1_n_25, ZN => L3b_L1_n_22);
  L3b_L1_g326 : ND2D0BWP7T port map(A1 => L3b_L1_n_24, A2 => L3b_L1_state(2), ZN => L3b_L1_n_23);
  L3b_L1_g327 : NR2D0BWP7T port map(A1 => L3b_L1_n_34, A2 => L3b_L1_state(1), ZN => L3b_L1_n_21);
  L3b_L1_g328 : NR2D0BWP7T port map(A1 => L3b_L1_n_34, A2 => L3b_L1_n_26, ZN => L3b_L1_n_20);
  L3b_L1_g329 : NR3D0BWP7T port map(A1 => L3b_L1_n_26, A2 => L3b_L1_state(2), A3 => L3b_L1_state(0), ZN => L3b_L1_n_19);
  L3b_L1_g330 : ND2D1BWP7T port map(A1 => L3b_L1_n_26, A2 => L3b_L1_n_27, ZN => L3b_L1_n_24);
  L3b_L1_g331 : ND2D1BWP7T port map(A1 => L3b_L1_n_25, A2 => L3b_L1_state(0), ZN => L3b_L1_n_34);
  L3b_L1_g613 : AO21D0BWP7T port map(A1 => L3b_L1_n_36, A2 => L3b_L1_n_11, B => L3b_L1_n_15, Z => L3b_L1_n_18);
  L3b_L1_g614 : AO32D1BWP7T port map(A1 => L3b_L1_n_2, A2 => L3b_L1_n_12, A3 => L3b_L1_n_4, B1 => L3b_L1_n_36, B2 => L3b_L1_n_13, Z => L3b_L1_n_17);
  L3b_L1_g615 : AO32D1BWP7T port map(A1 => L3b_L1_n_3, A2 => L3b_L1_n_14, A3 => L3b_L1_n_4, B1 => L3b_L1_n_2, B2 => L3b_L1_n_7, Z => L3b_L1_n_16);
  L3b_L1_g616 : NR4D0BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => L3b_L1_n_34, A3 => L3b_L1_n_6, A4 => L3b_L1_n_7, ZN => L3b_L1_n_15);
  L3b_L1_g617 : INVD0BWP7T port map(I => L3b_L1_n_13, ZN => L3b_L1_n_14);
  L3b_L1_g618 : NR2D1BWP7T port map(A1 => L3b_L1_n_26, A2 => L3b_L1_n_7, ZN => L3b_L1_n_12);
  L3b_L1_g619 : IND2D1BWP7T port map(A1 => L3b_L1_n_6, B1 => L3b_L1_n_8, ZN => L3b_L1_n_13);
  L3b_L1_g620 : ND2D0BWP7T port map(A1 => L3b_L1_n_4, A2 => L3b_L1_n_8, ZN => L3b_L1_n_11);
  L3b_L1_g623 : IND3D1BWP7T port map(A1 => L3b_data_buffed(0), B1 => L3b_data_buffed(1), B2 => FE_PHN115_L3b_L1_n_0, ZN => L3b_L1_n_8);
  L3b_L1_g624 : INR4D0BWP7T port map(A1 => L3b_data_buffed(3), B1 => L3b_data_buffed(0), B2 => L3b_data_buffed(1), B3 => L3b_data_buffed(2), ZN => L3b_L1_n_7);
  L3b_L1_g625 : INR4D0BWP7T port map(A1 => L3b_data_buffed(2), B1 => L3b_data_buffed(0), B2 => L3b_data_buffed(1), B3 => L3b_data_buffed(3), ZN => L3b_L1_n_6);
  L3b_L1_g627 : IND3D1BWP7T port map(A1 => L3b_data_buffed(1), B1 => L3b_data_buffed(0), B2 => FE_PHN115_L3b_L1_n_0, ZN => L3b_L1_n_4);
  L3b_L1_g628 : NR3D0BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => L3b_L1_n_24, A3 => L3b_L1_n_25, ZN => L3b_L1_n_3);
  L3b_L1_g630 : NR2XD0BWP7T port map(A1 => FE_OFN0_game_over_out, A2 => L3b_L1_state(2), ZN => L3b_L1_n_2);
  L3b_L1_g631 : NR2XD0BWP7T port map(A1 => L3b_data_buffed(2), A2 => L3b_data_buffed(3), ZN => L3b_L1_n_0);
  L3b_L1_state_reg_2 : DFD1BWP7T port map(CP => CTS_12, D => FE_PHN119_L3b_L1_n_16, Q => L3b_L1_state(2), QN => L3b_L1_n_25);
  L3b_L1_state_reg_0 : DFD1BWP7T port map(CP => CTS_12, D => FE_PHN120_L3b_L1_n_18, Q => L3b_L1_state(0), QN => L3b_L1_n_27);
  L3b_L1_state_reg_1 : DFD1BWP7T port map(CP => CTS_12, D => FE_PHN118_L3b_L1_n_17, Q => L3b_L1_state(1), QN => L3b_L1_n_26);
  L3b_L1_g640 : OR2D1BWP7T port map(A1 => L3b_L1_n_2, A2 => L3b_L1_n_3, Z => L3b_L1_n_36);
  L3b_L0_FF1_data_out_reg_3 : DFKCNQD1BWP7T port map(CN => FE_PHN70_dir_ghost2_3, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3b_L0_data_intermediate(3));
  L3b_L0_FF1_data_out_reg_2 : DFKCNQD1BWP7T port map(CN => FE_PHN38_dir_ghost2_2, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3b_L0_data_intermediate(2));
  L3b_L0_FF1_data_out_reg_0 : DFKCNQD1BWP7T port map(CN => FE_PHN45_dir_ghost2_0, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN4_L3b_L0_data_intermediate_0);
  L3b_L0_FF1_data_out_reg_1 : DFKCNQD1BWP7T port map(CN => FE_PHN49_dir_ghost2_1, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN7_L3b_L0_data_intermediate_1);
  L3b_L0_FF2_data_out_reg_3 : DFKCNQD1BWP7T port map(CN => FE_PHN5_L3b_L0_data_intermediate_3, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => L3b_data_buffed(3));
  L3b_L0_FF2_data_out_reg_2 : DFKCNQD1BWP7T port map(CN => FE_PHN10_L3b_L0_data_intermediate_2, CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN65_L3b_data_buffed_2);
  L3b_L0_FF2_data_out_reg_0 : DFKCNQD1BWP7T port map(CN => L3b_L0_data_intermediate(0), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN96_L3b_data_buffed_0);
  L3b_L0_FF2_data_out_reg_1 : DFKCNQD1BWP7T port map(CN => L3b_L0_data_intermediate(1), CP => CTS_12, D => FE_DBTN0_game_over_out, Q => FE_PHN80_L3b_data_buffed_1);
  tie_0_cell : TIELBWP7T port map(ZN => logic_0_1_net);
  tie_1_cell : TIEHBWP7T port map(Z => logic_1_1_net);

end routed;
