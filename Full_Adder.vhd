library ieee;
	use ieee.std_logic_1164.all;

entity Full_Adder is
	port(A,B, Ci: in std_logic;
	S, Co: out std_logic);
end Full_Adder;
	
	architecture full_adder_arch of Full_Adder is
		signal ex_1,ex_2,ex_3: std_logic;
	begin
		ex_1 <= A xor B;
		S <= ex_1 xor Ci;
		
		ex_2 <= ex_1 and Ci;
		ex_3 <= A and B;
		
		Co <= ex_2 or ex_3;
		
	end full_adder_arch;
	
