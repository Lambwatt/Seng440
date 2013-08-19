--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:22:14 08/18/2013
-- Design Name:   
-- Module Name:   C:/Users/Gord/Documents/GitHub/Seng440/VHDL/Adder/adder_TB.vhd
-- Project Name:  Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_TB IS
END adder_TB;
 
ARCHITECTURE behavior OF adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         clk : IN  std_logic;
         param_1 : IN  std_logic_vector(31 downto 0);
         param_2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal param_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal param_2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          clk => clk,
          param_1 => param_1,
          param_2 => param_2,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
	   param_1 <= "00000000000000000000000000000001";
		param_2 <= "00000000000000000000000000000101";
		
		wait for clk_period;
		
      param_1 <= "00000000000000000000000000001001";
		param_2 <= "00000000000000000000000011111111";
		
		wait for clk_period;
		
      param_1 <= "00000000000000000000000001111111";
		param_2 <= "00000000000000000000000000000101";
		
		wait for clk_period;

      param_1 <= "00000000000000000000000000000000";
		param_2 <= "00000000000000000000000000000000";
      wait;
   end process;

END;
