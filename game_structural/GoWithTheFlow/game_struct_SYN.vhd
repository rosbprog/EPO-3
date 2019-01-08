
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of game_struct is

  component ghost_cont
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

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component AO222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; Z : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component EDFKCND1BWP7T
    port(CP, CN, D, E : in std_logic; Q, QN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component CKXOR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OA222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; Z : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AOI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component LNQD1BWP7T
    port(EN, D : in std_logic; Q : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component OA221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
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

  signal col_new_ghost2 : std_logic_vector(4 downto 0);
  signal row_new_ghost2 : std_logic_vector(4 downto 0);
  signal col_new_pacman : std_logic_vector(4 downto 0);
  signal row_old_ghost1 : std_logic_vector(4 downto 0);
  signal row_new_pacman : std_logic_vector(4 downto 0);
  signal col_old_ghost1 : std_logic_vector(4 downto 0);
  signal L3a_move : std_logic_vector(3 downto 0);
  signal col_old_pacman : std_logic_vector(4 downto 0);
  signal row_old_ghost2 : std_logic_vector(4 downto 0);
  signal col_old_ghost2 : std_logic_vector(4 downto 0);
  signal row_old_pacman : std_logic_vector(4 downto 0);
  signal L3c_move : std_logic_vector(3 downto 0);
  signal L3c_PC1_state : std_logic_vector(2 downto 0);
  signal L6a_count_int : std_logic_vector(6 downto 0);
  signal L6a_count_int2 : std_logic_vector(6 downto 0);
  signal L6a_LBL1_state : std_logic_vector(3 downto 0);
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
  signal L1a_n_225, L1b_n_0, L2_IB1_n_0, L2_IB1_n_1, L2_IB1_n_2 : std_logic;
  signal L2_IB1_n_3, L2_IB1_n_4, L2_IB1_n_5, L2_IB1_n_6, L2_IB1_n_7 : std_logic;
  signal L2_IB1_n_8, L2_IB1_n_9, L2_IB1_n_10, L2_IB1_n_11, L2_IB1_n_12 : std_logic;
  signal L2_IB2_n_0, L2_IB2_n_1, L2_IB2_n_2, L2_IB2_n_3, L2_IB2_n_4 : std_logic;
  signal L2_IB2_n_5, L2_IB2_n_6, L2_IB2_n_7, L2_IB2_n_8, L2_IB2_n_9 : std_logic;
  signal L2_IB2_n_10, L2_IB2_n_11, L2_IB2_n_12, L2_c_g1, L2_c_g2 : std_logic;
  signal L3a_L0_FF1_n_0, L3a_L0_FF2_n_0, L3a_L1_n_1, L3a_L1_n_3, L3a_L1_n_4 : std_logic;
  signal L3a_L1_n_5, L3a_L1_n_7, L3a_L1_n_9, L3a_L1_n_10, L3a_L1_n_12 : std_logic;
  signal L3a_L1_n_13, L3a_L1_n_14, L3a_L1_n_15, L3a_L1_n_16, L3a_L1_n_17 : std_logic;
  signal L3a_L1_n_19, L3a_L1_n_20, L3a_L1_n_21, L3a_L1_n_22, L3a_L1_n_23 : std_logic;
  signal L3a_L1_n_24, L3a_L1_n_25, L3a_L1_n_26, L3a_L1_n_27, L3a_L1_n_34 : std_logic;
  signal L3a_L1_n_35, L3a_L1_n_36, L3a_L1_n_37, L3a_L1_n_38, L3a_mux_select : std_logic;
  signal L3b_L0_FF1_n_0, L3b_L0_FF2_n_0, L3b_L1_n_1, L3b_L1_n_2, L3b_L1_n_3 : std_logic;
  signal L3b_L1_n_4, L3b_L1_n_5, L3b_L1_n_6, L3b_L1_n_7, L3b_L1_n_8 : std_logic;
  signal L3b_L1_n_9, L3b_L1_n_11, L3b_L1_n_12, L3b_L1_n_15, L3b_L1_n_16 : std_logic;
  signal L3b_L1_n_17, L3b_L1_n_18, L3b_L1_n_19, L3b_L1_n_20, L3b_L1_n_21 : std_logic;
  signal L3b_L1_n_22, L3b_L1_n_23, L3b_L1_n_24, L3b_L1_n_25, L3b_L1_n_26 : std_logic;
  signal L3b_L1_n_27, L3b_L1_n_34, L3b_L1_n_36, L3b_mux_select, L3b_n_0 : std_logic;
  signal L3b_n_1, L3b_n_2, L3b_n_3, L3b_n_4, L3b_n_5 : std_logic;
  signal L3b_n_6, L3b_n_7, L3b_n_8, L3b_n_9, L3b_n_10 : std_logic;
  signal L3b_n_11, L3b_n_12, L3b_n_13, L3b_n_14, L3b_n_15 : std_logic;
  signal L3b_n_16, L3b_n_17, L3b_n_18, L3b_n_19, L3b_n_20 : std_logic;
  signal L3b_n_21, L3b_n_22, L3b_n_23, L3b_n_24, L3b_n_25 : std_logic;
  signal L3b_n_26, L3b_n_27, L3b_n_28, L3b_n_29, L3b_n_30 : std_logic;
  signal L3b_n_31, L3b_n_32, L3b_n_33, L3b_n_34, L3b_n_35 : std_logic;
  signal L3b_n_36, L3b_n_37, L3b_n_38, L3b_n_39, L3b_n_40 : std_logic;
  signal L3b_n_41, L3b_n_42, L3b_n_43, L3b_n_44, L3b_n_45 : std_logic;
  signal L3b_n_46, L3b_n_47, L3b_n_48, L3b_n_49, L3b_n_50 : std_logic;
  signal L3b_n_52, L3b_n_53, L3b_n_54, L3b_n_55, L3b_n_57 : std_logic;
  signal L3b_n_58, L3b_n_59, L3b_n_60, L3b_n_62, L3b_n_63 : std_logic;
  signal L3b_n_102, L3c_PC1_n_0, L3c_PC1_n_1, L3c_PC1_n_2, L3c_PC1_n_3 : std_logic;
  signal L3c_PC1_n_4, L3c_PC1_n_5, L3c_PC1_n_7, L3c_PC1_n_8, L3c_PC1_n_9 : std_logic;
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
  signal L6a_LBL1_n_0, L6a_LBL1_n_2, L6a_LBL1_n_3, L6a_LBL1_n_4, L6a_LBL1_n_5 : std_logic;
  signal L6a_LBL1_n_6, L6a_LBL1_n_7, L6a_LBL1_n_8, L6a_LBL1_n_9, L6a_LBL1_n_10 : std_logic;
  signal L6a_LBL1_n_11, L6a_LBL1_n_13, L6a_LBL1_n_14, L6a_LBL1_n_15, L6a_LBL1_n_16 : std_logic;
  signal L6a_LBL1_n_17, L6a_LBL1_n_18, L6a_LBL1_n_19, L6a_LBL1_n_22, L6a_LBL1_n_23 : std_logic;
  signal L6a_LBL1_n_24, L6a_LBL1_n_25, L6a_LBL1_n_26, L6a_LBL1_n_27, L6a_LBL1_n_28 : std_logic;
  signal L6a_LBL1_n_30, L6a_LBL1_n_31, L6a_LBL1_n_32, L6a_LBL1_n_33, L6a_LBL1_n_34 : std_logic;
  signal L6a_LBL1_n_35, L6a_LBL1_n_36, L6a_LBL1_n_37, L6a_LBL1_n_38, L6a_LBL1_n_39 : std_logic;
  signal L6a_LBL1_n_41, L6a_LBL1_n_42, L6a_LBL1_n_43, L6a_LBL1_n_44, L6a_LBL1_n_45 : std_logic;
  signal L6a_LBL1_n_46, L6a_LBL1_n_50, L6a_LBL1_n_51, L6a_LBL1_n_52, L6a_LBL1_n_54 : std_logic;
  signal L6a_LBL1_n_55, L6a_LBL1_n_56, L6a_LBL1_n_57, L6a_LBL1_n_58, L6a_LBL1_n_59 : std_logic;
  signal L6a_LBL1_n_60, L6a_LBL1_n_61, L6a_LBL1_n_62, L6a_LBL1_n_63, L6a_LBL1_n_64 : std_logic;
  signal L6a_LBL1_n_65, L6a_LBL1_n_66, L6a_LBL1_n_67, L6a_LBL1_n_68, L6a_LBL1_n_69 : std_logic;
  signal L6a_LBL1_n_70, L6a_LBL1_n_71, L6a_LBL1_n_72, L6a_LBL1_n_73, L6a_LBL1_n_74 : std_logic;
  signal L6a_LBL1_n_75, L6a_LBL1_n_76, L6a_LBL1_n_78, L6a_LBL1_n_79, L6a_LBL1_n_80 : std_logic;
  signal L6a_LBL1_n_81, L6a_LBL1_n_86, L6a_LBL1_n_100, L6a_LBL1_n_101, L6a_LBL1_n_102 : std_logic;
  signal L6a_LBL1_n_103, L6a_LBL1_n_104, L6a_LBL1_n_105, L6a_LBL1_n_106, L6a_LBL2_n_0 : std_logic;
  signal L6a_c_rst_int, L6a_n_0, L6a_n_1, L6a_n_2, L6a_n_3 : std_logic;
  signal L6a_n_4, L6a_n_5, L6b_n_0, L6b_n_1, L6b_n_2 : std_logic;
  signal L6b_n_3, coin_present, coin_register_reset, ghost1_map_select, ghost1_ready : std_logic;
  signal ghost1_start, ghost2_start, n_0, n_1, n_2 : std_logic;
  signal n_3, n_4, n_5, n_6, n_7 : std_logic;
  signal n_8, n_9, n_10, n_11, n_12 : std_logic;
  signal n_13, n_14, n_15, n_16, n_17 : std_logic;
  signal n_18, n_19, n_20, n_21, n_22 : std_logic;
  signal n_23, n_24, n_25, n_26, n_27 : std_logic;
  signal n_28, n_29, n_30, n_31, n_32 : std_logic;
  signal n_33, n_34, n_35, n_36, n_37 : std_logic;
  signal n_38, n_39, n_40, n_41, n_42 : std_logic;
  signal n_43, n_44, n_45, n_46, n_47 : std_logic;
  signal n_48, n_49, n_50, n_51, n_52 : std_logic;
  signal n_53, n_54, n_55, n_56, n_57 : std_logic;
  signal n_58, n_59, n_60, n_61, n_62 : std_logic;
  signal n_63, n_64, n_65, n_66, n_67 : std_logic;
  signal n_68, n_69, n_70, n_71, n_72 : std_logic;
  signal n_73, n_74, n_75, n_76, n_77 : std_logic;
  signal n_78, n_79, n_80, n_81, n_82 : std_logic;
  signal n_83, n_84, n_85, n_86, n_87 : std_logic;
  signal n_88, n_89, n_90, n_91, n_92 : std_logic;
  signal n_93, n_94, n_95, n_96, n_97 : std_logic;
  signal n_98, n_99, n_100, n_101, n_102 : std_logic;
  signal n_103, n_104, n_105, n_106, n_107 : std_logic;
  signal n_108, n_109, n_110, n_111, n_112 : std_logic;
  signal n_113, n_114, n_115, n_116, n_117 : std_logic;
  signal n_118, n_119, n_120, n_121, n_122 : std_logic;
  signal n_123, n_124, n_125, n_126, n_127 : std_logic;
  signal n_128, n_129, n_130, n_131, n_132 : std_logic;
  signal n_134, n_135, n_136, n_137, n_138 : std_logic;
  signal n_139, n_140, n_141, n_142, n_143 : std_logic;
  signal n_144, n_145, n_146, n_147, n_149 : std_logic;
  signal n_150, n_151, n_152, n_153, n_154 : std_logic;
  signal n_155, n_156, n_157, n_158, n_159 : std_logic;
  signal n_160, n_161, n_162, n_163, n_164 : std_logic;
  signal n_165, n_166, n_167, n_168, n_169 : std_logic;
  signal n_170, n_171, n_172, n_173, n_174 : std_logic;
  signal n_175, n_176, n_177, n_178, n_179 : std_logic;
  signal n_180, n_181, n_182, n_183, n_184 : std_logic;
  signal n_185, n_186, n_187, n_188, n_189 : std_logic;
  signal n_190, n_191, n_192, n_193, n_194 : std_logic;
  signal n_195, n_198, n_199, n_200, n_201 : std_logic;
  signal n_202, n_204, n_205, n_206, n_207 : std_logic;
  signal n_208, n_209, n_227, pacman_map_select, pacman_ready : std_logic;
  signal pacman_start, vc_done_pulse, write_coin, zero_coins : std_logic;

begin

  L3a_L5 : ghost_cont port map(clk => clk, reset => score_reset_out, ghost_start => ghost1_start, pos_is_wall => n_204, en_cor_ghost => L3a_mux_select, ghost_ready => ghost1_ready, en_wall => ghost1_map_select);
  L3c_IS1 : input_system port map(clk => clk, reset => score_reset_out, data_input => dir_pacman, data_output => L3c_move);
  L3b_L5 : ghost_cont port map(clk => clk, reset => score_reset_out, ghost_start => ghost2_start, pos_is_wall => n_204, en_cor_ghost => L3b_mux_select, ghost_ready => L3b_n_62, en_wall => L3b_n_63);
  g5150 : OR2D4BWP7T port map(A1 => n_122, A2 => n_204, Z => cell_type(2));
  g5151 : OR2D4BWP7T port map(A1 => n_204, A2 => n_115, Z => cell_type(1));
  g5152 : AN2D4BWP7T port map(A1 => n_123, A2 => n_195, Z => cell_type(0));
  g5153 : INVD0BWP7T port map(I => n_204, ZN => n_195);
  g5154 : IND4D0BWP7T port map(A1 => n_185, B1 => n_191, B2 => n_193, B3 => n_194, ZN => n_204);
  g5155 : AOI211XD0BWP7T port map(A1 => n_181, A2 => n_162, B => n_192, C => n_183, ZN => n_194);
  g5156 : AOI222D0BWP7T port map(A1 => n_190, A2 => n_227, B1 => n_188, B2 => n_145, C1 => n_182, C2 => n_145, ZN => n_193);
  g5157 : OAI31D0BWP7T port map(A1 => n_151, A2 => n_10, A3 => n_187, B => n_189, ZN => n_192);
  g5158 : ND4D0BWP7T port map(A1 => n_179, A2 => n_155, A3 => n_137, A4 => n_145, ZN => n_191);
  g5159 : MOAI22D0BWP7T port map(A1 => n_184, A2 => n_157, B1 => n_162, B2 => n_147, ZN => n_190);
  g5160 : AOI31D0BWP7T port map(A1 => n_176, A2 => n_137, A3 => n_145, B => n_186, ZN => n_189);
  g5161 : NR4D0BWP7T port map(A1 => n_178, A2 => n_137, A3 => n_138, A4 => n_141, ZN => n_188);
  g5162 : MAOI22D0BWP7T port map(A1 => n_175, A2 => n_227, B1 => n_180, B2 => n_227, ZN => n_187);
  g5163 : NR4D0BWP7T port map(A1 => n_174, A2 => n_157, A3 => n_227, A4 => n_152, ZN => n_186);
  g5164 : NR4D0BWP7T port map(A1 => n_173, A2 => n_10, A3 => n_227, A4 => n_152, ZN => n_185);
  g5165 : OA31D1BWP7T port map(A1 => n_140, A2 => n_155, A3 => n_154, B => n_180, Z => n_184);
  g5166 : AOI211D1BWP7T port map(A1 => n_177, A2 => n_164, B => n_10, C => n_152, ZN => n_183);
  g5167 : INR4D0BWP7T port map(A1 => n_138, B1 => n_141, B2 => n_137, B3 => n_167, ZN => n_182);
  g5168 : OAI211D1BWP7T port map(A1 => n_156, A2 => n_165, B => n_177, C => n_168, ZN => n_181);
  g5169 : IAO21D0BWP7T port map(A1 => n_175, A2 => n_171, B => n_138, ZN => n_179);
  g5170 : AN4D1BWP7T port map(A1 => n_172, A2 => n_168, A3 => n_170, A4 => n_163, Z => n_180);
  g5171 : AN3D0BWP7T port map(A1 => n_169, A2 => n_164, A3 => n_165, Z => n_178);
  g5172 : INR2D0BWP7T port map(A1 => n_138, B1 => n_169, ZN => n_176);
  g5173 : IND2D1BWP7T port map(A1 => n_170, B1 => n_154, ZN => n_177);
  g5174 : OA21D0BWP7T port map(A1 => n_165, A2 => n_154, B => n_163, Z => n_174);
  g5175 : OA21D0BWP7T port map(A1 => n_166, A2 => n_153, B => n_170, Z => n_173);
  g5176 : OAI21D0BWP7T port map(A1 => n_165, A2 => n_153, B => n_168, ZN => n_175);
  g5177 : CKND1BWP7T port map(I => n_171, ZN => n_172);
  g5178 : NR2D1BWP7T port map(A1 => n_166, A2 => n_154, ZN => n_171);
  g5179 : OR2D1BWP7T port map(A1 => n_166, A2 => n_155, Z => n_170);
  g5180 : AOI21D0BWP7T port map(A1 => n_160, A2 => n_159, B => n_161, ZN => n_167);
  g5181 : ND3D0BWP7T port map(A1 => n_159, A2 => n_155, A3 => n_154, ZN => n_169);
  g5182 : IND3D1BWP7T port map(A1 => n_140, B1 => n_153, B2 => n_158, ZN => n_168);
  g5183 : ND2D1BWP7T port map(A1 => n_159, A2 => n_140, ZN => n_166);
  g5184 : IND2D1BWP7T port map(A1 => n_140, B1 => n_159, ZN => n_165);
  g5185 : IND2D1BWP7T port map(A1 => n_140, B1 => n_160, ZN => n_164);
  g5186 : ND2D1BWP7T port map(A1 => n_161, A2 => n_154, ZN => n_163);
  g5187 : NR2D1BWP7T port map(A1 => n_157, A2 => n_151, ZN => n_162);
  g5188 : NR2D1BWP7T port map(A1 => n_156, A2 => n_140, ZN => n_161);
  g5189 : INVD1BWP7T port map(I => n_158, ZN => n_159);
  g5190 : ND2D1BWP7T port map(A1 => n_154, A2 => n_156, ZN => n_160);
  g5191 : OAI211D1BWP7T port map(A1 => n_135, A2 => n_146, B => n_150, C => n_147, ZN => n_158);
  g5193 : ND2D1BWP7T port map(A1 => n_149, A2 => n_141, ZN => n_157);
  g5194 : INVD1BWP7T port map(I => n_156, ZN => n_155);
  g5195 : INVD0BWP7T port map(I => n_154, ZN => n_153);
  g5196 : MOAI22D0BWP7T port map(A1 => n_146, A2 => n_116, B1 => n_146, B2 => n_116, ZN => n_156);
  g5197 : MAOI22D0BWP7T port map(A1 => n_146, A2 => n_124, B1 => n_146, B2 => n_124, ZN => n_154);
  g5198 : INVD0BWP7T port map(I => n_152, ZN => n_151);
  g5199 : ND2D1BWP7T port map(A1 => n_146, A2 => n_135, ZN => n_150);
  g5200 : MOAI22D0BWP7T port map(A1 => n_145, A2 => n_126, B1 => n_145, B2 => n_126, ZN => n_152);
  g5202 : MOAI22D0BWP7T port map(A1 => n_145, A2 => n_125, B1 => n_145, B2 => n_125, ZN => n_149);
  g5204 : ND2D1BWP7T port map(A1 => n_144, A2 => n_140, ZN => n_147);
  g5205 : AOI21D0BWP7T port map(A1 => n_140, A2 => n_135, B => n_144, ZN => n_146);
  g5206 : AOI221D0BWP7T port map(A1 => col_new_ghost2(4), A2 => n_34, B1 => n_11, B2 => col_request(4), C => n_142, ZN => n_145);
  g5207 : ND2D1BWP7T port map(A1 => n_143, A2 => n_102, ZN => n_144);
  g5208 : AOI222D0BWP7T port map(A1 => n_205, A2 => n_96, B1 => row_new_ghost2(4), B2 => n_34, C1 => n_11, C2 => row_request(4), ZN => n_143);
  g5209 : AO22D0BWP7T port map(A1 => n_202, A2 => n_68, B1 => n_66, B2 => col_new_pacman(4), Z => n_142);
  g5210 : AOI221D0BWP7T port map(A1 => col_new_ghost2(3), A2 => n_34, B1 => n_11, B2 => col_request(3), C => n_136, ZN => n_141);
  g5211 : AO221D0BWP7T port map(A1 => row_old_ghost1(3), A2 => n_95, B1 => row_new_pacman(3), B2 => n_66, C => n_139, Z => n_140);
  g5212 : AO222D0BWP7T port map(A1 => row_new_ghost2(3), A2 => n_34, B1 => n_206, B2 => n_96, C1 => n_11, C2 => row_request(3), Z => n_139);
  g5213 : OAI222D0BWP7T port map(A1 => n_130, A2 => n_100, B1 => n_101, B2 => n_132, C1 => n_94, C2 => n_24, ZN => n_202);
  g5214 : OAI222D0BWP7T port map(A1 => n_130, A2 => n_35, B1 => n_37, B2 => n_132, C1 => n_69, C2 => n_21, ZN => n_205);
  g5215 : AO22D0BWP7T port map(A1 => n_201, A2 => n_68, B1 => n_66, B2 => col_new_pacman(3), Z => n_136);
  g5216 : MOAI22D0BWP7T port map(A1 => n_134, A2 => n_126, B1 => n_134, B2 => n_126, ZN => n_138);
  g5217 : MOAI22D0BWP7T port map(A1 => n_134, A2 => n_125, B1 => n_134, B2 => n_125, ZN => n_137);
  g5219 : AO221D0BWP7T port map(A1 => row_old_ghost1(2), A2 => n_95, B1 => row_new_pacman(2), B2 => n_66, C => n_131, Z => n_135);
  g5220 : AOI221D0BWP7T port map(A1 => col_new_ghost2(2), A2 => n_34, B1 => n_11, B2 => col_request(2), C => n_129, ZN => n_134);
  g5221 : OAI222D0BWP7T port map(A1 => n_128, A2 => n_35, B1 => n_37, B2 => n_120, C1 => n_69, C2 => n_18, ZN => n_206);
  g5222 : OAI222D0BWP7T port map(A1 => n_128, A2 => n_100, B1 => n_101, B2 => n_120, C1 => n_94, C2 => n_23, ZN => n_201);
  g5223 : AO222D0BWP7T port map(A1 => row_new_ghost2(2), A2 => n_34, B1 => n_207, B2 => n_96, C1 => n_11, C2 => row_request(2), Z => n_131);
  g5224 : MAOI22D0BWP7T port map(A1 => n_117, A2 => n_80, B1 => n_117, B2 => n_80, ZN => n_132);
  g5225 : AO22D0BWP7T port map(A1 => n_198, A2 => n_68, B1 => n_66, B2 => col_new_pacman(2), Z => n_129);
  g5226 : MAOI22D0BWP7T port map(A1 => n_127, A2 => n_78, B1 => n_127, B2 => n_78, ZN => n_130);
  g5227 : HA1D0BWP7T port map(A => n_60, B => n_104, CO => n_127, S => n_128);
  g5228 : AOI221D0BWP7T port map(A1 => col_new_ghost2(1), A2 => n_34, B1 => n_11, B2 => col_request(1), C => n_119, ZN => n_126);
  g5229 : AOI221D0BWP7T port map(A1 => col_new_ghost2(0), A2 => n_34, B1 => n_11, B2 => col_request(0), C => n_118, ZN => n_125);
  g5230 : AO221D0BWP7T port map(A1 => row_old_ghost1(1), A2 => n_95, B1 => row_new_pacman(1), B2 => n_66, C => n_121, Z => n_124);
  g5231 : OAI222D0BWP7T port map(A1 => n_108, A2 => n_35, B1 => n_37, B2 => n_107, C1 => n_69, C2 => n_32, ZN => n_207);
  g5232 : OAI222D0BWP7T port map(A1 => n_108, A2 => n_100, B1 => n_101, B2 => n_107, C1 => n_94, C2 => n_22, ZN => n_198);
  g5233 : OAI21D0BWP7T port map(A1 => n_113, A2 => n_110, B => n_109, ZN => n_123);
  g5234 : AN3D1BWP7T port map(A1 => coin_present, A2 => n_114, A3 => n_109, Z => n_122);
  g5235 : AO222D0BWP7T port map(A1 => row_new_ghost2(1), A2 => n_34, B1 => n_208, B2 => n_96, C1 => n_11, C2 => row_request(1), Z => n_121);
  g5236 : AO22D0BWP7T port map(A1 => n_199, A2 => n_68, B1 => n_66, B2 => col_new_pacman(1), Z => n_119);
  g5237 : AO22D0BWP7T port map(A1 => n_200, A2 => n_68, B1 => n_66, B2 => col_new_pacman(0), Z => n_118);
  g5238 : MAOI22D0BWP7T port map(A1 => n_105, A2 => n_76, B1 => n_105, B2 => n_76, ZN => n_120);
  g5239 : INR2XD0BWP7T port map(A1 => n_105, B1 => n_76, ZN => n_117);
  g5240 : INR2XD0BWP7T port map(A1 => n_109, B1 => n_114, ZN => n_115);
  g5241 : AO221D0BWP7T port map(A1 => row_old_ghost1(0), A2 => n_95, B1 => row_new_pacman(0), B2 => n_66, C => n_112, Z => n_116);
  g5242 : NR2D0BWP7T port map(A1 => coin_present, A2 => n_111, ZN => n_113);
  g5243 : AO222D0BWP7T port map(A1 => n_209, A2 => n_96, B1 => row_new_ghost2(0), B2 => n_34, C1 => n_11, C2 => row_request(0), Z => n_112);
  g5244 : NR2XD0BWP7T port map(A1 => n_111, A2 => n_110, ZN => n_114);
  g5245 : OAI21D0BWP7T port map(A1 => n_101, A2 => n_71, B => n_106, ZN => n_200);
  g5246 : OAI222D0BWP7T port map(A1 => n_97, A2 => n_35, B1 => n_37, B2 => n_92, C1 => n_69, C2 => n_19, ZN => n_208);
  g5247 : OAI222D0BWP7T port map(A1 => n_97, A2 => n_100, B1 => n_101, B2 => n_92, C1 => n_94, C2 => n_25, ZN => n_199);
  g5248 : NR4D0BWP7T port map(A1 => n_91, A2 => n_90, A3 => n_83, A4 => n_53, ZN => n_111);
  g5249 : NR4D0BWP7T port map(A1 => n_103, A2 => n_82, A3 => n_43, A4 => n_45, ZN => n_110);
  g5250 : ND4D0BWP7T port map(A1 => n_88, A2 => n_89, A3 => n_84, A4 => n_47, ZN => n_109);
  g5251 : AOI22D0BWP7T port map(A1 => n_99, A2 => n_73, B1 => col_old_ghost1(0), B2 => n_93, ZN => n_106);
  g5252 : AOI21D0BWP7T port map(A1 => n_86, A2 => n_79, B => n_104, ZN => n_108);
  g5253 : MAOI22D0BWP7T port map(A1 => n_85, A2 => n_75, B1 => n_85, B2 => n_75, ZN => n_107);
  g5254 : INR2XD0BWP7T port map(A1 => n_85, B1 => n_75, ZN => n_105);
  g5255 : NR2XD0BWP7T port map(A1 => n_86, A2 => n_79, ZN => n_104);
  g5256 : OAI221D0BWP7T port map(A1 => col_old_ghost1(3), A2 => n_29, B1 => col_request(3), B2 => n_23, C => n_98, ZN => n_103);
  g5257 : AOI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => n_95, B1 => row_new_pacman(4), B2 => n_66, ZN => n_102);
  g5258 : OAI222D0BWP7T port map(A1 => n_72, A2 => n_35, B1 => n_37, B2 => n_71, C1 => n_69, C2 => n_20, ZN => n_209);
  g5259 : ND3D0BWP7T port map(A1 => n_38, A2 => n_26, A3 => L3a_move(0), ZN => n_101);
  g5260 : CKND1BWP7T port map(I => n_100, ZN => n_99);
  g5261 : NR4D0BWP7T port map(A1 => n_81, A2 => n_41, A3 => n_64, A4 => n_63, ZN => n_98);
  g5262 : IND3D0BWP7T port map(A1 => L3a_move(0), B1 => L3a_move(2), B2 => n_38, ZN => n_100);
  g5263 : INVD0BWP7T port map(I => n_93, ZN => n_94);
  g5264 : OA21D0BWP7T port map(A1 => n_73, A2 => n_77, B => n_86, Z => n_97);
  g5265 : AN2D1BWP7T port map(A1 => n_87, A2 => n_68, Z => n_96);
  g5266 : NR2D1BWP7T port map(A1 => n_87, A2 => n_67, ZN => n_95);
  g5267 : OAI211D0BWP7T port map(A1 => n_27, A2 => n_26, B => n_39, C => n_38, ZN => n_93);
  g5268 : ND4D0BWP7T port map(A1 => n_62, A2 => n_65, A3 => n_55, A4 => n_56, ZN => n_91);
  g5269 : ND3D0BWP7T port map(A1 => n_54, A2 => n_48, A3 => n_46, ZN => n_90);
  g5270 : NR3D0BWP7T port map(A1 => n_44, A2 => n_49, A3 => n_52, ZN => n_89);
  g5271 : NR4D0BWP7T port map(A1 => n_51, A2 => n_61, A3 => n_57, A4 => n_58, ZN => n_88);
  g5272 : MAOI22D0BWP7T port map(A1 => n_74, A2 => n_71, B1 => n_74, B2 => n_71, ZN => n_92);
  g5273 : CKND1BWP7T port map(I => n_39, ZN => n_87);
  g5274 : AOI211XD0BWP7T port map(A1 => col_old_pacman(2), A2 => n_28, B => n_59, C => n_33, ZN => n_84);
  g5275 : ND2D1BWP7T port map(A1 => n_77, A2 => n_73, ZN => n_86);
  g5276 : NR2XD0BWP7T port map(A1 => n_70, A2 => n_74, ZN => n_85);
  g5277 : OAI211D1BWP7T port map(A1 => n_14, A2 => row_old_ghost2(1), B => n_50, C => n_36, ZN => n_83);
  g5278 : OAI221D0BWP7T port map(A1 => row_old_ghost1(0), A2 => n_16, B1 => row_request(0), B2 => n_20, C => n_42, ZN => n_82);
  g5279 : OAI221D0BWP7T port map(A1 => row_old_ghost1(1), A2 => n_14, B1 => row_request(1), B2 => n_19, C => n_40, ZN => n_81);
  g5280 : INVD0BWP7T port map(I => n_73, ZN => n_72);
  g5281 : INVD0BWP7T port map(I => n_70, ZN => n_71);
  g5282 : INVD1BWP7T port map(I => n_67, ZN => n_68);
  g5283 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(1), A2 => n_31, B1 => col_old_ghost2(1), B2 => n_31, ZN => n_65);
  g5284 : OAI22D0BWP7T port map(A1 => col_old_ghost1(2), A2 => n_28, B1 => n_22, B2 => col_request(2), ZN => n_64);
  g5285 : MOAI22D0BWP7T port map(A1 => n_24, A2 => col_request(4), B1 => n_24, B2 => col_request(4), ZN => n_63);
  g5286 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(3), A2 => n_29, B1 => col_old_ghost2(3), B2 => n_29, ZN => n_62);
  g5287 : MOAI22D0BWP7T port map(A1 => col_old_pacman(1), A2 => n_31, B1 => col_old_pacman(1), B2 => n_31, ZN => n_61);
  g5288 : OR2D1BWP7T port map(A1 => zero_coins, A2 => score_reset_out, Z => coin_register_reset);
  g5289 : AOI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => L3a_move(3), B1 => col_old_ghost1(4), B2 => L3a_move(0), ZN => n_80);
  g5290 : AOI22D0BWP7T port map(A1 => row_old_ghost1(3), A2 => n_26, B1 => col_old_ghost1(3), B2 => L3a_move(2), ZN => n_60);
  g5291 : OAI22D0BWP7T port map(A1 => n_32, A2 => L3a_move(2), B1 => n_22, B2 => n_26, ZN => n_79);
  g5292 : OAI22D0BWP7T port map(A1 => row_old_ghost1(4), A2 => L3a_move(2), B1 => col_old_ghost1(4), B2 => n_26, ZN => n_78);
  g5293 : AOI22D0BWP7T port map(A1 => row_old_ghost1(1), A2 => n_26, B1 => col_old_ghost1(1), B2 => L3a_move(2), ZN => n_77);
  g5294 : AOI22D0BWP7T port map(A1 => row_old_ghost1(3), A2 => L3a_move(3), B1 => col_old_ghost1(3), B2 => L3a_move(0), ZN => n_76);
  g5295 : AOI22D0BWP7T port map(A1 => row_old_ghost1(2), A2 => L3a_move(3), B1 => col_old_ghost1(2), B2 => L3a_move(0), ZN => n_75);
  g5296 : AOI22D0BWP7T port map(A1 => row_old_ghost1(1), A2 => L3a_move(3), B1 => col_old_ghost1(1), B2 => L3a_move(0), ZN => n_74);
  g5297 : AOI22D0BWP7T port map(A1 => row_old_ghost1(0), A2 => n_26, B1 => col_old_ghost1(0), B2 => L3a_move(2), ZN => n_73);
  g5298 : AOI22D0BWP7T port map(A1 => row_old_ghost1(0), A2 => L3a_move(3), B1 => col_old_ghost1(0), B2 => L3a_move(0), ZN => n_70);
  g5299 : AOI21D0BWP7T port map(A1 => L3a_move(3), A2 => L3a_move(1), B => n_38, ZN => n_69);
  g5300 : IND3D1BWP7T port map(A1 => pacman_map_select, B1 => ghost1_map_select, B2 => vc_done_in, ZN => n_67);
  g5301 : AN3D1BWP7T port map(A1 => pacman_map_select, A2 => vc_done_in, A3 => ghost1_map_select, Z => n_66);
  g5302 : MOAI22D0BWP7T port map(A1 => col_old_pacman(4), A2 => n_12, B1 => col_old_pacman(4), B2 => n_12, ZN => n_59);
  g5303 : MOAI22D0BWP7T port map(A1 => row_old_pacman(3), A2 => n_30, B1 => row_old_pacman(3), B2 => n_30, ZN => n_58);
  g5304 : MOAI22D0BWP7T port map(A1 => col_old_pacman(3), A2 => n_29, B1 => col_old_pacman(3), B2 => n_29, ZN => n_57);
  g5305 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => n_30, B1 => row_old_ghost2(3), B2 => n_30, ZN => n_56);
  g5306 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(0), A2 => n_16, B1 => row_old_ghost2(0), B2 => n_16, ZN => n_55);
  g5307 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(2), A2 => n_28, B1 => col_old_ghost2(2), B2 => n_28, ZN => n_54);
  g5308 : MOAI22D0BWP7T port map(A1 => col_old_ghost2(0), A2 => n_17, B1 => col_old_ghost2(0), B2 => n_17, ZN => n_53);
  g5309 : MOAI22D0BWP7T port map(A1 => row_old_pacman(4), A2 => n_15, B1 => row_old_pacman(4), B2 => n_15, ZN => n_52);
  g5310 : MOAI22D0BWP7T port map(A1 => col_old_pacman(0), A2 => n_17, B1 => col_old_pacman(0), B2 => n_17, ZN => n_51);
  g5311 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(4), A2 => n_12, B1 => col_old_ghost2(4), B2 => n_12, ZN => n_50);
  g5312 : MOAI22D0BWP7T port map(A1 => row_old_pacman(2), A2 => n_13, B1 => row_old_pacman(2), B2 => n_13, ZN => n_49);
  g5313 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => n_15, B1 => row_old_ghost2(4), B2 => n_15, ZN => n_48);
  g5314 : MAOI22D0BWP7T port map(A1 => row_old_pacman(0), A2 => n_16, B1 => row_old_pacman(0), B2 => n_16, ZN => n_47);
  g5315 : MAOI22D0BWP7T port map(A1 => row_old_ghost2(2), A2 => n_13, B1 => row_old_ghost2(2), B2 => n_13, ZN => n_46);
  g5316 : OAI22D0BWP7T port map(A1 => col_old_ghost1(1), A2 => n_31, B1 => n_25, B2 => col_request(1), ZN => n_45);
  g5317 : MOAI22D0BWP7T port map(A1 => row_old_pacman(1), A2 => n_14, B1 => row_old_pacman(1), B2 => n_14, ZN => n_44);
  g5318 : MOAI22D0BWP7T port map(A1 => col_old_ghost1(0), A2 => n_17, B1 => col_old_ghost1(0), B2 => n_17, ZN => n_43);
  g5319 : MAOI22D0BWP7T port map(A1 => n_18, A2 => row_request(3), B1 => n_18, B2 => row_request(3), ZN => n_42);
  g5320 : MOAI22D0BWP7T port map(A1 => n_21, A2 => row_request(4), B1 => n_21, B2 => row_request(4), ZN => n_41);
  g5321 : MAOI22D0BWP7T port map(A1 => n_32, A2 => row_request(2), B1 => n_32, B2 => row_request(2), ZN => n_40);
  g5322 : ND2D1BWP7T port map(A1 => row_old_ghost2(1), A2 => n_14, ZN => n_36);
  g5323 : ND2D0BWP7T port map(A1 => n_26, A2 => n_27, ZN => n_39);
  g5324 : NR2D0BWP7T port map(A1 => L3a_move(3), A2 => L3a_move(1), ZN => n_38);
  g5325 : IND2D0BWP7T port map(A1 => L3a_move(1), B1 => L3a_move(3), ZN => n_37);
  g5326 : NR2D0BWP7T port map(A1 => col_old_pacman(2), A2 => n_28, ZN => n_33);
  g5327 : OR2D4BWP7T port map(A1 => game_over_out, A2 => reset, Z => score_reset_out);
  g5328 : IND2D0BWP7T port map(A1 => L3a_move(3), B1 => L3a_move(1), ZN => n_35);
  g5329 : NR2D1BWP7T port map(A1 => n_11, A2 => ghost1_map_select, ZN => n_34);
  g5331 : INVD1BWP7T port map(I => col_request(1), ZN => n_31);
  g5332 : INVD1BWP7T port map(I => row_request(3), ZN => n_30);
  g5333 : INVD1BWP7T port map(I => col_request(3), ZN => n_29);
  g5334 : INVD1BWP7T port map(I => col_request(2), ZN => n_28);
  g5335 : CKND1BWP7T port map(I => L3a_move(0), ZN => n_27);
  g5336 : INVD1BWP7T port map(I => L3a_move(2), ZN => n_26);
  g5345 : INVD1BWP7T port map(I => col_request(0), ZN => n_17);
  g5346 : INVD1BWP7T port map(I => row_request(0), ZN => n_16);
  g5347 : INVD1BWP7T port map(I => row_request(4), ZN => n_15);
  g5348 : INVD1BWP7T port map(I => row_request(1), ZN => n_14);
  g5349 : INVD1BWP7T port map(I => row_request(2), ZN => n_13);
  g5350 : INVD1BWP7T port map(I => col_request(4), ZN => n_12);
  g5351 : INVD1BWP7T port map(I => vc_done_in, ZN => n_11);
  g2 : IND2D1BWP7T port map(A1 => n_149, B1 => n_141, ZN => n_10);
  g1454 : AO221D0BWP7T port map(A1 => n_206, A2 => n_3, B1 => row_old_ghost1(3), B2 => n_2, C => score_reset_out, Z => n_9);
  g1455 : AO221D0BWP7T port map(A1 => n_209, A2 => n_3, B1 => row_old_ghost1(0), B2 => n_2, C => score_reset_out, Z => n_8);
  g1456 : AO221D0BWP7T port map(A1 => n_208, A2 => n_3, B1 => row_old_ghost1(1), B2 => n_2, C => score_reset_out, Z => n_7);
  L3a_L4_column_number_out_reg_0 : DFQD1BWP7T port map(CP => clk, D => n_4, Q => col_old_ghost1(0));
  g1462 : AO221D0BWP7T port map(A1 => col_old_ghost1(1), A2 => n_0, B1 => n_199, B2 => L3a_mux_select, C => score_reset_out, Z => n_6);
  g1463 : AO221D0BWP7T port map(A1 => col_old_ghost1(3), A2 => n_0, B1 => n_201, B2 => L3a_mux_select, C => score_reset_out, Z => n_5);
  g1464 : AO221D0BWP7T port map(A1 => col_old_ghost1(0), A2 => n_0, B1 => n_200, B2 => L3a_mux_select, C => score_reset_out, Z => n_4);
  g1465 : INVD0BWP7T port map(I => n_3, ZN => n_2);
  g1466 : NR3D0BWP7T port map(A1 => L3a_move(0), A2 => L3a_move(2), A3 => n_0, ZN => n_3);
  g1467 : INVD1BWP7T port map(I => score_reset_out, ZN => n_1);
  g1468 : INVD1BWP7T port map(I => L3a_mux_select, ZN => n_0);
  g5352 : XNR2D1BWP7T port map(A1 => n_145, A2 => n_134, ZN => n_227);
  L3a_L4_row_number_out_reg_2 : EDFKCND1BWP7T port map(CP => clk, CN => n_1, D => n_207, E => n_3, Q => row_old_ghost1(2), QN => n_32);
  L3a_L4_column_number_out_reg_1 : DFD1BWP7T port map(CP => clk, D => n_6, Q => col_old_ghost1(1), QN => n_25);
  L3a_L4_column_number_out_reg_4 : EDFKCND1BWP7T port map(CP => clk, CN => n_1, D => n_202, E => L3a_mux_select, Q => col_old_ghost1(4), QN => n_24);
  L3a_L4_column_number_out_reg_3 : DFD1BWP7T port map(CP => clk, D => n_5, Q => col_old_ghost1(3), QN => n_23);
  L3a_L4_column_number_out_reg_2 : EDFKCND1BWP7T port map(CP => clk, CN => n_1, D => n_198, E => L3a_mux_select, Q => col_old_ghost1(2), QN => n_22);
  L3a_L4_row_number_out_reg_4 : EDFKCND1BWP7T port map(CP => clk, CN => n_1, D => n_205, E => n_3, Q => row_old_ghost1(4), QN => n_21);
  L3a_L4_row_number_out_reg_0 : DFD1BWP7T port map(CP => clk, D => n_8, Q => row_old_ghost1(0), QN => n_20);
  L3a_L4_row_number_out_reg_1 : DFD1BWP7T port map(CP => clk, D => n_7, Q => row_old_ghost1(1), QN => n_19);
  L3a_L4_row_number_out_reg_3 : DFD1BWP7T port map(CP => clk, D => n_9, Q => row_old_ghost1(3), QN => n_18);
  L3c_g1374 : OAI21D0BWP7T port map(A1 => L3c_n_58, A2 => L3c_n_43, B => L3c_n_59, ZN => col_new_pacman(4));
  L3c_g1375 : OAI222D0BWP7T port map(A1 => L3c_n_57, A2 => L3c_n_31, B1 => L3c_n_30, B2 => L3c_n_58, C1 => L3c_n_38, C2 => L3c_n_15, ZN => row_new_pacman(4));
  L3c_g1376 : MAOI22D0BWP7T port map(A1 => col_old_pacman(4), A2 => L3c_n_41, B1 => L3c_n_57, B2 => L3c_n_40, ZN => L3c_n_59);
  L3c_g1377 : OAI222D0BWP7T port map(A1 => L3c_n_55, A2 => L3c_n_31, B1 => L3c_n_30, B2 => L3c_n_52, C1 => L3c_n_38, C2 => L3c_n_16, ZN => row_new_pacman(3));
  L3c_g1378 : OAI21D0BWP7T port map(A1 => L3c_n_55, A2 => L3c_n_40, B => L3c_n_56, ZN => col_new_pacman(3));
  L3c_g1379 : MAOI22D0BWP7T port map(A1 => L3c_n_50, A2 => L3c_n_24, B1 => L3c_n_50, B2 => L3c_n_24, ZN => L3c_n_58);
  L3c_g1380 : MAOI22D0BWP7T port map(A1 => col_old_pacman(3), A2 => L3c_n_41, B1 => L3c_n_52, B2 => L3c_n_43, ZN => L3c_n_56);
  L3c_g1381 : MAOI22D0BWP7T port map(A1 => L3c_n_54, A2 => L3c_n_28, B1 => L3c_n_54, B2 => L3c_n_28, ZN => L3c_n_57);
  L3c_g1382 : HA1D0BWP7T port map(A => L3c_n_25, B => L3c_n_46, CO => L3c_n_54, S => L3c_n_55);
  L3c_g1383 : OAI21D0BWP7T port map(A1 => L3c_n_48, A2 => L3c_n_30, B => L3c_n_51, ZN => row_new_pacman(2));
  L3c_g1384 : OAI21D0BWP7T port map(A1 => L3c_n_48, A2 => L3c_n_43, B => L3c_n_53, ZN => col_new_pacman(2));
  L3c_g1385 : AOI22D0BWP7T port map(A1 => L3c_n_49, A2 => L3c_n_39, B1 => col_old_pacman(2), B2 => L3c_n_41, ZN => L3c_n_53);
  L3c_g1386 : AOI22D0BWP7T port map(A1 => L3c_n_49, A2 => L3c_n_32, B1 => row_old_pacman(2), B2 => L3c_n_37, ZN => L3c_n_51);
  L3c_g1387 : MAOI22D0BWP7T port map(A1 => L3c_n_45, A2 => L3c_n_22, B1 => L3c_n_45, B2 => L3c_n_22, ZN => L3c_n_52);
  L3c_g1388 : INR2XD0BWP7T port map(A1 => L3c_n_45, B1 => L3c_n_22, ZN => L3c_n_50);
  L3c_g1389 : OAI21D0BWP7T port map(A1 => L3c_n_35, A2 => L3c_n_43, B => L3c_n_47, ZN => col_new_pacman(1));
  L3c_g1390 : AO222D0BWP7T port map(A1 => L3c_n_39, A2 => L3c_n_26, B1 => L3c_n_42, B2 => L3c_n_20, C1 => col_old_pacman(0), C2 => L3c_n_41, Z => col_new_pacman(0));
  L3c_g1391 : AO221D0BWP7T port map(A1 => L3c_n_36, A2 => L3c_n_32, B1 => row_old_pacman(1), B2 => L3c_n_37, C => L3c_n_44, Z => row_new_pacman(1));
  L3c_g1392 : AO222D0BWP7T port map(A1 => L3c_n_32, A2 => L3c_n_26, B1 => L3c_n_13, B2 => L3c_n_20, C1 => row_old_pacman(0), C2 => L3c_n_37, Z => row_new_pacman(0));
  L3c_g1393 : AO21D0BWP7T port map(A1 => L3c_n_34, A2 => L3c_n_29, B => L3c_n_46, Z => L3c_n_49);
  L3c_g1394 : AOI22D0BWP7T port map(A1 => L3c_n_36, A2 => L3c_n_39, B1 => col_old_pacman(1), B2 => L3c_n_41, ZN => L3c_n_47);
  L3c_g1395 : MAOI22D0BWP7T port map(A1 => L3c_n_33, A2 => L3c_n_23, B1 => L3c_n_33, B2 => L3c_n_23, ZN => L3c_n_48);
  L3c_g1396 : NR2XD0BWP7T port map(A1 => L3c_n_34, A2 => L3c_n_29, ZN => L3c_n_46);
  L3c_g1397 : NR2D1BWP7T port map(A1 => L3c_n_35, A2 => L3c_n_30, ZN => L3c_n_44);
  L3c_g1398 : INR2XD0BWP7T port map(A1 => L3c_n_33, B1 => L3c_n_23, ZN => L3c_n_45);
  L3c_g1399 : CKND1BWP7T port map(I => L3c_n_43, ZN => L3c_n_42);
  L3c_g1400 : ND3D0BWP7T port map(A1 => L3c_n_19, A2 => L3c_n_14, A3 => L3c_move(0), ZN => L3c_n_43);
  L3c_g1401 : CKND1BWP7T port map(I => L3c_n_39, ZN => L3c_n_40);
  L3c_g1402 : OAI211D0BWP7T port map(A1 => L3c_n_14, A2 => L3c_n_17, B => L3c_n_18, C => L3c_n_19, ZN => L3c_n_41);
  L3c_g1403 : INR3D0BWP7T port map(A1 => L3c_n_19, B1 => L3c_move(0), B2 => L3c_n_14, ZN => L3c_n_39);
  L3c_g1404 : INVD0BWP7T port map(I => L3c_n_38, ZN => L3c_n_37);
  L3c_g1405 : AOI211D0BWP7T port map(A1 => L3c_move(3), A2 => L3c_move(1), B => L3c_n_19, C => L3c_n_18, ZN => L3c_n_38);
  L3c_g1406 : OAI21D0BWP7T port map(A1 => L3c_n_26, A2 => L3c_n_27, B => L3c_n_34, ZN => L3c_n_36);
  L3c_g1407 : XNR2D1BWP7T port map(A1 => L3c_n_20, A2 => L3c_n_21, ZN => L3c_n_35);
  L3c_g1408 : ND2D1BWP7T port map(A1 => L3c_n_27, A2 => L3c_n_26, ZN => L3c_n_34);
  L3c_g1409 : NR2XD0BWP7T port map(A1 => L3c_n_20, A2 => L3c_n_21, ZN => L3c_n_33);
  L3c_g1410 : INVD0BWP7T port map(I => L3c_n_32, ZN => L3c_n_31);
  L3c_g1411 : INVD1BWP7T port map(I => L3c_n_13, ZN => L3c_n_30);
  L3c_g1412 : INR3D0BWP7T port map(A1 => L3c_move(1), B1 => L3c_move(3), B2 => L3c_n_18, ZN => L3c_n_32);
  L3c_g1414 : AOI22D0BWP7T port map(A1 => row_old_pacman(3), A2 => L3c_n_14, B1 => col_old_pacman(3), B2 => L3c_move(2), ZN => L3c_n_25);
  L3c_g1415 : AO22D0BWP7T port map(A1 => row_old_pacman(2), A2 => L3c_n_14, B1 => L3c_move(2), B2 => col_old_pacman(2), Z => L3c_n_29);
  L3c_g1416 : OAI22D0BWP7T port map(A1 => row_old_pacman(4), A2 => L3c_move(2), B1 => col_old_pacman(4), B2 => L3c_n_14, ZN => L3c_n_28);
  L3c_g1417 : AOI22D0BWP7T port map(A1 => row_old_pacman(1), A2 => L3c_n_14, B1 => col_old_pacman(1), B2 => L3c_move(2), ZN => L3c_n_27);
  L3c_g1418 : AOI22D0BWP7T port map(A1 => row_old_pacman(0), A2 => L3c_n_14, B1 => col_old_pacman(0), B2 => L3c_move(2), ZN => L3c_n_26);
  L3c_g1419 : AOI22D0BWP7T port map(A1 => row_old_pacman(4), A2 => L3c_move(3), B1 => col_old_pacman(4), B2 => L3c_move(0), ZN => L3c_n_24);
  L3c_g1420 : AOI22D0BWP7T port map(A1 => row_old_pacman(2), A2 => L3c_move(3), B1 => col_old_pacman(2), B2 => L3c_move(0), ZN => L3c_n_23);
  L3c_g1421 : AOI22D0BWP7T port map(A1 => row_old_pacman(3), A2 => L3c_move(3), B1 => col_old_pacman(3), B2 => L3c_move(0), ZN => L3c_n_22);
  L3c_g1422 : AOI22D0BWP7T port map(A1 => row_old_pacman(1), A2 => L3c_move(3), B1 => col_old_pacman(1), B2 => L3c_move(0), ZN => L3c_n_21);
  L3c_g1423 : AOI22D0BWP7T port map(A1 => row_old_pacman(0), A2 => L3c_move(3), B1 => col_old_pacman(0), B2 => L3c_move(0), ZN => L3c_n_20);
  L3c_g1424 : NR2D0BWP7T port map(A1 => L3c_move(3), A2 => L3c_move(1), ZN => L3c_n_19);
  L3c_g1425 : ND2D0BWP7T port map(A1 => L3c_n_14, A2 => L3c_n_17, ZN => L3c_n_18);
  L3c_g1426 : CKND1BWP7T port map(I => L3c_move(0), ZN => L3c_n_17);
  L3c_g1430 : INVD1BWP7T port map(I => L3c_move(2), ZN => L3c_n_14);
  L3c_g2 : INR3D0BWP7T port map(A1 => L3c_move(3), B1 => L3c_n_18, B2 => L3c_move(1), ZN => L3c_n_13);
  L3c_CR1_column_number_out_reg_4 : DFQD1BWP7T port map(CP => clk, D => L3c_n_6, Q => col_old_pacman(4));
  L3c_CR1_column_number_out_reg_2 : DFQD1BWP7T port map(CP => clk, D => L3c_n_5, Q => col_old_pacman(2));
  L3c_CR1_row_number_out_reg_0 : DFQD1BWP7T port map(CP => clk, D => L3c_n_7, Q => row_old_pacman(0));
  L3c_CR1_row_number_out_reg_2 : DFQD1BWP7T port map(CP => clk, D => L3c_n_4, Q => row_old_pacman(2));
  L3c_CR1_column_number_out_reg_1 : DFQD1BWP7T port map(CP => clk, D => L3c_n_8, Q => col_old_pacman(1));
  L3c_CR1_column_number_out_reg_0 : DFQD1BWP7T port map(CP => clk, D => L3c_n_12, Q => col_old_pacman(0));
  L3c_CR1_column_number_out_reg_3 : DFQD1BWP7T port map(CP => clk, D => L3c_n_11, Q => col_old_pacman(3));
  L3c_CR1_row_number_out_reg_1 : DFQD1BWP7T port map(CP => clk, D => L3c_n_9, Q => row_old_pacman(1));
  L3c_g475 : AO221D0BWP7T port map(A1 => L3c_n_0, A2 => col_old_pacman(0), B1 => write_coin, B2 => col_new_pacman(0), C => score_reset_out, Z => L3c_n_12);
  L3c_g476 : AO221D0BWP7T port map(A1 => L3c_n_0, A2 => col_old_pacman(3), B1 => write_coin, B2 => col_new_pacman(3), C => score_reset_out, Z => L3c_n_11);
  L3c_g477 : AO221D0BWP7T port map(A1 => L3c_n_0, A2 => row_old_pacman(4), B1 => write_coin, B2 => row_new_pacman(4), C => score_reset_out, Z => L3c_n_10);
  L3c_g478 : AO221D0BWP7T port map(A1 => L3c_n_0, A2 => row_old_pacman(1), B1 => write_coin, B2 => row_new_pacman(1), C => score_reset_out, Z => L3c_n_9);
  L3c_g479 : AO221D0BWP7T port map(A1 => L3c_n_0, A2 => col_old_pacman(1), B1 => write_coin, B2 => col_new_pacman(1), C => score_reset_out, Z => L3c_n_8);
  L3c_g480 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => row_old_pacman(0), B1 => row_new_pacman(0), B2 => L3c_n_2, Z => L3c_n_7);
  L3c_g481 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => col_old_pacman(4), B1 => col_new_pacman(4), B2 => L3c_n_2, Z => L3c_n_6);
  L3c_g482 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => col_old_pacman(2), B1 => col_new_pacman(2), B2 => L3c_n_2, Z => L3c_n_5);
  L3c_g483 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => row_old_pacman(2), B1 => row_new_pacman(2), B2 => L3c_n_2, Z => L3c_n_4);
  L3c_g484 : AO22D0BWP7T port map(A1 => L3c_n_1, A2 => row_old_pacman(3), B1 => row_new_pacman(3), B2 => L3c_n_2, Z => L3c_n_3);
  L3c_g485 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => L3c_n_0, ZN => L3c_n_2);
  L3c_g486 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => write_coin, ZN => L3c_n_1);
  L3c_g487 : INVD1BWP7T port map(I => write_coin, ZN => L3c_n_0);
  L3c_CR1_row_number_out_reg_3 : DFD1BWP7T port map(CP => clk, D => L3c_n_3, Q => row_old_pacman(3), QN => L3c_n_16);
  L3c_CR1_row_number_out_reg_4 : DFD1BWP7T port map(CP => clk, D => L3c_n_10, Q => row_old_pacman(4), QN => L3c_n_15);
  L3c_PC1_g171 : ND2D1BWP7T port map(A1 => L3c_PC1_n_8, A2 => L3c_PC1_n_9, ZN => pacman_ready);
  L3c_PC1_g172 : NR2XD0BWP7T port map(A1 => L3c_PC1_n_7, A2 => L3c_PC1_state(1), ZN => pacman_map_select);
  L3c_PC1_g317 : MOAI22D0BWP7T port map(A1 => score_reset_out, A2 => L3c_PC1_n_2, B1 => n_204, B2 => L3c_PC1_n_3, ZN => L3c_PC1_n_5);
  L3c_PC1_g318 : NR3D0BWP7T port map(A1 => L3c_PC1_n_1, A2 => score_reset_out, A3 => L3c_PC1_state(1), ZN => L3c_PC1_n_4);
  L3c_PC1_g319 : INR4D0BWP7T port map(A1 => L3c_PC1_n_9, B1 => L3c_PC1_n_7, B2 => game_over_out, B3 => score_reset_out, ZN => L3c_PC1_n_3);
  L3c_PC1_g320 : ND4D0BWP7T port map(A1 => pacman_start, A2 => L3c_PC1_n_9, A3 => L3c_PC1_n_7, A4 => L3c_PC1_n_8, ZN => L3c_PC1_n_2);
  L3c_PC1_g321 : OAI21D0BWP7T port map(A1 => n_204, A2 => game_over_out, B => L3c_PC1_state(0), ZN => L3c_PC1_n_1);
  L3c_PC1_g322 : INVD0BWP7T port map(I => n_204, ZN => L3c_PC1_n_0);
  L3c_PC1_state_reg_0 : DFD1BWP7T port map(CP => clk, D => L3c_PC1_n_5, Q => L3c_PC1_state(0), QN => L3c_PC1_n_7);
  L3c_PC1_state_reg_2 : DFKCND1BWP7T port map(CP => clk, CN => L3c_PC1_n_3, D => L3c_PC1_n_0, Q => write_coin, QN => L3c_PC1_n_8);
  L3c_PC1_state_reg_1 : DFD1BWP7T port map(CP => clk, D => L3c_PC1_n_4, Q => L3c_PC1_state(1), QN => L3c_PC1_n_9);
  L2_g2 : OR2D4BWP7T port map(A1 => L2_c_g2, A2 => L2_c_g1, Z => game_over_out);
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
  L6a_g303 : MOAI22D0BWP7T port map(A1 => L6a_n_5, A2 => L6a_count_int(6), B1 => L6a_n_5, B2 => L6a_count_int(6), ZN => L6a_count_int2(6));
  L6a_g304 : MOAI22D0BWP7T port map(A1 => L6a_n_4, A2 => L6a_count_int(5), B1 => L6a_n_4, B2 => L6a_count_int(5), ZN => L6a_count_int2(5));
  L6a_g305 : IND2D1BWP7T port map(A1 => L6a_n_4, B1 => L6a_count_int(5), ZN => L6a_n_5);
  L6a_g306 : MOAI22D0BWP7T port map(A1 => L6a_n_3, A2 => L6a_count_int(4), B1 => L6a_n_3, B2 => L6a_count_int(4), ZN => L6a_count_int2(4));
  L6a_g307 : IND2D1BWP7T port map(A1 => L6a_n_3, B1 => L6a_count_int(4), ZN => L6a_n_4);
  L6a_g308 : MOAI22D0BWP7T port map(A1 => L6a_n_2, A2 => L6a_count_int(3), B1 => L6a_n_2, B2 => L6a_count_int(3), ZN => L6a_count_int2(3));
  L6a_g309 : IND2D1BWP7T port map(A1 => L6a_n_2, B1 => L6a_count_int(3), ZN => L6a_n_3);
  L6a_g310 : MOAI22D0BWP7T port map(A1 => L6a_n_1, A2 => L6a_count_int(2), B1 => L6a_n_1, B2 => L6a_count_int(2), ZN => L6a_count_int2(2));
  L6a_g311 : IND2D1BWP7T port map(A1 => L6a_n_1, B1 => L6a_count_int(2), ZN => L6a_n_2);
  L6a_g312 : MOAI22D0BWP7T port map(A1 => L6a_n_0, A2 => L6a_count_int(1), B1 => L6a_n_0, B2 => L6a_count_int(1), ZN => L6a_count_int2(1));
  L6a_g313 : IND2D1BWP7T port map(A1 => L6a_n_0, B1 => L6a_count_int(1), ZN => L6a_n_1);
  L6a_g314 : CKXOR2D0BWP7T port map(A1 => L6a_count_int(0), A2 => vc_done_pulse, Z => L6a_count_int2(0));
  L6a_g315 : ND2D1BWP7T port map(A1 => L6a_count_int(0), A2 => vc_done_pulse, ZN => L6a_n_0);
  L6a_LBL1_g1591 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_80, A2 => L6a_LBL1_state(0), B => L6a_LBL1_n_79, ZN => pacman_start);
  L6a_LBL1_g1592 : OAI221D0BWP7T port map(A1 => L6a_LBL1_n_81, A2 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(2), B2 => L6a_LBL1_n_86, C => L6a_LBL1_n_105, ZN => L6a_c_rst_int);
  L6a_LBL1_g1593 : MAOI22D0BWP7T port map(A1 => L6a_LBL1_n_78, A2 => L6a_LBL1_state(1), B1 => L6a_LBL1_n_86, B2 => L6a_LBL1_n_81, ZN => L6a_LBL1_n_79);
  L6a_LBL1_g1594 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_76, A2 => L6a_LBL1_n_75, B => L6a_LBL1_state(2), ZN => ghost1_start);
  L6a_LBL1_g1595 : NR4D0BWP7T port map(A1 => L6a_LBL1_n_74, A2 => L6a_LBL1_state(0), A3 => L6a_LBL1_state(3), A4 => L6a_LBL1_state(1), ZN => ghost2_start);
  L6a_LBL1_g1596 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_76, A2 => L6a_LBL1_n_74, Z => L6a_LBL1_n_80);
  L6a_LBL1_g1597 : INVD0BWP7T port map(I => L6a_LBL1_n_105, ZN => L6a_LBL1_n_78);
  L6a_LBL1_g1599 : ND2D0BWP7T port map(A1 => L6a_LBL1_state(0), A2 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_75);
  L6a_LBL1_g1600 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(1), B1 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_76);
  L6a_LBL1_g1602 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(3), B1 => L6a_LBL1_n_74, ZN => L6a_LBL1_n_81);
  L6a_LBL1_g1603 : IND2D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_86);
  L6a_LBL1_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => L6a_LBL1_n_73, Q => L6a_LBL1_state(0));
  L6a_LBL1_state_reg_3 : DFQD1BWP7T port map(CP => clk, D => L6a_LBL1_n_72, Q => L6a_LBL1_state(3));
  L6a_LBL1_g2960 : OAI211D1BWP7T port map(A1 => L6a_LBL1_n_37, A2 => L6a_LBL1_n_41, B => L6a_LBL1_n_71, C => L6a_LBL1_n_3, ZN => L6a_LBL1_n_73);
  L6a_LBL1_g2964 : OAI31D0BWP7T port map(A1 => L6a_count_int(6), A2 => L6a_LBL1_n_54, A3 => L6a_LBL1_n_22, B => L6a_LBL1_n_68, ZN => L6a_LBL1_n_72);
  L6a_LBL1_g2965 : AOI222D0BWP7T port map(A1 => L6a_LBL1_n_66, A2 => L6a_LBL1_state(0), B1 => L6a_LBL1_n_8, B2 => L6a_LBL1_n_62, C1 => L6a_LBL1_n_16, C2 => L6a_LBL1_n_38, ZN => L6a_LBL1_n_71);
  L6a_LBL1_g2966 : ND3D0BWP7T port map(A1 => L6a_LBL1_n_100, A2 => L6a_LBL1_n_65, A3 => L6a_LBL1_n_3, ZN => L6a_LBL1_n_70);
  L6a_LBL1_g2967 : OAI211D1BWP7T port map(A1 => L6a_LBL1_n_23, A2 => L6a_LBL1_n_33, B => L6a_LBL1_n_67, C => L6a_LBL1_n_58, ZN => L6a_LBL1_n_69);
  L6a_LBL1_g2968 : OA222D0BWP7T port map(A1 => L6a_LBL1_n_46, A2 => L6a_LBL1_n_5, B1 => L6a_LBL1_n_59, B2 => L6a_LBL1_n_45, C1 => L6a_LBL1_n_64, C2 => L6a_LBL1_n_22, Z => L6a_LBL1_n_68);
  L6a_LBL1_g2969 : IAO21D0BWP7T port map(A1 => L6a_LBL1_n_101, A2 => reset, B => L6a_LBL1_n_63, ZN => L6a_LBL1_n_67);
  L6a_LBL1_g2970 : AOI21D0BWP7T port map(A1 => pacman_ready, A2 => L6a_LBL1_n_60, B => L6a_LBL1_n_24, ZN => L6a_LBL1_n_66);
  L6a_LBL1_g2971 : MAOI22D0BWP7T port map(A1 => L6a_LBL1_n_8, A2 => L6a_LBL1_n_61, B1 => L6a_LBL1_n_24, B2 => L6a_LBL1_n_5, ZN => L6a_LBL1_n_65);
  L6a_LBL1_g2972 : AOI221D0BWP7T port map(A1 => L6a_LBL1_n_57, A2 => pacman_ready, B1 => L6a_LBL1_n_4, B2 => L6a_LBL1_state(0), C => L6a_LBL1_n_10, ZN => L6a_LBL1_n_64);
  L6a_LBL1_g2973 : OAI222D0BWP7T port map(A1 => L6a_LBL1_n_51, A2 => L6a_LBL1_n_39, B1 => reset, B2 => L6a_LBL1_n_104, C1 => L6a_LBL1_n_18, C2 => L6a_LBL1_n_102, ZN => L6a_LBL1_n_63);
  L6a_LBL1_g2974 : OAI32D1BWP7T port map(A1 => L6a_LBL1_n_56, A2 => L6a_LBL1_state(3), A3 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(1), B2 => L6a_LBL1_n_9, ZN => L6a_LBL1_n_62);
  L6a_LBL1_g2975 : IND3D1BWP7T port map(A1 => L6a_LBL1_n_9, B1 => L6a_LBL1_n_23, B2 => L6a_LBL1_n_52, ZN => L6a_LBL1_n_61);
  L6a_LBL1_g2976 : AOI211XD0BWP7T port map(A1 => L6a_LBL1_n_50, A2 => L6a_LBL1_n_6, B => L6a_LBL1_n_57, C => ghost1_ready, ZN => L6a_LBL1_n_60);
  L6a_LBL1_g2977 : AOI211XD0BWP7T port map(A1 => L6a_LBL1_n_43, A2 => L6a_count_int(3), B => L6a_LBL1_n_0, C => L6a_LBL1_n_44, ZN => L6a_LBL1_n_59);
  L6a_LBL1_g2978 : IAO21D0BWP7T port map(A1 => L6a_LBL1_n_22, A2 => L6a_LBL1_n_5, B => L6a_LBL1_n_55, ZN => L6a_LBL1_n_58);
  L6a_LBL1_g2979 : AOI31D0BWP7T port map(A1 => L6a_LBL1_n_35, A2 => L6a_LBL1_n_28, A3 => L6a_LBL1_n_4, B => L6a_LBL1_n_13, ZN => L6a_LBL1_n_56);
  L6a_LBL1_g2980 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_28, A2 => L6a_LBL1_n_17, B => L6a_LBL1_n_51, ZN => L6a_LBL1_n_55);
  L6a_LBL1_g2981 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_42, A2 => L6a_count_int(3), B => L6a_LBL1_n_34, ZN => L6a_LBL1_n_57);
  L6a_LBL1_g2982 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_31, A2 => L6a_LBL1_n_4, B => L6a_LBL1_n_50, ZN => L6a_LBL1_n_54);
  L6a_LBL1_g2984 : MAOI22D0BWP7T port map(A1 => L6a_LBL1_state(0), A2 => L6a_LBL1_n_14, B1 => L6a_LBL1_n_44, B2 => L6a_LBL1_n_10, ZN => L6a_LBL1_n_52);
  L6a_LBL1_g2986 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_45, B1 => L6a_LBL1_n_4, ZN => L6a_LBL1_n_51);
  L6a_LBL1_g2987 : OAI21D0BWP7T port map(A1 => L6a_LBL1_n_36, A2 => L6a_count_int(4), B => L6a_count_int(5), ZN => L6a_LBL1_n_50);
  L6a_LBL1_g2991 : OA22D0BWP7T port map(A1 => L6a_LBL1_n_33, A2 => L6a_LBL1_n_14, B1 => L6a_LBL1_n_18, B2 => L6a_LBL1_n_15, Z => L6a_LBL1_n_46);
  L6a_LBL1_g2992 : NR3D0BWP7T port map(A1 => L6a_LBL1_n_30, A2 => L6a_count_int(2), A3 => L6a_count_int(4), ZN => L6a_LBL1_n_43);
  L6a_LBL1_g2993 : IND3D0BWP7T port map(A1 => L6a_count_int(5), B1 => L6a_count_int(4), B2 => L6a_LBL1_n_28, ZN => L6a_LBL1_n_42);
  L6a_LBL1_g2994 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_33, A2 => L6a_LBL1_n_10, Z => L6a_LBL1_n_45);
  L6a_LBL1_g2995 : OR2D1BWP7T port map(A1 => L6a_LBL1_n_37, A2 => pacman_ready, Z => L6a_LBL1_n_44);
  L6a_LBL1_g2997 : AOI22D0BWP7T port map(A1 => L6a_LBL1_n_25, A2 => L6a_LBL1_n_2, B1 => L6a_LBL1_n_11, B2 => L6a_count_int(3), ZN => L6a_LBL1_n_39);
  L6a_LBL1_g2998 : MOAI22D0BWP7T port map(A1 => L6a_LBL1_n_27, A2 => L6a_LBL1_n_4, B1 => L6a_LBL1_n_103, B2 => L6a_LBL1_n_27, ZN => L6a_LBL1_n_38);
  L6a_LBL1_g2999 : IND3D1BWP7T port map(A1 => ghost1_ready, B1 => L6a_LBL1_n_26, B2 => L6a_LBL1_n_16, ZN => L6a_LBL1_n_41);
  L6a_LBL1_g3000 : NR2XD0BWP7T port map(A1 => L6a_LBL1_n_28, A2 => L6a_LBL1_n_2, ZN => L6a_LBL1_n_36);
  L6a_LBL1_g3001 : NR2D1BWP7T port map(A1 => L6a_LBL1_n_30, A2 => L6a_LBL1_n_31, ZN => L6a_LBL1_n_37);
  L6a_LBL1_g3002 : INVD1BWP7T port map(I => L6a_LBL1_n_34, ZN => L6a_LBL1_n_35);
  L6a_LBL1_g3003 : NR3D0BWP7T port map(A1 => coin_register_reset, A2 => L6a_LBL1_n_80, A3 => L6a_LBL1_n_14, ZN => L6a_LBL1_n_32);
  L6a_LBL1_g3004 : IND3D1BWP7T port map(A1 => L6a_LBL1_n_17, B1 => L6a_count_int(6), B2 => L6a_count_int(5), ZN => L6a_LBL1_n_34);
  L6a_LBL1_g3005 : IND3D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => L6a_LBL1_n_3, B2 => L6a_LBL1_n_8, ZN => L6a_LBL1_n_33);
  L6a_LBL1_g3007 : INVD1BWP7T port map(I => L6a_LBL1_n_27, ZN => L6a_LBL1_n_26);
  L6a_LBL1_g3008 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_17, B1 => L6a_count_int(2), ZN => L6a_LBL1_n_31);
  L6a_LBL1_g3009 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_11, B1 => L6a_LBL1_n_19, ZN => L6a_LBL1_n_30);
  L6a_LBL1_g3011 : INR2XD0BWP7T port map(A1 => L6a_LBL1_n_19, B1 => L6a_count_int(2), ZN => L6a_LBL1_n_28);
  L6a_LBL1_g3012 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_9, A2 => L6a_LBL1_n_5, ZN => L6a_LBL1_n_27);
  L6a_LBL1_g3015 : IND3D1BWP7T port map(A1 => L6a_count_int(5), B1 => L6a_count_int(4), B2 => L6a_count_int(6), ZN => L6a_LBL1_n_25);
  L6a_LBL1_g3016 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_8, A2 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_24);
  L6a_LBL1_g3017 : ND3D0BWP7T port map(A1 => pacman_ready, A2 => L6a_LBL1_state(1), A3 => ghost1_ready, ZN => L6a_LBL1_n_23);
  L6a_LBL1_g3018 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_18, B1 => L6a_LBL1_n_8, ZN => L6a_LBL1_n_22);
  L6a_LBL1_g3019 : INVD0BWP7T port map(I => L6a_LBL1_n_16, ZN => L6a_LBL1_n_15);
  L6a_LBL1_g3020 : INVD1BWP7T port map(I => L6a_LBL1_n_14, ZN => L6a_LBL1_n_13);
  L6a_LBL1_g3021 : NR2XD0BWP7T port map(A1 => L6a_count_int(0), A2 => L6a_count_int(1), ZN => L6a_LBL1_n_19);
  L6a_LBL1_g3022 : ND2D1BWP7T port map(A1 => L6a_LBL1_state(3), A2 => L6a_LBL1_n_3, ZN => L6a_LBL1_n_18);
  L6a_LBL1_g3023 : CKND2D1BWP7T port map(A1 => L6a_count_int(4), A2 => L6a_count_int(3), ZN => L6a_LBL1_n_17);
  L6a_LBL1_g3024 : NR2D1BWP7T port map(A1 => coin_register_reset, A2 => L6a_LBL1_state(2), ZN => L6a_LBL1_n_16);
  L6a_LBL1_g3025 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_4, A2 => ghost1_ready, ZN => L6a_LBL1_n_14);
  L6a_LBL1_g3027 : CKND2D1BWP7T port map(A1 => L6a_LBL1_n_6, A2 => L6a_count_int(5), ZN => L6a_LBL1_n_11);
  L6a_LBL1_g3028 : IND2D1BWP7T port map(A1 => ghost1_ready, B1 => L6a_LBL1_state(1), ZN => L6a_LBL1_n_10);
  L6a_LBL1_g3029 : INR2D1BWP7T port map(A1 => L6a_LBL1_state(0), B1 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_9);
  L6a_LBL1_g3030 : INR2D1BWP7T port map(A1 => L6a_LBL1_state(2), B1 => coin_register_reset, ZN => L6a_LBL1_n_8);
  L6a_LBL1_g3031 : INVD0BWP7T port map(I => coin_register_reset, ZN => L6a_LBL1_n_7);
  L6a_LBL1_g3032 : INVD1BWP7T port map(I => L6a_count_int(6), ZN => L6a_LBL1_n_6);
  L6a_LBL1_g3034 : INVD1BWP7T port map(I => pacman_ready, ZN => L6a_LBL1_n_4);
  L6a_LBL1_g3035 : INVD1BWP7T port map(I => reset, ZN => L6a_LBL1_n_3);
  L6a_LBL1_g3036 : INVD0BWP7T port map(I => L6a_count_int(3), ZN => L6a_LBL1_n_2);
  L6a_LBL1_g2 : INR4D0BWP7T port map(A1 => L6a_LBL1_n_28, B1 => L6a_LBL1_n_25, B2 => L6a_count_int(3), B3 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_0);
  L6a_LBL1_g3040 : AOI32D1BWP7T port map(A1 => L6a_LBL1_n_7, A2 => L6a_LBL1_n_26, A3 => L6a_LBL1_n_13, B1 => L6a_LBL1_n_106, B2 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_100);
  L6a_LBL1_g3041 : AOI21D0BWP7T port map(A1 => L6a_LBL1_n_8, A2 => L6a_LBL1_n_9, B => L6a_LBL1_n_32, ZN => L6a_LBL1_n_101);
  L6a_LBL1_g3042 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_106, A2 => L6a_LBL1_n_86, ZN => L6a_LBL1_n_102);
  L6a_LBL1_g3043 : ND2D1BWP7T port map(A1 => L6a_LBL1_n_86, A2 => L6a_LBL1_state(3), ZN => L6a_LBL1_n_103);
  L6a_LBL1_state_reg_2 : DFD1BWP7T port map(CP => clk, D => L6a_LBL1_n_70, Q => L6a_LBL1_state(2), QN => L6a_LBL1_n_74);
  L6a_LBL1_state_reg_1 : DFD1BWP7T port map(CP => clk, D => L6a_LBL1_n_69, Q => L6a_LBL1_state(1), QN => L6a_LBL1_n_5);
  L6a_LBL1_g3048 : IND2D1BWP7T port map(A1 => L6a_LBL1_n_41, B1 => L6a_LBL1_n_44, ZN => L6a_LBL1_n_104);
  L6a_LBL1_g3049 : IND3D1BWP7T port map(A1 => L6a_LBL1_state(3), B1 => L6a_LBL1_state(0), B2 => L6a_LBL1_state(2), ZN => L6a_LBL1_n_105);
  L6a_LBL1_g3050 : OAI21D0BWP7T port map(A1 => coin_register_reset, A2 => L6a_LBL1_state(0), B => L6a_LBL1_n_15, ZN => L6a_LBL1_n_106);
  L6a_LBL2_count_out_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_count_int2(0), D => L6a_LBL2_n_0, Q => L6a_count_int(0));
  L6a_LBL2_count_out_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_count_int2(1), D => L6a_LBL2_n_0, Q => L6a_count_int(1));
  L6a_LBL2_count_out_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_count_int2(2), D => L6a_LBL2_n_0, Q => L6a_count_int(2));
  L6a_LBL2_count_out_reg_5 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_LBL2_n_0, D => L6a_count_int2(5), Q => L6a_count_int(5));
  L6a_LBL2_count_out_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_LBL2_n_0, D => L6a_count_int2(4), Q => L6a_count_int(4));
  L6a_LBL2_count_out_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_count_int2(3), D => L6a_LBL2_n_0, Q => L6a_count_int(3));
  L6a_LBL2_count_out_reg_6 : DFKCNQD1BWP7T port map(CP => clk, CN => L6a_LBL2_n_0, D => L6a_count_int2(6), Q => L6a_count_int(6));
  L6a_LBL2_g10 : INVD1BWP7T port map(I => L6a_c_rst_int, ZN => L6a_LBL2_n_0);
  L3a_L0_FF1_data_out_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost1(3), D => L3a_L0_FF1_n_0, Q => L3a_L0_data_intermediate(3));
  L3a_L0_FF1_data_out_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost1(2), D => L3a_L0_FF1_n_0, Q => L3a_L0_data_intermediate(2));
  L3a_L0_FF1_data_out_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost1(0), D => L3a_L0_FF1_n_0, Q => L3a_L0_data_intermediate(0));
  L3a_L0_FF1_data_out_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost1(1), D => L3a_L0_FF1_n_0, Q => L3a_L0_data_intermediate(1));
  L3a_L0_FF1_g7 : INVD1BWP7T port map(I => score_reset_out, ZN => L3a_L0_FF1_n_0);
  L3a_L0_FF2_data_out_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => L3a_L0_data_intermediate(3), D => L3a_L0_FF2_n_0, Q => L3a_data_buffed(3));
  L3a_L0_FF2_data_out_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => L3a_L0_data_intermediate(2), D => L3a_L0_FF2_n_0, Q => L3a_data_buffed(2));
  L3a_L0_FF2_data_out_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => L3a_L0_data_intermediate(0), D => L3a_L0_FF2_n_0, Q => L3a_data_buffed(0));
  L3a_L0_FF2_data_out_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => L3a_L0_data_intermediate(1), D => L3a_L0_FF2_n_0, Q => L3a_data_buffed(1));
  L3a_L0_FF2_g7 : INVD1BWP7T port map(I => score_reset_out, ZN => L3a_L0_FF2_n_0);
  L6b_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => L6b_n_3, Q => L6b_state(0));
  L6b_state_reg_1 : DFQD1BWP7T port map(CP => clk, D => L6b_n_2, Q => vc_done_pulse);
  L6b_g107 : AO211D0BWP7T port map(A1 => L6b_state(0), A2 => L6b_n_0, B => L6b_n_1, C => reset, Z => L6b_n_3);
  L6b_g108 : INR3D0BWP7T port map(A1 => L6b_state(0), B1 => reset, B2 => L6b_n_1, ZN => L6b_n_2);
  L6b_g109 : NR2D1BWP7T port map(A1 => vc_done_pulse, A2 => vc_done_in, ZN => L6b_n_1);
  L6b_g110 : INVD0BWP7T port map(I => vc_done_in, ZN => L6b_n_0);
  L3a_L1_move_out_reg_1 : LNQD1BWP7T port map(EN => L3a_L1_n_34, D => L3a_L1_n_23, Q => L3a_move(1));
  L3a_L1_g310 : NR2D0BWP7T port map(A1 => L3a_L1_n_35, A2 => L3a_L1_n_26, ZN => L3a_L1_n_23);
  L3a_L1_g311 : INR2D0BWP7T port map(A1 => L3a_L1_n_24, B1 => L3a_L1_n_25, ZN => L3a_L1_n_34);
  L3a_L1_g312 : ND2D1BWP7T port map(A1 => L3a_L1_n_25, A2 => L3a_L1_state(0), ZN => L3a_L1_n_35);
  L3a_L1_g313 : ND2D1BWP7T port map(A1 => L3a_L1_n_27, A2 => L3a_L1_n_26, ZN => L3a_L1_n_24);
  L3a_L1_g648 : OR2D1BWP7T port map(A1 => L3a_L1_n_36, A2 => L3a_L1_n_19, Z => L3a_L1_n_22);
  L3a_L1_g649 : AO22D0BWP7T port map(A1 => L3a_L1_n_14, A2 => L3a_L1_n_15, B1 => L3a_L1_n_17, B2 => L3a_L1_n_1, Z => L3a_L1_n_21);
  L3a_L1_g650 : AO32D1BWP7T port map(A1 => L3a_L1_n_7, A2 => L3a_L1_n_16, A3 => L3a_L1_n_10, B1 => L3a_L1_n_1, B2 => L3a_L1_n_9, Z => L3a_L1_n_20);
  L3a_L1_g651 : NR4D0BWP7T port map(A1 => score_reset_out, A2 => L3a_L1_n_35, A3 => L3a_L1_n_13, A4 => L3a_L1_n_9, ZN => L3a_L1_n_19);
  L3a_L1_g653 : INR3D0BWP7T port map(A1 => L3a_L1_n_10, B1 => L3a_L1_n_9, B2 => L3a_L1_n_26, ZN => L3a_L1_n_17);
  L3a_L1_g654 : INVD0BWP7T port map(I => L3a_L1_n_15, ZN => L3a_L1_n_16);
  L3a_L1_g655 : IND2D1BWP7T port map(A1 => L3a_L1_n_13, B1 => L3a_L1_n_12, ZN => L3a_L1_n_15);
  L3a_L1_move_out_reg_3 : LNQD1BWP7T port map(EN => L3a_L1_n_34, D => L3a_L1_n_5, Q => L3a_move(3));
  L3a_L1_move_out_reg_2 : LNQD1BWP7T port map(EN => L3a_L1_n_34, D => L3a_L1_n_38, Q => L3a_move(2));
  L3a_L1_g659 : INR4D0BWP7T port map(A1 => L3a_data_buffed(2), B1 => L3a_data_buffed(0), B2 => L3a_data_buffed(1), B3 => L3a_data_buffed(3), ZN => L3a_L1_n_13);
  L3a_L1_g660 : IND3D1BWP7T port map(A1 => L3a_data_buffed(0), B1 => L3a_data_buffed(1), B2 => L3a_L1_n_4, ZN => L3a_L1_n_12);
  L3a_L1_g662 : IND3D1BWP7T port map(A1 => L3a_data_buffed(1), B1 => L3a_data_buffed(0), B2 => L3a_L1_n_4, ZN => L3a_L1_n_10);
  L3a_L1_g663 : INR4D0BWP7T port map(A1 => L3a_data_buffed(3), B1 => L3a_data_buffed(0), B2 => L3a_data_buffed(1), B3 => L3a_data_buffed(2), ZN => L3a_L1_n_9);
  L3a_L1_move_out_reg_0 : LNQD1BWP7T port map(EN => L3a_L1_n_34, D => L3a_L1_n_3, Q => L3a_move(0));
  L3a_L1_g667 : NR3D0BWP7T port map(A1 => L3a_L1_n_25, A2 => L3a_L1_state(0), A3 => L3a_L1_state(1), ZN => L3a_L1_n_5);
  L3a_L1_g668 : NR3D0BWP7T port map(A1 => score_reset_out, A2 => L3a_L1_n_24, A3 => L3a_L1_n_25, ZN => L3a_L1_n_7);
  L3a_L1_g669 : NR2D0BWP7T port map(A1 => L3a_L1_n_35, A2 => L3a_L1_state(1), ZN => L3a_L1_n_3);
  L3a_L1_g670 : NR2XD0BWP7T port map(A1 => L3a_data_buffed(2), A2 => L3a_data_buffed(3), ZN => L3a_L1_n_4);
  L3a_L1_g673 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => L3a_L1_state(2), ZN => L3a_L1_n_1);
  L3a_L1_g677 : INVD0BWP7T port map(I => L3a_L1_n_37, ZN => L3a_L1_n_14);
  L3a_L1_g2 : AOI21D0BWP7T port map(A1 => L3a_L1_n_12, A2 => L3a_L1_n_10, B => L3a_L1_n_37, ZN => L3a_L1_n_36);
  L3a_L1_g678 : NR2D1BWP7T port map(A1 => L3a_L1_n_1, A2 => L3a_L1_n_7, ZN => L3a_L1_n_37);
  L3a_L1_state_reg_0 : DFD1BWP7T port map(CP => clk, D => L3a_L1_n_22, Q => L3a_L1_state(0), QN => L3a_L1_n_27);
  L3a_L1_state_reg_2 : DFD1BWP7T port map(CP => clk, D => L3a_L1_n_20, Q => L3a_L1_state(2), QN => L3a_L1_n_25);
  L3a_L1_state_reg_1 : DFD1BWP7T port map(CP => clk, D => L3a_L1_n_21, Q => L3a_L1_state(1), QN => L3a_L1_n_26);
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
  L1a_g9820 : AN2D4BWP7T port map(A1 => coin_present, A2 => write_coin, Z => score_pulse);
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
  L1a_coin_memory_reg_0 : DFQD1BWP7T port map(CP => clk, D => L1a_n_18, Q => L1a_coin_memory(0));
  L1a_coin_memory_reg_1 : DFQD1BWP7T port map(CP => clk, D => L1a_n_48, Q => L1a_coin_memory(1));
  L1a_coin_memory_reg_2 : DFQD1BWP7T port map(CP => clk, D => L1a_n_46, Q => L1a_coin_memory(2));
  L1a_coin_memory_reg_3 : DFQD1BWP7T port map(CP => clk, D => L1a_n_19, Q => L1a_coin_memory(3));
  L1a_coin_memory_reg_4 : DFQD1BWP7T port map(CP => clk, D => L1a_n_36, Q => L1a_coin_memory(4));
  L1a_coin_memory_reg_5 : DFQD1BWP7T port map(CP => clk, D => L1a_n_39, Q => L1a_coin_memory(5));
  L1a_coin_memory_reg_6 : DFQD1BWP7T port map(CP => clk, D => L1a_n_34, Q => L1a_coin_memory(6));
  L1a_coin_memory_reg_7 : DFQD1BWP7T port map(CP => clk, D => L1a_n_33, Q => L1a_coin_memory(7));
  L1a_coin_memory_reg_8 : DFQD1BWP7T port map(CP => clk, D => L1a_n_28, Q => L1a_coin_memory(8));
  L1a_coin_memory_reg_9 : DFQD1BWP7T port map(CP => clk, D => L1a_n_27, Q => L1a_coin_memory(9));
  L1a_coin_memory_reg_10 : DFQD1BWP7T port map(CP => clk, D => L1a_n_63, Q => L1a_coin_memory(10));
  L1a_coin_memory_reg_11 : DFQD1BWP7T port map(CP => clk, D => L1a_n_61, Q => L1a_coin_memory(11));
  L1a_coin_memory_reg_12 : DFQD1BWP7T port map(CP => clk, D => L1a_n_59, Q => L1a_coin_memory(12));
  L1a_coin_memory_reg_13 : DFQD1BWP7T port map(CP => clk, D => L1a_n_24, Q => L1a_coin_memory(13));
  L1a_coin_memory_reg_14 : DFQD1BWP7T port map(CP => clk, D => L1a_n_21, Q => L1a_coin_memory(14));
  L1a_coin_memory_reg_15 : DFQD1BWP7T port map(CP => clk, D => L1a_n_56, Q => L1a_coin_memory(15));
  L1a_coin_memory_reg_16 : DFQD1BWP7T port map(CP => clk, D => L1a_n_55, Q => L1a_coin_memory(16));
  L1a_coin_memory_reg_17 : DFQD1BWP7T port map(CP => clk, D => L1a_n_54, Q => L1a_coin_memory(17));
  L1a_coin_memory_reg_18 : DFQD1BWP7T port map(CP => clk, D => L1a_n_53, Q => L1a_coin_memory(18));
  L1a_coin_memory_reg_19 : DFQD1BWP7T port map(CP => clk, D => L1a_n_52, Q => L1a_coin_memory(19));
  L1a_coin_memory_reg_20 : DFQD1BWP7T port map(CP => clk, D => L1a_n_51, Q => L1a_coin_memory(20));
  L1a_coin_memory_reg_21 : DFQD1BWP7T port map(CP => clk, D => L1a_n_50, Q => L1a_coin_memory(21));
  L1a_coin_memory_reg_22 : DFQD1BWP7T port map(CP => clk, D => L1a_n_64, Q => L1a_coin_memory(22));
  L1a_coin_memory_reg_23 : DFQD1BWP7T port map(CP => clk, D => L1a_n_47, Q => L1a_coin_memory(23));
  L1a_coin_memory_reg_24 : DFQD1BWP7T port map(CP => clk, D => L1a_n_45, Q => L1a_coin_memory(24));
  L1a_coin_memory_reg_25 : DFQD1BWP7T port map(CP => clk, D => L1a_n_44, Q => L1a_coin_memory(25));
  L1a_coin_memory_reg_26 : DFQD1BWP7T port map(CP => clk, D => L1a_n_43, Q => L1a_coin_memory(26));
  L1a_coin_memory_reg_27 : DFQD1BWP7T port map(CP => clk, D => L1a_n_42, Q => L1a_coin_memory(27));
  L1a_coin_memory_reg_28 : DFQD1BWP7T port map(CP => clk, D => L1a_n_41, Q => L1a_coin_memory(28));
  L1a_coin_memory_reg_29 : DFQD1BWP7T port map(CP => clk, D => L1a_n_40, Q => L1a_coin_memory(29));
  L1a_coin_memory_reg_30 : DFQD1BWP7T port map(CP => clk, D => L1a_n_38, Q => L1a_coin_memory(30));
  L1a_coin_memory_reg_31 : DFQD1BWP7T port map(CP => clk, D => L1a_n_37, Q => L1a_coin_memory(31));
  L1a_coin_memory_reg_32 : DFQD1BWP7T port map(CP => clk, D => L1a_n_35, Q => L1a_coin_memory(32));
  L1a_coin_memory_reg_33 : DFQD1BWP7T port map(CP => clk, D => L1a_n_20, Q => L1a_coin_memory(33));
  L1a_coin_memory_reg_34 : DFQD1BWP7T port map(CP => clk, D => L1a_n_17, Q => L1a_coin_memory(34));
  L1a_coin_memory_reg_35 : DFQD1BWP7T port map(CP => clk, D => L1a_n_32, Q => L1a_coin_memory(35));
  L1a_coin_memory_reg_36 : DFQD1BWP7T port map(CP => clk, D => L1a_n_31, Q => L1a_coin_memory(36));
  L1a_coin_memory_reg_37 : DFQD1BWP7T port map(CP => clk, D => L1a_n_30, Q => L1a_coin_memory(37));
  L1a_coin_memory_reg_38 : DFQD1BWP7T port map(CP => clk, D => L1a_n_29, Q => L1a_coin_memory(38));
  L1a_coin_memory_reg_39 : DFQD1BWP7T port map(CP => clk, D => L1a_n_26, Q => L1a_coin_memory(39));
  L1a_coin_memory_reg_40 : DFQD1BWP7T port map(CP => clk, D => L1a_n_25, Q => L1a_coin_memory(40));
  L1a_coin_memory_reg_41 : DFQD1BWP7T port map(CP => clk, D => L1a_n_49, Q => L1a_coin_memory(41));
  L1a_coin_memory_reg_42 : DFQD1BWP7T port map(CP => clk, D => L1a_n_62, Q => L1a_coin_memory(42));
  L1a_coin_memory_reg_43 : DFQD1BWP7T port map(CP => clk, D => L1a_n_60, Q => L1a_coin_memory(43));
  L1a_coin_memory_reg_44 : DFQD1BWP7T port map(CP => clk, D => L1a_n_22, Q => L1a_coin_memory(44));
  L1a_coin_memory_reg_45 : DFQD1BWP7T port map(CP => clk, D => L1a_n_58, Q => L1a_coin_memory(45));
  L1a_coin_memory_reg_46 : DFQD1BWP7T port map(CP => clk, D => L1a_n_57, Q => L1a_coin_memory(46));
  L1a_coin_memory_reg_47 : DFQD1BWP7T port map(CP => clk, D => L1a_n_23, Q => L1a_coin_memory(47));
  L1a_g4886 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_198, B1 => L1a_n_180, B2 => L1a_coin_memory(22), ZN => L1a_n_64);
  L1a_g4887 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_191, B1 => L1a_n_180, B2 => L1a_coin_memory(10), ZN => L1a_n_63);
  L1a_g4888 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_201, B1 => L1a_n_180, B2 => L1a_coin_memory(42), ZN => L1a_n_62);
  L1a_g4889 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_182, B1 => L1a_n_180, B2 => L1a_coin_memory(11), ZN => L1a_n_61);
  L1a_g4890 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_201, B1 => L1a_n_180, B2 => L1a_coin_memory(43), ZN => L1a_n_60);
  L1a_g4891 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_193, B1 => L1a_n_180, B2 => L1a_coin_memory(12), ZN => L1a_n_59);
  L1a_g4892 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_200, B1 => L1a_n_180, B2 => L1a_coin_memory(45), ZN => L1a_n_58);
  L1a_g4893 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_200, B1 => L1a_n_180, B2 => L1a_coin_memory(46), ZN => L1a_n_57);
  L1a_g4894 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_193, B1 => L1a_n_180, B2 => L1a_coin_memory(15), ZN => L1a_n_56);
  L1a_g4895 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_199, B1 => L1a_n_180, B2 => L1a_coin_memory(16), ZN => L1a_n_55);
  L1a_g4896 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_199, B1 => L1a_n_180, B2 => L1a_coin_memory(17), ZN => L1a_n_54);
  L1a_g4897 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_199, B1 => L1a_n_180, B2 => L1a_coin_memory(18), ZN => L1a_n_53);
  L1a_g4898 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_199, B1 => L1a_n_180, B2 => L1a_coin_memory(19), ZN => L1a_n_52);
  L1a_g4899 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_198, B1 => L1a_n_180, B2 => L1a_coin_memory(20), ZN => L1a_n_51);
  L1a_g4900 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_198, B1 => L1a_n_180, B2 => L1a_coin_memory(21), ZN => L1a_n_50);
  L1a_g4901 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_201, B1 => L1a_n_180, B2 => L1a_coin_memory(41), ZN => L1a_n_49);
  L1a_g4910 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_206, B1 => L1a_n_180, B2 => L1a_coin_memory(1), ZN => L1a_n_48);
  L1a_g4911 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_198, B1 => L1a_n_180, B2 => L1a_coin_memory(23), ZN => L1a_n_47);
  L1a_g4912 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_206, B1 => L1a_n_180, B2 => L1a_coin_memory(2), ZN => L1a_n_46);
  L1a_g4913 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_197, B1 => L1a_n_180, B2 => L1a_coin_memory(24), ZN => L1a_n_45);
  L1a_g4914 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_197, B1 => L1a_n_180, B2 => L1a_coin_memory(25), ZN => L1a_n_44);
  L1a_g4915 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_197, B1 => L1a_n_180, B2 => L1a_coin_memory(26), ZN => L1a_n_43);
  L1a_g4916 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_197, B1 => L1a_n_180, B2 => L1a_coin_memory(27), ZN => L1a_n_42);
  L1a_g4917 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_196, B1 => L1a_n_180, B2 => L1a_coin_memory(28), ZN => L1a_n_41);
  L1a_g4918 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_196, B1 => L1a_n_180, B2 => L1a_coin_memory(29), ZN => L1a_n_40);
  L1a_g4919 : MOAI22D0BWP7T port map(A1 => L1a_n_10, A2 => L1a_n_195, B1 => L1a_n_180, B2 => L1a_coin_memory(5), ZN => L1a_n_39);
  L1a_g4920 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_196, B1 => L1a_n_180, B2 => L1a_coin_memory(30), ZN => L1a_n_38);
  L1a_g4921 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_196, B1 => L1a_n_180, B2 => L1a_coin_memory(31), ZN => L1a_n_37);
  L1a_g4922 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_195, B1 => L1a_n_180, B2 => L1a_coin_memory(4), ZN => L1a_n_36);
  L1a_g4923 : MOAI22D0BWP7T port map(A1 => L1a_n_224, A2 => L1a_n_203, B1 => L1a_n_180, B2 => L1a_coin_memory(32), ZN => L1a_n_35);
  L1a_g4924 : MOAI22D0BWP7T port map(A1 => L1a_n_11, A2 => L1a_n_195, B1 => L1a_n_180, B2 => L1a_coin_memory(6), ZN => L1a_n_34);
  L1a_g4925 : MOAI22D0BWP7T port map(A1 => L1a_n_14, A2 => L1a_n_195, B1 => L1a_n_180, B2 => L1a_coin_memory(7), ZN => L1a_n_33);
  L1a_g4926 : MOAI22D0BWP7T port map(A1 => L1a_n_16, A2 => L1a_n_203, B1 => L1a_n_180, B2 => L1a_coin_memory(35), ZN => L1a_n_32);
  L1a_g4927 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_190, B1 => L1a_n_180, B2 => L1a_coin_memory(36), ZN => L1a_n_31);
  L1a_g4928 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_183, B1 => L1a_n_180, B2 => L1a_coin_memory(37), ZN => L1a_n_30);
  L1a_g4929 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_191, B1 => L1a_n_180, B2 => L1a_coin_memory(38), ZN => L1a_n_29);
  L1a_g4930 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_190, B1 => L1a_n_180, B2 => L1a_coin_memory(8), ZN => L1a_n_28);
  L1a_g4931 : MOAI22D0BWP7T port map(A1 => L1a_n_9, A2 => L1a_n_183, B1 => L1a_n_180, B2 => L1a_coin_memory(9), ZN => L1a_n_27);
  L1a_g4932 : MOAI22D0BWP7T port map(A1 => L1a_n_12, A2 => L1a_n_182, B1 => L1a_n_180, B2 => L1a_coin_memory(39), ZN => L1a_n_26);
  L1a_g4933 : MOAI22D0BWP7T port map(A1 => L1a_n_13, A2 => L1a_n_201, B1 => L1a_n_180, B2 => L1a_coin_memory(40), ZN => L1a_n_25);
  L1a_g4934 : OAI31D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_193, A3 => L1a_n_225, B => L1a_n_6, ZN => L1a_n_24);
  L1a_g4935 : OAI31D0BWP7T port map(A1 => L1a_n_204, A2 => L1a_n_200, A3 => L1a_n_225, B => L1a_n_7, ZN => L1a_n_23);
  L1a_g4936 : OAI31D0BWP7T port map(A1 => L1a_n_187, A2 => L1a_n_200, A3 => L1a_n_225, B => L1a_n_1, ZN => L1a_n_22);
  L1a_g4937 : OAI31D0BWP7T port map(A1 => L1a_n_192, A2 => L1a_n_193, A3 => L1a_n_225, B => L1a_n_8, ZN => L1a_n_21);
  L1a_g4938 : OAI31D0BWP7T port map(A1 => L1a_n_181, A2 => L1a_n_203, A3 => L1a_n_225, B => L1a_n_3, ZN => L1a_n_20);
  L1a_g4939 : OAI31D0BWP7T port map(A1 => L1a_n_204, A2 => L1a_n_206, A3 => L1a_n_225, B => L1a_n_0, ZN => L1a_n_19);
  L1a_g4940 : OAI31D0BWP7T port map(A1 => L1a_n_187, A2 => L1a_n_206, A3 => L1a_n_225, B => L1a_n_2, ZN => L1a_n_18);
  L1a_g4941 : OAI31D0BWP7T port map(A1 => L1a_n_192, A2 => L1a_n_203, A3 => L1a_n_225, B => L1a_n_5, ZN => L1a_n_17);
  L1a_g4942 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_186, Z => L1a_n_16);
  L1a_g4944 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_189, Z => L1a_n_14);
  L1a_g4945 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_185, Z => L1a_n_13);
  L1a_g4946 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_202, Z => L1a_n_12);
  L1a_g4947 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_184, Z => L1a_n_11);
  L1a_g4948 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_188, Z => L1a_n_10);
  L1a_g4949 : OR2D1BWP7T port map(A1 => L1a_n_225, A2 => L1a_n_194, Z => L1a_n_9);
  L1a_g4950 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(14), ZN => L1a_n_8);
  L1a_g4951 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(47), ZN => L1a_n_7);
  L1a_g4952 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(13), ZN => L1a_n_6);
  L1a_g4953 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(34), ZN => L1a_n_5);
  L1a_g4954 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(33), ZN => L1a_n_3);
  L1a_g4955 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(0), ZN => L1a_n_2);
  L1a_g4956 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(44), ZN => L1a_n_1);
  L1a_g4957 : CKND2D0BWP7T port map(A1 => L1a_n_180, A2 => L1a_coin_memory(3), ZN => L1a_n_0);
  L1a_g9958 : IND2D1BWP7T port map(A1 => L1a_n_225, B1 => L1a_n_92, ZN => L1a_n_224);
  L1a_g9959 : ND2D1BWP7T port map(A1 => write_coin, A2 => L1a_n_180, ZN => L1a_n_225);
  L1b_g182 : AO22D0BWP7T port map(A1 => col_new_pacman(3), A2 => L1b_n_0, B1 => col_request(3), B2 => n_11, Z => col_coin(3));
  L1b_g183 : AO22D0BWP7T port map(A1 => row_new_pacman(1), A2 => L1b_n_0, B1 => row_request(1), B2 => n_11, Z => row_coin(1));
  L1b_g184 : AO22D0BWP7T port map(A1 => row_new_pacman(4), A2 => L1b_n_0, B1 => row_request(4), B2 => n_11, Z => row_coin(4));
  L1b_g185 : AO22D0BWP7T port map(A1 => col_new_pacman(2), A2 => L1b_n_0, B1 => col_request(2), B2 => n_11, Z => col_coin(2));
  L1b_g186 : AO22D0BWP7T port map(A1 => row_new_pacman(0), A2 => L1b_n_0, B1 => row_request(0), B2 => n_11, Z => row_coin(0));
  L1b_g187 : AO22D0BWP7T port map(A1 => row_new_pacman(3), A2 => L1b_n_0, B1 => row_request(3), B2 => n_11, Z => row_coin(3));
  L1b_g188 : AO22D0BWP7T port map(A1 => col_new_pacman(0), A2 => L1b_n_0, B1 => col_request(0), B2 => n_11, Z => col_coin(0));
  L1b_g189 : AO22D0BWP7T port map(A1 => col_new_pacman(1), A2 => L1b_n_0, B1 => col_request(1), B2 => n_11, Z => col_coin(1));
  L1b_g190 : AO22D0BWP7T port map(A1 => row_new_pacman(2), A2 => L1b_n_0, B1 => row_request(2), B2 => n_11, Z => row_coin(2));
  L1b_g191 : AO22D0BWP7T port map(A1 => col_new_pacman(4), A2 => L1b_n_0, B1 => col_request(4), B2 => n_11, Z => col_coin(4));
  L1b_g192 : INVD1BWP7T port map(I => n_11, ZN => L1b_n_0);
  L3b_g1353 : OAI21D0BWP7T port map(A1 => L3b_n_57, A2 => L3b_n_31, B => L3b_n_60, ZN => col_new_ghost2(4));
  L3b_g1354 : OAI222D0BWP7T port map(A1 => L3b_n_102, A2 => L3b_n_41, B1 => L3b_n_37, B2 => L3b_n_57, C1 => L3b_n_39, C2 => L3b_n_15, ZN => row_new_ghost2(4));
  L3b_g1355 : MAOI22D0BWP7T port map(A1 => col_old_ghost2(4), A2 => L3b_n_36, B1 => L3b_n_102, B2 => L3b_n_29, ZN => L3b_n_60);
  L3b_g1356 : OAI21D0BWP7T port map(A1 => L3b_n_54, A2 => L3b_n_37, B => L3b_n_58, ZN => row_new_ghost2(3));
  L3b_g1357 : OAI21D0BWP7T port map(A1 => L3b_n_54, A2 => L3b_n_31, B => L3b_n_59, ZN => col_new_ghost2(3));
  L3b_g1358 : AOI22D0BWP7T port map(A1 => L3b_n_55, A2 => L3b_n_30, B1 => col_old_ghost2(3), B2 => L3b_n_36, ZN => L3b_n_59);
  L3b_g1359 : AOI22D0BWP7T port map(A1 => L3b_n_55, A2 => L3b_n_42, B1 => row_old_ghost2(3), B2 => L3b_n_40, ZN => L3b_n_58);
  L3b_g1360 : MAOI22D0BWP7T port map(A1 => L3b_n_52, A2 => L3b_n_23, B1 => L3b_n_52, B2 => L3b_n_23, ZN => L3b_n_57);
  L3b_g1362 : OAI21D0BWP7T port map(A1 => L3b_n_47, A2 => L3b_n_37, B => L3b_n_53, ZN => row_new_ghost2(2));
  L3b_g1363 : AO221D0BWP7T port map(A1 => L3b_n_48, A2 => L3b_n_30, B1 => col_old_ghost2(2), B2 => L3b_n_36, C => L3b_n_49, Z => col_new_ghost2(2));
  L3b_g1364 : OAI21D0BWP7T port map(A1 => L3b_n_45, A2 => L3b_n_28, B => L3b_n_50, ZN => L3b_n_55);
  L3b_g1365 : AOI22D0BWP7T port map(A1 => L3b_n_48, A2 => L3b_n_42, B1 => row_old_ghost2(2), B2 => L3b_n_40, ZN => L3b_n_53);
  L3b_g1366 : MAOI22D0BWP7T port map(A1 => L3b_n_46, A2 => L3b_n_21, B1 => L3b_n_46, B2 => L3b_n_21, ZN => L3b_n_54);
  L3b_g1367 : INR2XD0BWP7T port map(A1 => L3b_n_46, B1 => L3b_n_21, ZN => L3b_n_52);
  L3b_g1369 : NR2D0BWP7T port map(A1 => L3b_n_47, A2 => L3b_n_31, ZN => L3b_n_49);
  L3b_g1370 : CKND2D0BWP7T port map(A1 => L3b_n_45, A2 => L3b_n_28, ZN => L3b_n_50);
  L3b_g1371 : AO222D0BWP7T port map(A1 => L3b_n_32, A2 => L3b_n_44, B1 => L3b_n_35, B2 => L3b_n_30, C1 => col_old_ghost2(1), C2 => L3b_n_36, Z => col_new_ghost2(1));
  L3b_g1372 : AO222D0BWP7T port map(A1 => L3b_n_38, A2 => L3b_n_44, B1 => L3b_n_35, B2 => L3b_n_42, C1 => row_old_ghost2(1), C2 => L3b_n_40, Z => row_new_ghost2(1));
  L3b_g1373 : AO222D0BWP7T port map(A1 => L3b_n_38, A2 => L3b_n_20, B1 => L3b_n_42, B2 => L3b_n_24, C1 => row_old_ghost2(0), C2 => L3b_n_40, Z => row_new_ghost2(0));
  L3b_g1374 : AO21D0BWP7T port map(A1 => L3b_n_33, A2 => L3b_n_25, B => L3b_n_45, Z => L3b_n_48);
  L3b_g1375 : AO222D0BWP7T port map(A1 => L3b_n_32, A2 => L3b_n_20, B1 => L3b_n_30, B2 => L3b_n_24, C1 => col_old_ghost2(0), C2 => L3b_n_36, Z => col_new_ghost2(0));
  L3b_g1376 : MAOI22D0BWP7T port map(A1 => L3b_n_43, A2 => L3b_n_22, B1 => L3b_n_43, B2 => L3b_n_22, ZN => L3b_n_47);
  L3b_g1377 : INR2XD0BWP7T port map(A1 => L3b_n_43, B1 => L3b_n_22, ZN => L3b_n_46);
  L3b_g1378 : NR2D1BWP7T port map(A1 => L3b_n_33, A2 => L3b_n_25, ZN => L3b_n_45);
  L3b_g1379 : INVD1BWP7T port map(I => L3b_n_41, ZN => L3b_n_42);
  L3b_g1380 : HA1D0BWP7T port map(A => L3b_n_18, B => L3b_n_19, CO => L3b_n_43, S => L3b_n_44);
  L3b_g1381 : IND3D0BWP7T port map(A1 => L3b_move(3), B1 => L3b_move(1), B2 => L3b_n_34, ZN => L3b_n_41);
  L3b_g1382 : INVD1BWP7T port map(I => L3b_n_39, ZN => L3b_n_40);
  L3b_g1383 : CKND1BWP7T port map(I => L3b_n_37, ZN => L3b_n_38);
  L3b_g1384 : AOI211D0BWP7T port map(A1 => L3b_move(3), A2 => L3b_move(1), B => L3b_n_17, C => L3b_n_16, ZN => L3b_n_39);
  L3b_g1385 : IND3D0BWP7T port map(A1 => L3b_move(1), B1 => L3b_move(3), B2 => L3b_n_34, ZN => L3b_n_37);
  L3b_g1386 : OAI211D0BWP7T port map(A1 => L3b_n_13, A2 => L3b_n_14, B => L3b_n_16, C => L3b_n_17, ZN => L3b_n_36);
  L3b_g1387 : OAI21D0BWP7T port map(A1 => L3b_n_24, A2 => L3b_n_27, B => L3b_n_33, ZN => L3b_n_35);
  L3b_g1388 : CKND1BWP7T port map(I => L3b_n_16, ZN => L3b_n_34);
  L3b_g1389 : ND2D1BWP7T port map(A1 => L3b_n_27, A2 => L3b_n_24, ZN => L3b_n_33);
  L3b_g1390 : CKND1BWP7T port map(I => L3b_n_31, ZN => L3b_n_32);
  L3b_g1391 : INVD1BWP7T port map(I => L3b_n_29, ZN => L3b_n_30);
  L3b_g1392 : ND3D0BWP7T port map(A1 => L3b_n_17, A2 => L3b_n_14, A3 => L3b_move(0), ZN => L3b_n_31);
  L3b_g1393 : ND3D0BWP7T port map(A1 => L3b_n_17, A2 => L3b_n_13, A3 => L3b_move(2), ZN => L3b_n_29);
  L3b_g1394 : AOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => L3b_n_14, B1 => col_old_ghost2(3), B2 => L3b_move(2), ZN => L3b_n_28);
  L3b_g1395 : AOI22D0BWP7T port map(A1 => row_old_ghost2(1), A2 => L3b_n_14, B1 => col_old_ghost2(1), B2 => L3b_move(2), ZN => L3b_n_27);
  L3b_g1396 : OAI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => L3b_move(2), B1 => col_old_ghost2(4), B2 => L3b_n_14, ZN => L3b_n_26);
  L3b_g1397 : AO22D0BWP7T port map(A1 => row_old_ghost2(2), A2 => L3b_n_14, B1 => L3b_move(2), B2 => col_old_ghost2(2), Z => L3b_n_25);
  L3b_g1398 : AOI22D0BWP7T port map(A1 => row_old_ghost2(0), A2 => L3b_n_14, B1 => col_old_ghost2(0), B2 => L3b_move(2), ZN => L3b_n_24);
  L3b_g1399 : INVD0BWP7T port map(I => L3b_n_20, ZN => L3b_n_19);
  L3b_g1400 : AOI22D0BWP7T port map(A1 => row_old_ghost2(4), A2 => L3b_move(3), B1 => col_old_ghost2(4), B2 => L3b_move(0), ZN => L3b_n_23);
  L3b_g1401 : AOI22D0BWP7T port map(A1 => row_old_ghost2(2), A2 => L3b_move(3), B1 => col_old_ghost2(2), B2 => L3b_move(0), ZN => L3b_n_22);
  L3b_g1402 : AOI22D0BWP7T port map(A1 => row_old_ghost2(3), A2 => L3b_move(3), B1 => col_old_ghost2(3), B2 => L3b_move(0), ZN => L3b_n_21);
  L3b_g1403 : AO22D0BWP7T port map(A1 => row_old_ghost2(1), A2 => L3b_move(3), B1 => L3b_move(0), B2 => col_old_ghost2(1), Z => L3b_n_18);
  L3b_g1404 : AOI22D0BWP7T port map(A1 => row_old_ghost2(0), A2 => L3b_move(3), B1 => col_old_ghost2(0), B2 => L3b_move(0), ZN => L3b_n_20);
  L3b_g1405 : NR2D0BWP7T port map(A1 => L3b_move(3), A2 => L3b_move(1), ZN => L3b_n_17);
  L3b_g1406 : ND2D0BWP7T port map(A1 => L3b_n_14, A2 => L3b_n_13, ZN => L3b_n_16);
  L3b_g1408 : INVD1BWP7T port map(I => L3b_move(2), ZN => L3b_n_14);
  L3b_g1409 : INVD0BWP7T port map(I => L3b_move(0), ZN => L3b_n_13);
  L3b_L4_column_number_out_reg_1 : DFQD1BWP7T port map(CP => clk, D => L3b_n_3, Q => col_old_ghost2(1));
  L3b_L4_column_number_out_reg_0 : DFQD1BWP7T port map(CP => clk, D => L3b_n_7, Q => col_old_ghost2(0));
  L3b_L4_column_number_out_reg_4 : DFQD1BWP7T port map(CP => clk, D => L3b_n_5, Q => col_old_ghost2(4));
  L3b_L4_row_number_out_reg_0 : DFQD1BWP7T port map(CP => clk, D => L3b_n_6, Q => row_old_ghost2(0));
  L3b_L4_row_number_out_reg_3 : DFQD1BWP7T port map(CP => clk, D => L3b_n_9, Q => row_old_ghost2(3));
  L3b_L4_column_number_out_reg_2 : DFQD1BWP7T port map(CP => clk, D => L3b_n_10, Q => col_old_ghost2(2));
  L3b_L4_row_number_out_reg_1 : DFQD1BWP7T port map(CP => clk, D => L3b_n_4, Q => row_old_ghost2(1));
  L3b_L4_column_number_out_reg_3 : DFQD1BWP7T port map(CP => clk, D => L3b_n_11, Q => col_old_ghost2(3));
  L3b_L4_row_number_out_reg_2 : DFQD1BWP7T port map(CP => clk, D => L3b_n_12, Q => row_old_ghost2(2));
  L3b_g466 : AO221D0BWP7T port map(A1 => row_old_ghost2(2), A2 => L3b_n_0, B1 => row_new_ghost2(2), B2 => L3b_mux_select, C => score_reset_out, Z => L3b_n_12);
  L3b_g467 : AO221D0BWP7T port map(A1 => col_old_ghost2(3), A2 => L3b_n_0, B1 => col_new_ghost2(3), B2 => L3b_mux_select, C => score_reset_out, Z => L3b_n_11);
  L3b_g468 : AO221D0BWP7T port map(A1 => col_old_ghost2(2), A2 => L3b_n_0, B1 => col_new_ghost2(2), B2 => L3b_mux_select, C => score_reset_out, Z => L3b_n_10);
  L3b_g469 : AO221D0BWP7T port map(A1 => row_old_ghost2(3), A2 => L3b_n_0, B1 => row_new_ghost2(3), B2 => L3b_mux_select, C => score_reset_out, Z => L3b_n_9);
  L3b_g470 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => row_old_ghost2(4), B1 => row_new_ghost2(4), B2 => L3b_n_2, Z => L3b_n_8);
  L3b_g471 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => col_old_ghost2(0), B1 => col_new_ghost2(0), B2 => L3b_n_2, Z => L3b_n_7);
  L3b_g472 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => row_old_ghost2(0), B1 => row_new_ghost2(0), B2 => L3b_n_2, Z => L3b_n_6);
  L3b_g473 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => col_old_ghost2(4), B1 => col_new_ghost2(4), B2 => L3b_n_2, Z => L3b_n_5);
  L3b_g474 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => row_old_ghost2(1), B1 => row_new_ghost2(1), B2 => L3b_n_2, Z => L3b_n_4);
  L3b_g475 : AO22D0BWP7T port map(A1 => L3b_n_1, A2 => col_old_ghost2(1), B1 => col_new_ghost2(1), B2 => L3b_n_2, Z => L3b_n_3);
  L3b_g476 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => L3b_n_0, ZN => L3b_n_2);
  L3b_g477 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => L3b_mux_select, ZN => L3b_n_1);
  L3b_g478 : INVD1BWP7T port map(I => L3b_mux_select, ZN => L3b_n_0);
  L3b_g2 : XNR2D1BWP7T port map(A1 => L3b_n_50, A2 => L3b_n_26, ZN => L3b_n_102);
  L3b_L4_row_number_out_reg_4 : DFD1BWP7T port map(CP => clk, D => L3b_n_8, Q => row_old_ghost2(4), QN => L3b_n_15);
  L3b_L1_move_out_reg_2 : LNQD1BWP7T port map(EN => L3b_L1_n_34, D => L3b_L1_n_23, Q => L3b_move(2));
  L3b_L1_g310 : INR2D0BWP7T port map(A1 => L3b_L1_n_24, B1 => L3b_L1_n_25, ZN => L3b_L1_n_34);
  L3b_L1_g311 : NR3D0BWP7T port map(A1 => L3b_L1_n_26, A2 => L3b_L1_state(2), A3 => L3b_L1_state(0), ZN => L3b_L1_n_23);
  L3b_L1_g312 : ND2D1BWP7T port map(A1 => L3b_L1_n_27, A2 => L3b_L1_n_26, ZN => L3b_L1_n_24);
  L3b_L1_g639 : AO21D0BWP7T port map(A1 => L3b_L1_n_36, A2 => L3b_L1_n_15, B => L3b_L1_n_19, Z => L3b_L1_n_22);
  L3b_L1_g640 : AO22D0BWP7T port map(A1 => L3b_L1_n_36, A2 => L3b_L1_n_16, B1 => L3b_L1_n_18, B2 => L3b_L1_n_1, Z => L3b_L1_n_21);
  L3b_L1_g641 : AO32D1BWP7T port map(A1 => L3b_L1_n_5, A2 => L3b_L1_n_17, A3 => L3b_L1_n_9, B1 => L3b_L1_n_1, B2 => L3b_L1_n_8, Z => L3b_L1_n_20);
  L3b_L1_g642 : NR4D0BWP7T port map(A1 => score_reset_out, A2 => L3b_L1_n_2, A3 => L3b_L1_n_12, A4 => L3b_L1_n_8, ZN => L3b_L1_n_19);
  L3b_L1_g643 : INR3D0BWP7T port map(A1 => L3b_L1_n_9, B1 => L3b_L1_n_8, B2 => L3b_L1_n_26, ZN => L3b_L1_n_18);
  L3b_L1_g644 : INVD0BWP7T port map(I => L3b_L1_n_16, ZN => L3b_L1_n_17);
  L3b_L1_g645 : ND2D1BWP7T port map(A1 => L3b_L1_n_9, A2 => L3b_L1_n_11, ZN => L3b_L1_n_15);
  L3b_L1_g646 : IND2D1BWP7T port map(A1 => L3b_L1_n_12, B1 => L3b_L1_n_11, ZN => L3b_L1_n_16);
  L3b_L1_move_out_reg_0 : LNQD1BWP7T port map(EN => L3b_L1_n_34, D => L3b_L1_n_7, Q => L3b_move(0));
  L3b_L1_move_out_reg_3 : LNQD1BWP7T port map(EN => L3b_L1_n_34, D => L3b_L1_n_4, Q => L3b_move(3));
  L3b_L1_move_out_reg_1 : LNQD1BWP7T port map(EN => L3b_L1_n_34, D => L3b_L1_n_6, Q => L3b_move(1));
  L3b_L1_g652 : INR4D0BWP7T port map(A1 => L3b_data_buffed(2), B1 => L3b_data_buffed(0), B2 => L3b_data_buffed(1), B3 => L3b_data_buffed(3), ZN => L3b_L1_n_12);
  L3b_L1_g653 : IND3D1BWP7T port map(A1 => L3b_data_buffed(0), B1 => L3b_data_buffed(1), B2 => L3b_L1_n_3, ZN => L3b_L1_n_11);
  L3b_L1_g655 : IND3D1BWP7T port map(A1 => L3b_data_buffed(1), B1 => L3b_data_buffed(0), B2 => L3b_L1_n_3, ZN => L3b_L1_n_9);
  L3b_L1_g656 : INR4D0BWP7T port map(A1 => L3b_data_buffed(3), B1 => L3b_data_buffed(0), B2 => L3b_data_buffed(1), B3 => L3b_data_buffed(2), ZN => L3b_L1_n_8);
  L3b_L1_g657 : NR2D0BWP7T port map(A1 => L3b_L1_n_2, A2 => L3b_L1_state(1), ZN => L3b_L1_n_7);
  L3b_L1_g658 : NR2D0BWP7T port map(A1 => L3b_L1_n_2, A2 => L3b_L1_n_26, ZN => L3b_L1_n_6);
  L3b_L1_g659 : NR3D0BWP7T port map(A1 => L3b_L1_n_25, A2 => L3b_L1_state(0), A3 => L3b_L1_state(1), ZN => L3b_L1_n_4);
  L3b_L1_g660 : NR3D0BWP7T port map(A1 => score_reset_out, A2 => L3b_L1_n_24, A3 => L3b_L1_n_25, ZN => L3b_L1_n_5);
  L3b_L1_g661 : NR2XD0BWP7T port map(A1 => L3b_data_buffed(2), A2 => L3b_data_buffed(3), ZN => L3b_L1_n_3);
  L3b_L1_g663 : ND2D1BWP7T port map(A1 => L3b_L1_n_25, A2 => L3b_L1_state(0), ZN => L3b_L1_n_2);
  L3b_L1_g664 : NR2XD0BWP7T port map(A1 => score_reset_out, A2 => L3b_L1_state(2), ZN => L3b_L1_n_1);
  L3b_L1_state_reg_0 : DFD1BWP7T port map(CP => clk, D => L3b_L1_n_22, Q => L3b_L1_state(0), QN => L3b_L1_n_27);
  L3b_L1_state_reg_2 : DFD1BWP7T port map(CP => clk, D => L3b_L1_n_20, Q => L3b_L1_state(2), QN => L3b_L1_n_25);
  L3b_L1_state_reg_1 : DFD1BWP7T port map(CP => clk, D => L3b_L1_n_21, Q => L3b_L1_state(1), QN => L3b_L1_n_26);
  L3b_L1_g679 : OR2D1BWP7T port map(A1 => L3b_L1_n_1, A2 => L3b_L1_n_5, Z => L3b_L1_n_36);
  L3b_L0_FF1_data_out_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost2(3), D => L3b_L0_FF1_n_0, Q => L3b_L0_data_intermediate(3));
  L3b_L0_FF1_data_out_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost2(2), D => L3b_L0_FF1_n_0, Q => L3b_L0_data_intermediate(2));
  L3b_L0_FF1_data_out_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost2(0), D => L3b_L0_FF1_n_0, Q => L3b_L0_data_intermediate(0));
  L3b_L0_FF1_data_out_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => dir_ghost2(1), D => L3b_L0_FF1_n_0, Q => L3b_L0_data_intermediate(1));
  L3b_L0_FF1_g7 : INVD1BWP7T port map(I => score_reset_out, ZN => L3b_L0_FF1_n_0);
  L3b_L0_FF2_data_out_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => L3b_L0_data_intermediate(3), D => L3b_L0_FF2_n_0, Q => L3b_data_buffed(3));
  L3b_L0_FF2_data_out_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => L3b_L0_data_intermediate(2), D => L3b_L0_FF2_n_0, Q => L3b_data_buffed(2));
  L3b_L0_FF2_data_out_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => L3b_L0_data_intermediate(0), D => L3b_L0_FF2_n_0, Q => L3b_data_buffed(0));
  L3b_L0_FF2_data_out_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => L3b_L0_data_intermediate(1), D => L3b_L0_FF2_n_0, Q => L3b_data_buffed(1));
  L3b_L0_FF2_g7 : INVD1BWP7T port map(I => score_reset_out, ZN => L3b_L0_FF2_n_0);

end synthesised;
