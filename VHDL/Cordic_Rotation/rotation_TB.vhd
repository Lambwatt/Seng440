--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:50 08/11/2013
-- Design Name:   
-- Module Name:   C:/Courses/Cordic/Cordic_Rotation/rotation_TB.vhd
-- Project Name:  Cordic_Rotation
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rotation
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
USE ieee.numeric_std.ALL;
 
ENTITY rotation_TB IS
END rotation_TB;
 
ARCHITECTURE behavior OF rotation_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rotation
    PORT(
         clock : IN  std_logic;
         vector_arg : IN  std_logic_vector(31 downto 0);
         angle_arg : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal vector_arg : std_logic_vector(31 downto 0) := (others => '0');
   signal angle_arg : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rotation PORT MAP (
          clock => clock,
          vector_arg => vector_arg,
          angle_arg => angle_arg,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 
		
		vector_arg <= STD_LOGIC_VECTOR(TO_SIGNED(419436800, 32));
		angle_arg <= STD_LOGIC_VECTOR(TO_SIGNED(-45,32));

      wait;
   end process;

END;
