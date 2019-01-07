
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of map_register is

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA33D0BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; Z : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AO33D0BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  signal row_cells : std_logic_vector(23 downto 0);
  signal RC1_n_2, RC1_n_3, RC1_n_4, RC1_n_5, RC1_n_6 : std_logic;
  signal RC1_n_7, RC1_n_8, RC1_n_9, RC1_n_10, RC1_n_11 : std_logic;
  signal RC1_n_12, RC1_n_13, RC1_n_14, RC1_n_15, RC1_n_16 : std_logic;
  signal RC1_n_19, RC1_n_21, RC1_n_22, RC1_n_24, n_0 : std_logic;
  signal n_1, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_9, n_10 : std_logic;
  signal n_11, n_12, n_13, n_14, n_15 : std_logic;
  signal n_16, n_17, n_18, n_19, n_20 : std_logic;
  signal n_21, n_22, n_23, n_24, n_25 : std_logic;
  signal n_26, n_27, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33 : std_logic;

begin

  g934 : OR2D4BWP7T port map(A1 => n_33, A2 => n_25, Z => wall_present);
  g935 : OAI211D0BWP7T port map(A1 => n_3, A2 => n_26, B => n_32, C => n_30, ZN => n_33);
  g936 : AOI211D0BWP7T port map(A1 => n_27, A2 => column_select(1), B => n_31, C => n_28, ZN => n_32);
  g937 : MOAI22D0BWP7T port map(A1 => n_23, A2 => n_1, B1 => n_29, B2 => n_6, ZN => n_31);
  g938 : OA33D0BWP7T port map(A1 => column_select(2), A2 => n_8, A3 => n_24, B1 => column_select(1), B2 => n_7, B3 => n_18, Z => n_30);
  g939 : OAI211D0BWP7T port map(A1 => column_select(1), A2 => n_13, B => n_21, C => n_19, ZN => n_29);
  g940 : OAI22D0BWP7T port map(A1 => n_20, A2 => n_3, B1 => n_22, B2 => n_1, ZN => n_28);
  g941 : AOI21D0BWP7T port map(A1 => n_17, A2 => n_12, B => n_5, ZN => n_27);
  g942 : AOI222D0BWP7T port map(A1 => row_cells(20), A2 => n_15, B1 => n_9, B2 => row_cells(23), C1 => row_cells(21), C2 => n_11, ZN => n_26);
  g943 : AO33D0BWP7T port map(A1 => row_cells(13), A2 => n_14, A3 => n_2, B1 => row_cells(20), B2 => n_10, B3 => n_6, Z => n_25);
  g944 : AN2D1BWP7T port map(A1 => n_16, A2 => n_12, Z => n_24);
  g945 : OAI21D0BWP7T port map(A1 => n_15, A2 => n_10, B => row_cells(12), ZN => n_23);
  g946 : AOI22D0BWP7T port map(A1 => row_cells(13), A2 => n_11, B1 => row_cells(15), B2 => n_9, ZN => n_22);
  g947 : AOI22D0BWP7T port map(A1 => row_cells(21), A2 => n_14, B1 => row_cells(19), B2 => n_15, ZN => n_21);
  g948 : AOI22D0BWP7T port map(A1 => row_cells(18), A2 => n_14, B1 => row_cells(19), B2 => n_10, ZN => n_20);
  g949 : AOI22D0BWP7T port map(A1 => row_cells(18), A2 => n_11, B1 => row_cells(16), B2 => n_9, ZN => n_19);
  g950 : AOI22D0BWP7T port map(A1 => row_cells(16), A2 => n_4, B1 => row_cells(15), B2 => n_2, ZN => n_18);
  g951 : AOI22D0BWP7T port map(A1 => row_cells(17), A2 => n_6, B1 => row_cells(22), B2 => n_4, ZN => n_17);
  g952 : AOI22D0BWP7T port map(A1 => row_cells(22), A2 => n_6, B1 => row_cells(17), B2 => n_4, ZN => n_16);
  g953 : IND2D0BWP7T port map(A1 => n_7, B1 => row_cells(23), ZN => n_13);
  g954 : NR2D0BWP7T port map(A1 => n_5, A2 => column_select(1), ZN => n_15);
  g955 : INR2D0BWP7T port map(A1 => column_select(1), B1 => n_7, ZN => n_14);
  g956 : ND2D0BWP7T port map(A1 => row_cells(14), A2 => n_2, ZN => n_12);
  g957 : INR2D0BWP7T port map(A1 => column_select(2), B1 => n_8, ZN => n_11);
  g958 : AN3D0BWP7T port map(A1 => column_select(1), A2 => column_select(0), A3 => n_0, Z => n_10);
  g959 : AN3D0BWP7T port map(A1 => column_select(1), A2 => column_select(2), A3 => column_select(0), Z => n_9);
  g960 : IND2D0BWP7T port map(A1 => column_select(1), B1 => column_select(0), ZN => n_8);
  g961 : IND2D0BWP7T port map(A1 => column_select(0), B1 => n_0, ZN => n_7);
  g962 : NR2D0BWP7T port map(A1 => column_select(3), A2 => column_select(4), ZN => n_6);
  g963 : CKND1BWP7T port map(I => n_4, ZN => n_3);
  g964 : CKND1BWP7T port map(I => n_2, ZN => n_1);
  g965 : IND2D0BWP7T port map(A1 => column_select(0), B1 => column_select(2), ZN => n_5);
  g966 : INR2D0BWP7T port map(A1 => column_select(4), B1 => column_select(3), ZN => n_4);
  g967 : INR2D0BWP7T port map(A1 => column_select(3), B1 => column_select(4), ZN => n_2);
  g968 : INVD0BWP7T port map(I => column_select(2), ZN => n_0);
  RC1_g621 : AO21D0BWP7T port map(A1 => RC1_n_9, A2 => RC1_n_6, B => row_cells(18), Z => row_cells(21));
  RC1_g622 : OAI211D0BWP7T port map(A1 => RC1_n_6, A2 => RC1_n_13, B => RC1_n_24, C => RC1_n_15, ZN => row_cells(19));
  RC1_g623 : AOI21D0BWP7T port map(A1 => RC1_n_22, A2 => RC1_n_19, B => RC1_n_6, ZN => row_cells(13));
  RC1_g624 : IND3D0BWP7T port map(A1 => RC1_n_21, B1 => RC1_n_12, B2 => RC1_n_16, ZN => row_cells(18));
  RC1_g625 : ND2D0BWP7T port map(A1 => RC1_n_24, A2 => RC1_n_14, ZN => row_cells(20));
  RC1_g626 : OAI211D0BWP7T port map(A1 => RC1_n_5, A2 => RC1_n_11, B => RC1_n_16, C => RC1_n_14, ZN => row_cells(16));
  RC1_g627 : IND3D0BWP7T port map(A1 => row_cells(15), B1 => RC1_n_13, B2 => RC1_n_14, ZN => row_cells(12));
  RC1_g628 : ND2D0BWP7T port map(A1 => RC1_n_19, A2 => RC1_n_15, ZN => row_cells(22));
  RC1_g629 : OR2D0BWP7T port map(A1 => RC1_n_16, A2 => RC1_n_5, Z => RC1_n_24);
  RC1_g630 : CKND1BWP7T port map(I => RC1_n_21, ZN => RC1_n_22);
  RC1_g631 : OAI21D0BWP7T port map(A1 => RC1_n_13, A2 => RC1_n_4, B => RC1_n_12, ZN => row_cells(17));
  RC1_g632 : OAI21D0BWP7T port map(A1 => RC1_n_11, A2 => RC1_n_4, B => RC1_n_15, ZN => RC1_n_21);
  RC1_g633 : OR2D0BWP7T port map(A1 => RC1_n_10, A2 => RC1_n_8, Z => row_cells(14));
  RC1_g634 : IND2D0BWP7T port map(A1 => RC1_n_13, B1 => RC1_n_4, ZN => RC1_n_19);
  RC1_g635 : NR3D0BWP7T port map(A1 => RC1_n_7, A2 => RC1_n_5, A3 => RC1_n_6, ZN => row_cells(15));
  RC1_g636 : IND2D0BWP7T port map(A1 => RC1_n_11, B1 => RC1_n_6, ZN => RC1_n_16);
  RC1_g637 : ND2D0BWP7T port map(A1 => RC1_n_9, A2 => RC1_n_7, ZN => RC1_n_15);
  RC1_g638 : NR2D0BWP7T port map(A1 => RC1_n_9, A2 => RC1_n_8, ZN => RC1_n_14);
  RC1_g639 : OR2D0BWP7T port map(A1 => RC1_n_7, A2 => row_select(3), Z => RC1_n_13);
  RC1_g640 : AOI21D0BWP7T port map(A1 => RC1_n_4, A2 => RC1_n_6, B => RC1_n_7, ZN => RC1_n_10);
  RC1_g641 : ND2D0BWP7T port map(A1 => RC1_n_8, A2 => RC1_n_4, ZN => RC1_n_12);
  RC1_g642 : IND2D0BWP7T port map(A1 => RC1_n_7, B1 => row_select(3), ZN => RC1_n_11);
  RC1_g643 : NR2D0BWP7T port map(A1 => RC1_n_4, A2 => row_select(3), ZN => RC1_n_9);
  RC1_g644 : NR2D0BWP7T port map(A1 => RC1_n_6, A2 => row_select(3), ZN => RC1_n_8);
  RC1_g645 : OAI211D0BWP7T port map(A1 => row_select(2), A2 => RC1_n_2, B => RC1_n_3, C => row_cells(23), ZN => RC1_n_7);
  RC1_g646 : MOAI22D0BWP7T port map(A1 => RC1_n_2, A2 => row_select(0), B1 => RC1_n_2, B2 => row_select(0), ZN => RC1_n_6);
  RC1_g647 : INVD1BWP7T port map(I => RC1_n_5, ZN => RC1_n_4);
  RC1_g648 : MOAI22D0BWP7T port map(A1 => RC1_n_2, A2 => row_select(1), B1 => RC1_n_2, B2 => row_select(1), ZN => RC1_n_5);
  RC1_g649 : ND2D0BWP7T port map(A1 => RC1_n_2, A2 => row_select(2), ZN => RC1_n_3);
  RC1_g650 : AOI21D0BWP7T port map(A1 => row_select(3), A2 => row_select(2), B => row_select(4), ZN => RC1_n_2);
  RC1_g651 : ND2D0BWP7T port map(A1 => row_select(3), A2 => row_select(4), ZN => row_cells(23));

end synthesised;
