library ieee;
use ieee.std_logic_1164.all;

entity Calc_Propagate is
    generic (n: integer := 4);
    port (
        A, B: in std_logic_vector(n-1 downto 0);
        Propagate_bit: out std_logic
    );
end Calc_Propagate;


architecture Calc_Propagate_arch of Calc_Propagate is
signal propagate_signal: std_logic_vector(n-1 downto 0);
signal temp: std_logic_vector(n downto 0);

	begin
		temp(0) <= '1';
		propagate_signal <= A XOR B;
		
		generate_label:
		for i in 0 to n-1 generate
			temp(i+1)<=propagate_signal(i) AND temp(i);
		end generate;
		Propagate_bit <= temp(n);
end Calc_Propagate_arch;
