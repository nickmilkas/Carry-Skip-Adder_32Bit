library ieee;
	use ieee.std_logic_1164.all;
	
entity MUX_2x1 is
	port(In0, In1: in std_logic; 
		select_signal: in std_logic;
		Out_value: out std_logic
		);
		
end MUX_2x1;

architecture MUX_2x1_arch of MUX_2x1 is
	begin
		with select_signal select
			Out_value <=In0 when '0',
						In1 when '1',
						In0 when OTHERS;
end MUX_2x1_arch;

