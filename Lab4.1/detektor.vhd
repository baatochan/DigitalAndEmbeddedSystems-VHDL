library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity detektor is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end detektor;

architecture Behavioral of detektor is
type state_type is (q0,q1,q2,q3,q4,q5,q6);
signal state, next_state : state_type;

begin
	
	process_1 : process(Clk)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then
				state <= q0;
			else 
				state <= next_state;
			end if;
		end if;
	end process process_1;
	
	process_2 : process(state,X)
	begin
		next_state <= state;
		
		case state is
			when q0 =>
				if X = '1' then next_state <= q1;
				else next_state <= q0;
				end if;
			when q1 =>
				if X = '0' then next_state <= q2;
				else next_state <= q1;
				end if;
			when q2 =>
				if X = '0' then next_state <= q3;
				else next_state <= q1;
				end if;
			when q3 =>
				if X = '1' then next_state <= q4;
				else next_state <= q0;
				end if;
			when q4 =>
				if X = '1' then next_state <= q5;
				else next_state <= q0;
				end if;
			when q5 =>
				if X = '1' then next_state <= q6;
				else next_state <= q0;
				end if;
			when q6 =>
				if X = '1' then next_state <= q1;
				else next_state <= q0;
				end if;
		end case;
	end process process_2;
	
	output : process(state)
		begin
			case state is
				when q0 => Y <= '0';
				when q1 => Y <= '0';
				when q2 => Y <= '0';
				when q3 => Y <= '0';
				when q4 => Y <= '0';
				when q5 => Y <= '0';
				when q6 => Y <= '1';
			end case;
		end process output;
		
end Behavioral;