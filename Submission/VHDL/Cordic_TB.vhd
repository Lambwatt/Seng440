
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Cordi_TB IS
END Cordi_TB;
 
ARCHITECTURE behavior OF Cordi_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cordic
    PORT(
         rot_vector : IN  std_logic_vector(31 downto 0);
         rot_angle : IN  std_logic_vector(31 downto 0);
         rotation_result : OUT  std_logic_vector(31 downto 0);
         vectoring_vector : IN  std_logic_vector(31 downto 0);
         vectorin_result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rot_vector : std_logic_vector(31 downto 0) := (others => '0');
   signal rot_angle : std_logic_vector(31 downto 0) := (others => '0');
   signal vectoring_vector : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rotation_result : std_logic_vector(31 downto 0);
   signal vectorin_result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cordic PORT MAP (
          rot_vector => rot_vector,
          rot_angle => rot_angle,
          rotation_result => rotation_result,
          vectoring_vector => vectoring_vector,
          vectorin_result => vectorin_result
        );

   Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 
	  
		-- vector (0,100)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(6400, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(-45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(6400, 32));
		
		wait for clk_period;
	  
	    -- vector (100,100)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419436800, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(-45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419436800, 32));
		
		wait for clk_period;
		
		-- vector (100,0)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419430400, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(-45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419430400, 32));
		
		wait for clk_period;
		
		-- vector (100,0)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419430400, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(-45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(419430400, 32));
		
		wait for clk_period;
		
		-- vector (100,-100)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(6619036, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(6619036, 32));
		
		wait for clk_period;
		
		-- vector (0,-100)
		rot_vector <= STD_LOGIC_VECTOR(TO_SIGNED(65436, 32));	
		rot_angle <= STD_LOGIC_VECTOR(TO_SIGNED(45,32));
		
		vectoring_vector <= STD_LOGIC_VECTOR(TO_SIGNED(65436, 32));
      wait;
   end process;

END;
