----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:16:30 08/18/2013 
-- Design Name: 
-- Module Name:    adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    Port ( clk : in  STD_LOGIC;
			  param_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           param_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end adder;

architecture Behavioral of adder is
	signal arg1_r, arg2_r, sum_c : SIGNED( 31 downto 0);
begin
	sum_c <= arg1_r + arg2_r;
	
  process( param_1, param_2)
  begin
    --if( clk'event and clk='1') then
	   arg1_r <= SIGNED(param_1);
		arg2_r <= SIGNED(param_2);
		--sum_c <= arg1_r + arg2_r;
		result <= STD_LOGIC_VECTOR(sum_c);
	 --end if;
  end process;
	

end Behavioral;

