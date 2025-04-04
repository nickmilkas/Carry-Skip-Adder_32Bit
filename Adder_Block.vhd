library ieee;
use ieee.std_logic_1164.all;

entity Adder_Block is
    generic (n: integer := 4);
    port (
        A, B: in std_logic_vector(n-1 downto 0);
        Ci: in std_logic;
        S: out std_logic_vector(n-1 downto 0);
        Co: out std_logic
    );
end Adder_Block;

architecture Adder_block_arch of Adder_Block is
	
    component Full_Adder
        port (
            a, b, ci: in std_logic;
            s, co: out std_logic
        );
    end component;

    signal carr: std_logic_vector(n-1 downto 0);
begin
    First: Full_Adder port map (a => A(0), b => B(0), ci => Ci, s => S(0), co => carr(0));

    adder_loop: for i in 1 to n-1 generate
        U_adder: Full_Adder port map (
            a => A(i),
            b => B(i),
            ci => carr(i-1),
            s => S(i),
            co => carr(i)
        );
    end generate;

    Co <= carr(n-1);
end Adder_block_arch;
