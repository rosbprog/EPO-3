
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture routed of video_system is

  component counter
    port(clk                            : in  std_logic;
         county                         : out std_logic_vector(2 downto 0);
         dual_pixel_y                   : out std_logic;
         current_block_horizontal       : out std_logic_vector(4 downto 0);
         current_block_vertical         : out std_logic_vector(4 downto 0);
         reset_dual_pixel_y             : in  std_logic;
         reset_current_block_horizontal : in  std_logic;
         reset_current_block_vertical   : in  std_logic;
         reset_county                   : in  std_logic;
         en_county                      : in  std_logic;
         en_current_block_horizontal    : in  std_logic;
         en_current_block_vertical      : in  std_logic;
         en_dual_pixel_y                : in  std_logic);
  end component;

  component DEL01BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component BUFFD2BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component DEL02BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD0BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component CKBD10BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component ND2D5BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D8BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OA32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI31D1BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IIND4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFXD1BWP7T
    port(CP, DA, DB, SA : in std_logic; Q, QN : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OR3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  signal FE_PHN19_n_64, FE_PHN18_n_61, FE_PHN17_n_63, FE_PHN16_n_60, FE_PHN15_n_59 : std_logic;
  signal FE_PHN14_vgacontrol_vcount_0, FE_PHN13_vgacontrol_vcount_8, FE_PHN12_vgacontrol_vcount_4, FE_PHN11_vidcontrol_pixel_arr_buffer_2, FE_PHN10_n_1 : std_logic;
  signal FE_PHN9_vgacontrol_hcount_9, FE_PHN8_vgacontrol_vcount_2, FE_PHN7_vidcontrol_pixel_arr_buffer_6, FE_PHN6_n_4, FE_PHN5_vidcontrol_pixel_arr_buffer_4 : std_logic;
  signal FE_PHN4_vidcontrol_pixel_arr_buffer_5, FE_PHN3_vidcontrol_pixel_arr_buffer_1, FE_PHN2_vidcontrol_pixel_arr_buffer_7, FE_PHN1_vidcontrol_pixel_arr_buffer_0, FE_PHN0_vidcontrol_pixel_arr_buffer_3 : std_logic;
  signal CTS_6 : std_logic;
  signal county : std_logic_vector(2 downto 0);
  signal current_block_horizontal : std_logic_vector(4 downto 0);
  signal current_block_vertical : std_logic_vector(4 downto 0);
  signal vgacontrol_vcount : std_logic_vector(9 downto 0);
  signal vgacontrol_hcount : std_logic_vector(9 downto 0);
  signal colour : std_logic_vector(2 downto 0);
  signal pixel_array : std_logic_vector(7 downto 0);
  signal sprite_colour : std_logic_vector(2 downto 0);
  signal vidcontrol_pixel_arr_buffer : std_logic_vector(7 downto 0);
  signal vidcontrol_state : std_logic_vector(3 downto 0);
  signal dual_pixel_y, en_county, en_current_block_horizontal, en_current_block_vertical, en_dual_pixel_y : std_logic;
  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5, n_6, n_7, n_8, n_9 : std_logic;
  signal n_10, n_11, n_12, n_13, n_14 : std_logic;
  signal n_15, n_16, n_17, n_18, n_19 : std_logic;
  signal n_20, n_21, n_22, n_23, n_24 : std_logic;
  signal n_25, n_26, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33, n_34, n_35 : std_logic;
  signal n_36, n_37, n_38, n_39, n_40 : std_logic;
  signal n_41, n_42, n_43, n_44, n_45 : std_logic;
  signal n_46, n_47, n_48, n_49, n_50 : std_logic;
  signal n_51, n_52, n_53, n_54, n_55 : std_logic;
  signal n_56, n_57, n_58, n_59, n_60 : std_logic;
  signal n_61, n_62, n_63, n_64, n_65 : std_logic;
  signal n_66, n_67, n_68, n_69, n_70 : std_logic;
  signal n_71, n_72, n_73, n_74, n_75 : std_logic;
  signal n_76, n_77, n_78, n_79, n_81 : std_logic;
  signal n_82, n_83, n_85, n_86, n_105 : std_logic;
  signal reset_county, reset_current_block_horizontal, reset_current_block_vertical, reset_dual_pixel_y, sprites_n_0 : std_logic;
  signal sprites_n_2, sprites_n_3, sprites_n_4, sprites_n_5, sprites_n_6 : std_logic;
  signal sprites_n_7, sprites_n_9, sprites_n_10, sprites_n_12, sprites_n_13 : std_logic;
  signal sprites_n_15, sprites_n_16, sprites_n_17, sprites_n_18, sprites_n_19 : std_logic;
  signal sprites_n_20, sprites_n_21, sprites_n_22, sprites_n_23, sprites_n_26 : std_logic;
  signal vidcontrol_n_1, vidcontrol_n_2, vidcontrol_n_3, vidcontrol_n_4, vidcontrol_n_5 : std_logic;
  signal vidcontrol_n_6, vidcontrol_n_7, vidcontrol_n_8, vidcontrol_n_9, vidcontrol_n_10 : std_logic;
  signal vidcontrol_n_11, vidcontrol_n_12, vidcontrol_n_14, vidcontrol_n_15, vidcontrol_n_16 : std_logic;
  signal vidcontrol_n_17, vidcontrol_n_19, vidcontrol_n_20, vidcontrol_n_21, vidcontrol_n_22 : std_logic;
  signal vidcontrol_n_23, vidcontrol_n_24, vidcontrol_n_25, vidcontrol_n_26, vidcontrol_n_27 : std_logic;
  signal vidcontrol_n_28, vidcontrol_n_29, vidcontrol_n_30, vidcontrol_n_31, vidcontrol_n_32 : std_logic;
  signal vidcontrol_n_33, vidcontrol_n_34, vidcontrol_n_35, vidcontrol_n_36, vidcontrol_n_37 : std_logic;
  signal vidcontrol_n_38, vidcontrol_n_39, vidcontrol_n_40, vidcontrol_n_41, vidcontrol_n_42 : std_logic;
  signal vidcontrol_n_43, vidcontrol_n_44, vidcontrol_n_45, vidcontrol_n_61, vidcontrol_n_62 : std_logic;
  signal vidcontrol_n_63, vidcontrol_n_64, vidcontrol_n_65, vidcontrol_n_66, vidcontrol_n_67 : std_logic;
  signal vidcontrol_n_68, vidcontrol_n_104, vidcontrol_n_108, vidcontrol_n_109 : std_logic;

begin

  FE_PHC19_n_64 : DEL01BWP7T port map(I => FE_PHN19_n_64, Z => n_64);
  FE_PHC18_n_61 : BUFFD2BWP7T port map(I => n_61, Z => FE_PHN18_n_61);
  FE_PHC17_n_63 : DEL01BWP7T port map(I => n_63, Z => FE_PHN17_n_63);
  FE_PHC16_n_60 : DEL01BWP7T port map(I => FE_PHN16_n_60, Z => n_60);
  FE_PHC15_n_59 : DEL01BWP7T port map(I => n_59, Z => FE_PHN15_n_59);
  FE_PHC14_vgacontrol_vcount_0 : BUFFD2BWP7T port map(I => FE_PHN14_vgacontrol_vcount_0, Z => vgacontrol_vcount(0));
  FE_PHC13_vgacontrol_vcount_8 : DEL01BWP7T port map(I => vgacontrol_vcount(8), Z => FE_PHN13_vgacontrol_vcount_8);
  FE_PHC12_vgacontrol_vcount_4 : DEL02BWP7T port map(I => FE_PHN12_vgacontrol_vcount_4, Z => vgacontrol_vcount(4));
  FE_PHC11_vidcontrol_pixel_arr_buffer_2 : DEL01BWP7T port map(I => FE_PHN11_vidcontrol_pixel_arr_buffer_2, Z => vidcontrol_pixel_arr_buffer(2));
  FE_PHC10_n_1 : DEL01BWP7T port map(I => n_1, Z => FE_PHN10_n_1);
  FE_PHC9_vgacontrol_hcount_9 : DEL01BWP7T port map(I => vgacontrol_hcount(9), Z => FE_PHN9_vgacontrol_hcount_9);
  FE_PHC8_vgacontrol_vcount_2 : DEL01BWP7T port map(I => vgacontrol_vcount(2), Z => FE_PHN8_vgacontrol_vcount_2);
  FE_PHC7_vidcontrol_pixel_arr_buffer_6 : DEL01BWP7T port map(I => vidcontrol_pixel_arr_buffer(6), Z => FE_PHN7_vidcontrol_pixel_arr_buffer_6);
  FE_PHC6_n_4 : DEL01BWP7T port map(I => n_4, Z => FE_PHN6_n_4);
  FE_PHC5_vidcontrol_pixel_arr_buffer_4 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(4), Z => FE_PHN5_vidcontrol_pixel_arr_buffer_4);
  FE_PHC4_vidcontrol_pixel_arr_buffer_5 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(5), Z => FE_PHN4_vidcontrol_pixel_arr_buffer_5);
  FE_PHC3_vidcontrol_pixel_arr_buffer_1 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(1), Z => FE_PHN3_vidcontrol_pixel_arr_buffer_1);
  FE_PHC2_vidcontrol_pixel_arr_buffer_7 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(7), Z => FE_PHN2_vidcontrol_pixel_arr_buffer_7);
  FE_PHC1_vidcontrol_pixel_arr_buffer_0 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(0), Z => FE_PHN1_vidcontrol_pixel_arr_buffer_0);
  FE_PHC0_vidcontrol_pixel_arr_buffer_3 : CKBD0BWP7T port map(I => vidcontrol_pixel_arr_buffer(3), Z => FE_PHN0_vidcontrol_pixel_arr_buffer_3);
  CTS_ccl_a_BUF_clk_G0_L1_1 : CKBD10BWP7T port map(I => clk, Z => CTS_6);
  cnt : counter port map(clk => clk, county => county, dual_pixel_y => dual_pixel_y, current_block_horizontal => current_block_horizontal, current_block_vertical => current_block_vertical, reset_dual_pixel_y => reset_dual_pixel_y, reset_current_block_horizontal => reset_current_block_horizontal, reset_current_block_vertical => reset_current_block_vertical, reset_county => reset_county, en_county => en_county, en_current_block_horizontal => en_current_block_horizontal, en_current_block_vertical => en_current_block_vertical, en_dual_pixel_y => en_dual_pixel_y);
  g1331 : ND2D5BWP7T port map(A1 => n_79, A2 => vgacontrol_vcount(3), ZN => v_sync);
  g1332 : NR4D0BWP7T port map(A1 => n_75, A2 => n_71, A3 => vgacontrol_vcount(9), A4 => vgacontrol_vcount(2), ZN => n_79);
  g1333 : INR4D0BWP7T port map(A1 => vgacontrol_hcount(5), B1 => vgacontrol_hcount(4), B2 => vgacontrol_hcount(8), B3 => n_74, ZN => n_85);
  g1334 : CKAN2D8BWP7T port map(A1 => colour(2), A2 => n_77, Z => red);
  g1335 : CKAN2D8BWP7T port map(A1 => colour(1), A2 => n_77, Z => green);
  g1336 : CKAN2D8BWP7T port map(A1 => colour(0), A2 => n_77, Z => blue);
  g1337 : CKAN2D8BWP7T port map(A1 => n_76, A2 => n_72, Z => calc_start);
  g1338 : ND2D5BWP7T port map(A1 => n_78, A2 => vgacontrol_hcount(6), ZN => h_sync);
  g1339 : AN3D1BWP7T port map(A1 => n_70, A2 => n_67, A3 => vgacontrol_hcount(8), Z => n_78);
  g1340 : INR4D0BWP7T port map(A1 => n_68, B1 => vgacontrol_vcount(9), B2 => vgacontrol_vcount(2), B3 => vgacontrol_vcount(3), ZN => n_76);
  g1341 : AOI211XD0BWP7T port map(A1 => n_69, A2 => n_66, B => n_72, C => vgacontrol_vcount(9), ZN => n_77);
  g1342 : IND2D1BWP7T port map(A1 => n_82, B1 => vgacontrol_vcount(1), ZN => n_75);
  g1343 : ND2D1BWP7T port map(A1 => n_73, A2 => vgacontrol_hcount(3), ZN => n_74);
  g1344 : NR4D0BWP7T port map(A1 => n_69, A2 => vgacontrol_hcount(2), A3 => vgacontrol_hcount(0), A4 => vgacontrol_hcount(1), ZN => n_73);
  g1345 : AN3D1BWP7T port map(A1 => n_83, A2 => vgacontrol_vcount(7), A3 => vgacontrol_vcount(6), Z => n_82);
  g1346 : INVD1BWP7T port map(I => n_71, ZN => n_72);
  g1347 : OA32D1BWP7T port map(A1 => vgacontrol_hcount(5), A2 => vgacontrol_hcount(4), A3 => vgacontrol_hcount(3), B1 => n_65, B2 => n_81, Z => n_70);
  g1348 : ND4D0BWP7T port map(A1 => vgacontrol_vcount(5), A2 => vgacontrol_vcount(7), A3 => vgacontrol_vcount(6), A4 => FE_PHN13_vgacontrol_vcount_8, ZN => n_71);
  g1350 : NR3D0BWP7T port map(A1 => vgacontrol_vcount(1), A2 => vgacontrol_vcount(4), A3 => vgacontrol_vcount(0), ZN => n_68);
  g1351 : IND2D1BWP7T port map(A1 => vgacontrol_hcount(6), B1 => n_67, ZN => n_69);
  g1352 : CKAN2D1BWP7T port map(A1 => vgacontrol_vcount(3), A2 => vgacontrol_vcount(2), Z => n_86);
  g1353 : NR2XD0BWP7T port map(A1 => vgacontrol_hcount(9), A2 => vgacontrol_hcount(7), ZN => n_67);
  g1354 : OR2D1BWP7T port map(A1 => vgacontrol_hcount(8), A2 => vgacontrol_hcount(9), Z => n_66);
  g1355 : AN2D1BWP7T port map(A1 => vgacontrol_vcount(5), A2 => vgacontrol_vcount(4), Z => n_83);
  g1356 : ND2D1BWP7T port map(A1 => vgacontrol_hcount(5), A2 => vgacontrol_hcount(4), ZN => n_81);
  vgacontrol_hcount_reg_1 : DFKCNQD1BWP7T port map(CN => n_10, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(1));
  vgacontrol_hcount_reg_2 : DFKCNQD1BWP7T port map(CN => n_16, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(2));
  vgacontrol_hcount_reg_4 : DFKCNQD1BWP7T port map(CN => n_29, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(4));
  vgacontrol_hcount_reg_5 : DFKCNQD1BWP7T port map(CN => n_43, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(5));
  vgacontrol_hcount_reg_6 : DFKCNQD1BWP7T port map(CN => n_34, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(6));
  vgacontrol_hcount_reg_7 : DFKCNQD1BWP7T port map(CN => n_33, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(7));
  vgacontrol_hcount_reg_8 : DFKCNQD1BWP7T port map(CN => n_30, CP => CTS_6, D => n_51, Q => vgacontrol_hcount(8));
  vgacontrol_hcount_reg_9 : DFKCNQD1BWP7T port map(CN => n_30, CP => CTS_6, D => n_62, Q => vgacontrol_hcount(9));
  vgacontrol_vcount_reg_0 : DFQD1BWP7T port map(CP => CTS_6, D => n_40, Q => FE_PHN14_vgacontrol_vcount_0);
  vgacontrol_vcount_reg_3 : DFQD1BWP7T port map(CP => CTS_6, D => n_55, Q => vgacontrol_vcount(3));
  vgacontrol_vcount_reg_5 : DFQD1BWP7T port map(CP => CTS_6, D => FE_PHN15_n_59, Q => vgacontrol_vcount(5));
  vgacontrol_vcount_reg_7 : DFQD1BWP7T port map(CP => CTS_6, D => FE_PHN17_n_63, Q => vgacontrol_vcount(7));
  vgacontrol_vcount_reg_9 : DFQD1BWP7T port map(CP => CTS_6, D => n_64, Q => vgacontrol_vcount(9));
  g2341 : MOAI22D0BWP7T port map(A1 => n_41, A2 => n_12, B1 => n_56, B2 => vgacontrol_vcount(9), ZN => FE_PHN19_n_64);
  g2342 : MOAI22D0BWP7T port map(A1 => n_41, A2 => n_11, B1 => n_57, B2 => vgacontrol_vcount(7), ZN => n_63);
  g2343 : MOAI22D0BWP7T port map(A1 => n_50, A2 => FE_PHN9_vgacontrol_hcount_9, B1 => n_50, B2 => vgacontrol_hcount(9), ZN => n_62);
  g2347 : MOAI22D0BWP7T port map(A1 => n_41, A2 => n_7, B1 => n_52, B2 => vgacontrol_vcount(6), ZN => n_61);
  g2348 : MOAI22D0BWP7T port map(A1 => n_41, A2 => n_9, B1 => n_53, B2 => FE_PHN13_vgacontrol_vcount_8, ZN => FE_PHN16_n_60);
  g2349 : OAI31D0BWP7T port map(A1 => vgacontrol_vcount(5), A2 => n_2, A3 => n_41, B => n_58, ZN => n_59);
  g2350 : OAI21D0BWP7T port map(A1 => n_49, A2 => n_36, B => vgacontrol_vcount(5), ZN => n_58);
  g2351 : AO21D0BWP7T port map(A1 => n_32, A2 => n_6, B => n_52, Z => n_57);
  g2353 : AO21D0BWP7T port map(A1 => n_32, A2 => n_5, B => n_53, Z => n_56);
  g2354 : AO22D0BWP7T port map(A1 => n_47, A2 => vgacontrol_vcount(3), B1 => vgacontrol_vcount(2), B2 => n_39, Z => n_55);
  g2355 : MOAI22D0BWP7T port map(A1 => n_41, A2 => vgacontrol_vcount(4), B1 => n_49, B2 => vgacontrol_vcount(4), ZN => n_54);
  g2358 : MOAI22D0BWP7T port map(A1 => n_45, A2 => vgacontrol_hcount(8), B1 => n_45, B2 => vgacontrol_hcount(8), ZN => n_51);
  g2359 : OAI21D0BWP7T port map(A1 => n_31, A2 => n_82, B => n_48, ZN => n_53);
  g2360 : OAI21D0BWP7T port map(A1 => n_31, A2 => n_83, B => n_48, ZN => n_52);
  g2361 : IND2D1BWP7T port map(A1 => n_45, B1 => vgacontrol_hcount(8), ZN => n_50);
  g2363 : INVD0BWP7T port map(I => n_48, ZN => n_49);
  g2364 : AO21D0BWP7T port map(A1 => n_32, A2 => n_3, B => n_44, Z => n_47);
  g2365 : MOAI22D0BWP7T port map(A1 => n_42, A2 => FE_PHN6_n_4, B1 => n_38, B2 => vgacontrol_vcount(0), ZN => n_46);
  g2366 : IAO21D0BWP7T port map(A1 => n_31, A2 => n_86, B => n_44, ZN => n_48);
  g2370 : MOAI22D0BWP7T port map(A1 => n_28, A2 => vgacontrol_hcount(5), B1 => n_28, B2 => vgacontrol_hcount(5), ZN => n_43);
  g2371 : ND3D0BWP7T port map(A1 => n_25, A2 => vgacontrol_hcount(6), A3 => vgacontrol_hcount(7), ZN => n_45);
  g2372 : IND2D1BWP7T port map(A1 => n_38, B1 => n_42, ZN => n_44);
  g2377 : AO21D0BWP7T port map(A1 => n_26, A2 => vgacontrol_vcount(0), B => n_37, Z => n_40);
  g2378 : INR2D1BWP7T port map(A1 => n_35, B1 => vgacontrol_vcount(3), ZN => n_39);
  g2379 : NR2XD0BWP7T port map(A1 => n_37, A2 => n_26, ZN => n_42);
  g2380 : ND2D1BWP7T port map(A1 => n_35, A2 => n_86, ZN => n_41);
  g2381 : NR2XD0BWP7T port map(A1 => n_31, A2 => vgacontrol_vcount(4), ZN => n_36);
  g2382 : NR2D1BWP7T port map(A1 => n_31, A2 => vgacontrol_vcount(1), ZN => n_38);
  g2383 : NR2D1BWP7T port map(A1 => n_31, A2 => vgacontrol_vcount(0), ZN => n_37);
  g2384 : CKXOR2D1BWP7T port map(A1 => n_25, A2 => vgacontrol_hcount(6), Z => n_34);
  g2385 : MOAI22D0BWP7T port map(A1 => n_105, A2 => vgacontrol_hcount(7), B1 => n_105, B2 => vgacontrol_hcount(7), ZN => n_33);
  g2386 : AN3D1BWP7T port map(A1 => n_32, A2 => vgacontrol_vcount(1), A3 => vgacontrol_vcount(0), Z => n_35);
  g2387 : INVD1BWP7T port map(I => n_32, ZN => n_31);
  g2388 : AOI211XD0BWP7T port map(A1 => n_22, A2 => n_5, B => n_23, C => reset, ZN => n_32);
  g2389 : MOAI22D0BWP7T port map(A1 => n_20, A2 => vgacontrol_hcount(4), B1 => n_20, B2 => vgacontrol_hcount(4), ZN => n_29);
  g2390 : AOI31D1BWP7T port map(A1 => n_14, A2 => n_24, A3 => vgacontrol_hcount(7), B => reset, ZN => n_30);
  g2391 : ND2D1BWP7T port map(A1 => n_24, A2 => vgacontrol_hcount(4), ZN => n_28);
  g2393 : INR2D1BWP7T port map(A1 => n_23, B1 => reset, ZN => n_26);
  g2394 : NR2XD0BWP7T port map(A1 => n_20, A2 => n_81, ZN => n_25);
  g2395 : INVD1BWP7T port map(I => n_20, ZN => n_24);
  g2396 : IND4D0BWP7T port map(A1 => vgacontrol_hcount(7), B1 => vgacontrol_hcount(4), B2 => vgacontrol_hcount(6), B3 => n_19, ZN => n_23);
  g2397 : AN4D1BWP7T port map(A1 => n_17, A2 => n_2, A3 => n_6, A4 => vgacontrol_vcount(2), Z => n_22);
  g2398 : MOAI22D0BWP7T port map(A1 => n_15, A2 => vgacontrol_hcount(3), B1 => n_15, B2 => vgacontrol_hcount(3), ZN => n_21);
  g2399 : IND2D1BWP7T port map(A1 => n_15, B1 => vgacontrol_hcount(3), ZN => n_20);
  g2400 : NR2XD0BWP7T port map(A1 => n_18, A2 => n_1, ZN => n_19);
  g2401 : IND4D0BWP7T port map(A1 => vgacontrol_hcount(1), B1 => vgacontrol_hcount(2), B2 => vgacontrol_hcount(3), B3 => n_0, ZN => n_18);
  g2402 : NR3D0BWP7T port map(A1 => n_13, A2 => vgacontrol_vcount(1), A3 => vgacontrol_vcount(0), ZN => n_17);
  g2403 : MOAI22D0BWP7T port map(A1 => n_8, A2 => vgacontrol_hcount(2), B1 => n_8, B2 => vgacontrol_hcount(2), ZN => n_16);
  g2404 : IND2D1BWP7T port map(A1 => n_8, B1 => vgacontrol_hcount(2), ZN => n_15);
  g2405 : INR3D0BWP7T port map(A1 => n_0, B1 => vgacontrol_hcount(6), B2 => vgacontrol_hcount(4), ZN => n_14);
  g2406 : IIND4D0BWP7T port map(A1 => vgacontrol_vcount(7), A2 => vgacontrol_vcount(5), B1 => vgacontrol_vcount(3), B2 => vgacontrol_vcount(9), ZN => n_13);
  g2407 : IND3D1BWP7T port map(A1 => vgacontrol_vcount(9), B1 => FE_PHN13_vgacontrol_vcount_8, B2 => n_82, ZN => n_12);
  g2409 : IND3D1BWP7T port map(A1 => vgacontrol_vcount(7), B1 => vgacontrol_vcount(6), B2 => n_83, ZN => n_11);
  g2410 : MOAI22D0BWP7T port map(A1 => n_1, A2 => vgacontrol_hcount(1), B1 => n_1, B2 => vgacontrol_hcount(1), ZN => n_10);
  g2411 : ND2D0BWP7T port map(A1 => n_82, A2 => n_5, ZN => n_9);
  g2412 : ND2D1BWP7T port map(A1 => n_83, A2 => n_6, ZN => n_7);
  g2413 : ND2D1BWP7T port map(A1 => vgacontrol_hcount(0), A2 => vgacontrol_hcount(1), ZN => n_8);
  g2 : INR3D0BWP7T port map(A1 => vgacontrol_hcount(8), B1 => vgacontrol_hcount(5), B2 => vgacontrol_hcount(9), ZN => n_0);
  vgacontrol_hcount_reg_3 : DFKCND1BWP7T port map(CN => n_21, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(3), QN => n_65);
  vgacontrol_vcount_reg_1 : DFD1BWP7T port map(CP => CTS_6, D => n_46, Q => vgacontrol_vcount(1), QN => n_4);
  vgacontrol_vcount_reg_2 : DFXD1BWP7T port map(CP => CTS_6, DA => n_44, DB => n_35, Q => vgacontrol_vcount(2), QN => n_3, SA => FE_PHN8_vgacontrol_vcount_2);
  vgacontrol_vcount_reg_4 : DFD1BWP7T port map(CP => CTS_6, D => n_54, Q => FE_PHN12_vgacontrol_vcount_4, QN => n_2);
  vgacontrol_vcount_reg_6 : DFD1BWP7T port map(CP => CTS_6, D => FE_PHN18_n_61, Q => vgacontrol_vcount(6), QN => n_6);
  vgacontrol_vcount_reg_8 : DFD1BWP7T port map(CP => CTS_6, D => n_60, Q => vgacontrol_vcount(8), QN => n_5);
  vgacontrol_hcount_reg_0 : DFKCND1BWP7T port map(CN => FE_PHN10_n_1, CP => CTS_6, D => n_30, Q => vgacontrol_hcount(0), QN => n_1);
  g2484 : IND3D1BWP7T port map(A1 => n_81, B1 => vgacontrol_hcount(6), B2 => n_24, ZN => n_105);
  sprites_g565 : AO211D0BWP7T port map(A1 => sprites_n_5, A2 => sprites_n_13, B => sprites_n_26, C => sprites_n_20, Z => pixel_array(2));
  sprites_g566 : OR3D1BWP7T port map(A1 => sprites_n_13, A2 => sprites_n_20, A3 => sprites_n_26, Z => pixel_array(5));
  sprites_g567 : IND3D1BWP7T port map(A1 => sprites_n_20, B1 => sprites_n_4, B2 => sprites_n_22, ZN => pixel_array(3));
  sprites_g568 : AO211D0BWP7T port map(A1 => sprites_n_15, A2 => county(1), B => sprites_n_20, C => sprites_n_12, Z => pixel_array(4));
  sprites_g569 : OAI31D0BWP7T port map(A1 => county(2), A2 => sprites_n_3, A3 => sprites_n_5, B => sprites_n_23, ZN => sprites_n_26);
  sprites_g570 : OR2D1BWP7T port map(A1 => sprites_n_21, A2 => cell_type(2), Z => pixel_array(6));
  sprites_g571 : OAI221D0BWP7T port map(A1 => sprite_colour(0), A2 => sprites_n_18, B1 => county(0), B2 => sprites_n_19, C => sprites_n_2, ZN => pixel_array(1));
  sprites_g572 : MAOI22D0BWP7T port map(A1 => sprites_n_16, A2 => county(1), B1 => sprites_n_17, B2 => sprites_n_9, ZN => sprites_n_23);
  sprites_g573 : MAOI22D0BWP7T port map(A1 => sprites_n_15, A2 => county(2), B1 => sprites_n_9, B2 => sprites_n_16, ZN => sprites_n_22);
  sprites_g574 : AO32D1BWP7T port map(A1 => sprites_n_0, A2 => sprites_n_3, A3 => county(1), B1 => sprites_n_7, B2 => sprites_n_12, Z => sprites_n_21);
  sprites_g575 : OAI31D0BWP7T port map(A1 => county(1), A2 => sprites_n_3, A3 => sprite_colour(0), B => sprites_n_2, ZN => sprites_n_20);
  sprites_g576 : ND2D0BWP7T port map(A1 => sprites_n_0, A2 => county(2), ZN => sprites_n_19);
  sprites_g577 : OA21D0BWP7T port map(A1 => sprites_n_4, A2 => sprites_n_3, B => sprites_n_9, Z => sprites_n_18);
  sprites_g578 : AOI21D0BWP7T port map(A1 => sprite_colour(0), A2 => county(0), B => sprites_n_15, ZN => sprites_n_17);
  sprites_g579 : NR2XD0BWP7T port map(A1 => sprites_n_6, A2 => cell_type(2), ZN => sprite_colour(1));
  sprites_g580 : NR2D0BWP7T port map(A1 => sprites_n_5, A2 => county(0), ZN => sprites_n_16);
  sprites_g581 : NR2D0BWP7T port map(A1 => sprite_colour(0), A2 => county(0), ZN => sprites_n_15);
  sprites_g582 : NR2XD0BWP7T port map(A1 => sprites_n_10, A2 => cell_type(2), ZN => sprite_colour(2));
  sprites_g583 : NR2D0BWP7T port map(A1 => sprites_n_4, A2 => county(0), ZN => sprites_n_13);
  sprites_g584 : ND2D0BWP7T port map(A1 => sprites_n_9, A2 => sprites_n_4, ZN => sprites_n_12);
  sprites_g587 : INVD0BWP7T port map(I => sprite_colour(0), ZN => sprites_n_7);
  sprites_g588 : INR2D1BWP7T port map(A1 => cell_type(1), B1 => cell_type(0), ZN => sprites_n_10);
  sprites_g589 : IND2D0BWP7T port map(A1 => county(2), B1 => county(1), ZN => sprites_n_9);
  sprites_g590 : NR2XD0BWP7T port map(A1 => cell_type(0), A2 => cell_type(1), ZN => sprite_colour(0));
  sprites_g591 : INR2D1BWP7T port map(A1 => cell_type(0), B1 => cell_type(1), ZN => sprites_n_6);
  sprites_g592 : CKND2D0BWP7T port map(A1 => cell_type(1), A2 => cell_type(0), ZN => sprites_n_5);
  sprites_g593 : IND2D0BWP7T port map(A1 => county(1), B1 => county(2), ZN => sprites_n_4);
  sprites_g594 : INVD1BWP7T port map(I => county(0), ZN => sprites_n_3);
  sprites_g595 : INVD0BWP7T port map(I => cell_type(2), ZN => sprites_n_2);
  sprites_g2 : OR2D1BWP7T port map(A1 => sprites_n_6, A2 => sprites_n_10, Z => sprites_n_0);
  vidcontrol_g2125 : OAI21D0BWP7T port map(A1 => vidcontrol_n_45, A2 => vidcontrol_n_40, B => vidcontrol_n_37, ZN => reset_current_block_vertical);
  vidcontrol_g2126 : CKAN2D1BWP7T port map(A1 => vidcontrol_n_44, A2 => sprite_colour(2), Z => colour(2));
  vidcontrol_g2127 : CKAN2D1BWP7T port map(A1 => vidcontrol_n_44, A2 => sprite_colour(1), Z => colour(1));
  vidcontrol_g2128 : CKAN2D1BWP7T port map(A1 => vidcontrol_n_44, A2 => sprite_colour(0), Z => colour(0));
  vidcontrol_g2129 : ND2D0BWP7T port map(A1 => vidcontrol_n_37, A2 => vidcontrol_n_45, ZN => reset_county);
  vidcontrol_g2130 : INR2D0BWP7T port map(A1 => vidcontrol_n_40, B1 => vidcontrol_n_45, ZN => en_current_block_vertical);
  vidcontrol_g2131 : ND2D0BWP7T port map(A1 => vidcontrol_n_37, A2 => vidcontrol_n_43, ZN => reset_dual_pixel_y);
  vidcontrol_g2132 : OR2D0BWP7T port map(A1 => vidcontrol_n_43, A2 => vidcontrol_n_35, Z => vidcontrol_n_45);
  vidcontrol_g2133 : INR2D0BWP7T port map(A1 => vidcontrol_n_35, B1 => vidcontrol_n_43, ZN => en_county);
  vidcontrol_g2134 : ND3D0BWP7T port map(A1 => vidcontrol_n_42, A2 => vidcontrol_n_39, A3 => vidcontrol_n_38, ZN => vidcontrol_n_44);
  vidcontrol_g2135 : IND2D0BWP7T port map(A1 => vidcontrol_n_41, B1 => vidcontrol_n_37, ZN => reset_current_block_horizontal);
  vidcontrol_g2136 : ND2D0BWP7T port map(A1 => vidcontrol_n_41, A2 => dual_pixel_y, ZN => vidcontrol_n_43);
  vidcontrol_g2137 : INR2D0BWP7T port map(A1 => vidcontrol_n_41, B1 => dual_pixel_y, ZN => en_dual_pixel_y);
  vidcontrol_g2138 : AOI222D0BWP7T port map(A1 => vidcontrol_n_36, A2 => vidcontrol_n_29, B1 => vidcontrol_n_67, B2 => vidcontrol_pixel_arr_buffer(0), C1 => vidcontrol_n_61, C2 => vidcontrol_pixel_arr_buffer(7), ZN => vidcontrol_n_42);
  vidcontrol_g2139 : AN2D1BWP7T port map(A1 => vidcontrol_n_61, A2 => vidcontrol_n_104, Z => vidcontrol_n_41);
  vidcontrol_g2140 : INR2D0BWP7T port map(A1 => vidcontrol_n_61, B1 => vidcontrol_n_104, ZN => en_current_block_horizontal);
  vidcontrol_g2141 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_horizontal(2), Z => xcoordinates(2));
  vidcontrol_g2142 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_vertical(1), Z => ycoordinates(1));
  vidcontrol_g2143 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_vertical(0), Z => ycoordinates(0));
  vidcontrol_g2144 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_horizontal(3), Z => xcoordinates(3));
  vidcontrol_g2145 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_horizontal(4), Z => xcoordinates(4));
  vidcontrol_g2146 : ND4D0BWP7T port map(A1 => vidcontrol_n_34, A2 => current_block_vertical(0), A3 => current_block_vertical(1), A4 => current_block_vertical(2), ZN => vidcontrol_n_40);
  vidcontrol_g2147 : AN4D1BWP7T port map(A1 => vidcontrol_n_33, A2 => current_block_horizontal(0), A3 => current_block_horizontal(1), A4 => current_block_horizontal(2), Z => vidcontrol_n_104);
  vidcontrol_g2148 : AOI22D0BWP7T port map(A1 => vidcontrol_n_64, A2 => vidcontrol_pixel_arr_buffer(4), B1 => vidcontrol_n_63, B2 => vidcontrol_pixel_arr_buffer(5), ZN => vidcontrol_n_39);
  vidcontrol_g2149 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_horizontal(0), Z => xcoordinates(0));
  vidcontrol_g2150 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_vertical(4), Z => ycoordinates(4));
  vidcontrol_g2151 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_vertical(3), Z => ycoordinates(3));
  vidcontrol_g2152 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_vertical(2), Z => ycoordinates(2));
  vidcontrol_g2153 : AOI22D0BWP7T port map(A1 => vidcontrol_n_66, A2 => vidcontrol_pixel_arr_buffer(1), B1 => vidcontrol_n_65, B2 => vidcontrol_pixel_arr_buffer(3), ZN => vidcontrol_n_38);
  vidcontrol_g2154 : CKAN2D8BWP7T port map(A1 => vidcontrol_n_37, A2 => current_block_horizontal(1), Z => xcoordinates(1));
  vidcontrol_g2156 : ND2D1BWP7T port map(A1 => vidcontrol_n_68, A2 => vidcontrol_n_29, ZN => vidcontrol_n_37);
  vidcontrol_g2157 : AO32D1BWP7T port map(A1 => vidcontrol_n_30, A2 => vidcontrol_state(2), A3 => vidcontrol_pixel_arr_buffer(2), B1 => vidcontrol_state(3), B2 => vidcontrol_pixel_arr_buffer(6), Z => vidcontrol_n_36);
  vidcontrol_g2158 : NR2XD0BWP7T port map(A1 => vidcontrol_n_31, A2 => vidcontrol_state(0), ZN => vidcontrol_n_64);
  vidcontrol_g2159 : NR2XD0BWP7T port map(A1 => vidcontrol_n_32, A2 => vidcontrol_n_29, ZN => vidcontrol_n_66);
  vidcontrol_g2160 : NR2XD0BWP7T port map(A1 => vidcontrol_n_32, A2 => vidcontrol_state(0), ZN => vidcontrol_n_67);
  vidcontrol_g2161 : AN3D1BWP7T port map(A1 => vidcontrol_n_30, A2 => vidcontrol_state(0), A3 => vidcontrol_state(2), Z => vidcontrol_n_65);
  vidcontrol_g2162 : NR3D0BWP7T port map(A1 => vidcontrol_state(2), A2 => vidcontrol_state(1), A3 => vidcontrol_state(3), ZN => vidcontrol_n_68);
  vidcontrol_g2163 : NR2XD0BWP7T port map(A1 => vidcontrol_n_31, A2 => vidcontrol_n_29, ZN => vidcontrol_n_63);
  vidcontrol_g2164 : ND3D0BWP7T port map(A1 => county(1), A2 => county(2), A3 => county(0), ZN => vidcontrol_n_35);
  vidcontrol_g2165 : INR2D0BWP7T port map(A1 => current_block_vertical(4), B1 => current_block_vertical(3), ZN => vidcontrol_n_34);
  vidcontrol_g2166 : INR2D0BWP7T port map(A1 => current_block_horizontal(4), B1 => current_block_horizontal(3), ZN => vidcontrol_n_33);
  vidcontrol_g2167 : INR2XD0BWP7T port map(A1 => vidcontrol_state(3), B1 => vidcontrol_state(0), ZN => vidcontrol_n_62);
  vidcontrol_g2168 : IND2D1BWP7T port map(A1 => vidcontrol_state(2), B1 => vidcontrol_state(1), ZN => vidcontrol_n_32);
  vidcontrol_g2169 : ND2D1BWP7T port map(A1 => vidcontrol_state(2), A2 => vidcontrol_state(1), ZN => vidcontrol_n_31);
  vidcontrol_g2170 : CKAN2D1BWP7T port map(A1 => vidcontrol_state(0), A2 => vidcontrol_state(3), Z => vidcontrol_n_61);
  vidcontrol_pixel_arr_buffer_reg_0 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_27, Q => vidcontrol_pixel_arr_buffer(0));
  vidcontrol_pixel_arr_buffer_reg_1 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_28, Q => vidcontrol_pixel_arr_buffer(1));
  vidcontrol_pixel_arr_buffer_reg_2 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_26, Q => FE_PHN11_vidcontrol_pixel_arr_buffer_2);
  vidcontrol_pixel_arr_buffer_reg_3 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_25, Q => vidcontrol_pixel_arr_buffer(3));
  vidcontrol_pixel_arr_buffer_reg_6 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_21, Q => vidcontrol_pixel_arr_buffer(6));
  vidcontrol_pixel_arr_buffer_reg_5 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_20, Q => vidcontrol_pixel_arr_buffer(5));
  vidcontrol_pixel_arr_buffer_reg_4 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_19, Q => vidcontrol_pixel_arr_buffer(4));
  vidcontrol_pixel_arr_buffer_reg_7 : DFQD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_22, Q => vidcontrol_pixel_arr_buffer(7));
  vidcontrol_g1795 : AO22D0BWP7T port map(A1 => vidcontrol_n_109, A2 => FE_PHN3_vidcontrol_pixel_arr_buffer_1, B1 => pixel_array(1), B2 => vidcontrol_n_17, Z => vidcontrol_n_28);
  vidcontrol_g1796 : AO22D0BWP7T port map(A1 => vidcontrol_n_109, A2 => FE_PHN1_vidcontrol_pixel_arr_buffer_0, B1 => cell_type(2), B2 => vidcontrol_n_17, Z => vidcontrol_n_27);
  vidcontrol_g1798 : AO22D0BWP7T port map(A1 => vidcontrol_n_109, A2 => vidcontrol_pixel_arr_buffer(2), B1 => pixel_array(2), B2 => vidcontrol_n_17, Z => vidcontrol_n_26);
  vidcontrol_g1799 : AO22D0BWP7T port map(A1 => vidcontrol_n_109, A2 => FE_PHN0_vidcontrol_pixel_arr_buffer_3, B1 => pixel_array(3), B2 => vidcontrol_n_17, Z => vidcontrol_n_25);
  vidcontrol_g1800 : OAI21D0BWP7T port map(A1 => vidcontrol_n_11, A2 => reset, B => vidcontrol_n_16, ZN => vidcontrol_n_24);
  vidcontrol_g1801 : MOAI22D0BWP7T port map(A1 => vidcontrol_n_10, A2 => reset, B1 => vidcontrol_n_12, B2 => vidcontrol_n_7, ZN => vidcontrol_n_23);
  vidcontrol_state_reg_2 : DFKCNQD1BWP7T port map(CN => vidcontrol_n_108, CP => CTS_6, D => vidcontrol_n_12, Q => vidcontrol_state(2));
  vidcontrol_state_reg_3 : DFKCNQD1BWP7T port map(CN => vidcontrol_n_5, CP => CTS_6, D => vidcontrol_n_12, Q => vidcontrol_state(3));
  vidcontrol_g1804 : AO22D0BWP7T port map(A1 => vidcontrol_n_15, A2 => FE_PHN2_vidcontrol_pixel_arr_buffer_7, B1 => cell_type(2), B2 => vidcontrol_n_14, Z => vidcontrol_n_22);
  vidcontrol_g1805 : AO22D0BWP7T port map(A1 => vidcontrol_n_15, A2 => FE_PHN7_vidcontrol_pixel_arr_buffer_6, B1 => pixel_array(6), B2 => vidcontrol_n_14, Z => vidcontrol_n_21);
  vidcontrol_g1806 : AO22D0BWP7T port map(A1 => vidcontrol_n_15, A2 => FE_PHN4_vidcontrol_pixel_arr_buffer_5, B1 => pixel_array(5), B2 => vidcontrol_n_14, Z => vidcontrol_n_20);
  vidcontrol_g1807 : AO22D0BWP7T port map(A1 => vidcontrol_n_15, A2 => FE_PHN5_vidcontrol_pixel_arr_buffer_4, B1 => pixel_array(4), B2 => vidcontrol_n_14, Z => vidcontrol_n_19);
  vidcontrol_g1809 : OAI31D0BWP7T port map(A1 => vidcontrol_n_65, A2 => vidcontrol_n_64, A3 => vidcontrol_n_67, B => vidcontrol_n_12, ZN => vidcontrol_n_16);
  vidcontrol_g1810 : IAO21D0BWP7T port map(A1 => vidcontrol_n_9, A2 => vidcontrol_n_68, B => reset, ZN => vidcontrol_n_17);
  vidcontrol_g1812 : INR2D1BWP7T port map(A1 => vidcontrol_n_8, B1 => reset, ZN => vidcontrol_n_15);
  vidcontrol_g1813 : NR2D1BWP7T port map(A1 => vidcontrol_n_8, A2 => reset, ZN => vidcontrol_n_14);
  vidcontrol_g1814 : AOI22D0BWP7T port map(A1 => n_85, A2 => vidcontrol_n_3, B1 => vidcontrol_n_61, B2 => vidcontrol_n_1, ZN => vidcontrol_n_11);
  vidcontrol_g1815 : MAOI22D0BWP7T port map(A1 => vidcontrol_n_61, A2 => vidcontrol_n_104, B1 => n_85, B2 => vidcontrol_n_2, ZN => vidcontrol_n_10);
  vidcontrol_g1816 : NR3D0BWP7T port map(A1 => vidcontrol_n_3, A2 => vidcontrol_n_61, A3 => reset, ZN => vidcontrol_n_12);
  vidcontrol_g1819 : NR3D0BWP7T port map(A1 => vidcontrol_n_66, A2 => vidcontrol_n_63, A3 => vidcontrol_n_65, ZN => vidcontrol_n_7);
  vidcontrol_g1820 : NR2XD0BWP7T port map(A1 => vidcontrol_n_4, A2 => vidcontrol_n_68, ZN => vidcontrol_n_8);
  vidcontrol_g1822 : IND2D1BWP7T port map(A1 => vidcontrol_state(3), B1 => vidcontrol_n_64, ZN => vidcontrol_n_6);
  vidcontrol_g1823 : OR2D1BWP7T port map(A1 => vidcontrol_n_63, A2 => vidcontrol_n_62, Z => vidcontrol_n_5);
  vidcontrol_g1824 : INVD0BWP7T port map(I => vidcontrol_n_2, ZN => vidcontrol_n_3);
  vidcontrol_g1825 : INR2XD0BWP7T port map(A1 => vidcontrol_n_67, B1 => vidcontrol_state(3), ZN => vidcontrol_n_4);
  vidcontrol_g1826 : ND2D1BWP7T port map(A1 => vidcontrol_n_68, A2 => vidcontrol_state(0), ZN => vidcontrol_n_2);
  vidcontrol_g1827 : CKND1BWP7T port map(I => vidcontrol_n_104, ZN => vidcontrol_n_1);
  vidcontrol_g2173 : INVD0BWP7T port map(I => vidcontrol_n_6, ZN => vidcontrol_n_9);
  vidcontrol_state_reg_1 : DFD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_24, Q => vidcontrol_state(1), QN => vidcontrol_n_30);
  vidcontrol_state_reg_0 : DFD1BWP7T port map(CP => CTS_6, D => vidcontrol_n_23, Q => vidcontrol_state(0), QN => vidcontrol_n_29);
  vidcontrol_g2179 : INR3D0BWP7T port map(A1 => vidcontrol_n_37, B1 => vidcontrol_n_5, B2 => vidcontrol_n_67, ZN => vidcontrol_n_108);
  vidcontrol_g2180 : INR3D0BWP7T port map(A1 => vidcontrol_n_6, B1 => vidcontrol_n_68, B2 => reset, ZN => vidcontrol_n_109);

end routed;
