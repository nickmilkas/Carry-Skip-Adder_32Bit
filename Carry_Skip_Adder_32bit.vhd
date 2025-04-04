-- Project Team 11
-- Carry_Skip_Adder_32bit_generate
-- Inputs: A, B, Ci
-- Outputs: S, Co


library ieee;
    use ieee.std_logic_1164.all;

	entity Carry_Skip_Adder_32bit_generate is
		generic (n: integer := 4);
		port(a, b: in std_logic_vector(31 downto 0);
			Ci: in std_logic;
			s: out std_logic_vector(31 downto 0);
			Co: out std_logic);
	end Carry_Skip_Adder_32bit_generate;

	architecture arch_nbit of Carry_Skip_Adder_32bit_generate is
		
		component Adder_Block
		--generic (n: integer := 4);
		port (
			A, B: in std_logic_vector(n-1 downto 0);
			Ci: in std_logic;
			S: out std_logic_vector(n-1 downto 0);
			Co: out std_logic
		);
		end component;
		

		component Mux_2x1
		port(In0, In1: in std_logic; 
			select_signal: in std_logic;
			Out_value: out std_logic
		);
		end component;
		

		component Calc_Propagate
    		--generic (n: integer := 4);
    		port (
        		A, B: in std_logic_vector(n-1 downto 0);
        		Propagate_bit: out std_logic
    		);
		end component;
		

				
		signal CarrIn: std_logic_vector((32/n) downto 0);	
		signal Prop_sign: std_logic_vector((32/n-1) downto 0);
		signal CarrOut: std_logic_vector((32/n-1) downto 0);
		
		
		begin
		
			CarrIn(0)<= Ci;
			generate_label:
			
			for i in 0 to (32/n-1) generate
				FA_i: Adder_Block port map (a((n*i+n-1) downto (n*i)), b((n*i+n-1) downto (n*i)), CarrIn(i), S((n*i+n-1) downto (n*i)), CarrOut(i)); 
				Calc_Propagate_i: Calc_Propagate port map (a((n*i+n-1) downto (n*i)), b((n*i+n-1) downto (n*i)), Prop_sign(i));
				Mux_i: Mux_2x1 port map (CarrOut(i), CarrIn(i), Prop_sign(i), CarrIn(i+1));
			end generate;
			
			Co <= CarrIn(32/n);
		end arch_nbit;
		
		