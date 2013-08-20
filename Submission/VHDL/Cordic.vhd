
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cordic is
    Port ( rot_vector : in  STD_LOGIC_VECTOR (31 downto 0);
           rot_angle : in  STD_LOGIC_VECTOR (31 downto 0);
           rotation_result : out  STD_LOGIC_VECTOR (31 downto 0);
           vectoring_vector : in  STD_LOGIC_VECTOR (31 downto 0);
           vectorin_result : out  STD_LOGIC_VECTOR (31 downto 0));
end Cordic;

architecture Behavioral of Cordic is
	constant ANGLE_SCALE : integer := 24;
	constant ITER_SCALE : integer := 1686;	-- 1.64676 * 2^10	
	type ARC_DATA is array (0 to 15) of SIGNED(0 to 31);
	constant ARC_TAN_DEGREES : ARC_DATA := (TO_SIGNED(754974720,32), TO_SIGNED(445687602,32), TO_SIGNED(235489088,32), TO_SIGNED(119537938,32),
									TO_SIGNED(60000934,32), TO_SIGNED(30029717,32), TO_SIGNED(15018523,32), TO_SIGNED(7509720,32),
									TO_SIGNED(3754917,32), TO_SIGNED(1877470,32), TO_SIGNED(938734,32), TO_SIGNED(469367,32),
									TO_SIGNED(234684,32), TO_SIGNED(117342,32), TO_SIGNED(58671,32), TO_SIGNED(29335,32));
begin

	-- Rotation Process
	-- No clock needed
	Rotation : process (rot_vector, rot_angle)		-- angle can be 0 but vector can't
		variable angle, cur_x, cur_y, round_x, round_y, arc_tan : SIGNED(31 downto 0);				
	begin		
		---- Initialize values ----
		angle := SHIFT_LEFT(SIGNED(rot_angle), ANGLE_SCALE);		-- int_z = angle << ANGLE_SCALE;
		round_x := SHIFT_RIGHT(SIGNED(rot_vector),16);		-- get signed x from vector
		round_y := SHIFT_LEFT(SIGNED(rot_vector),16);		-- shift y left to propagate preceding 1's
		round_y := SHIFT_RIGHT(round_y, 16);					-- get signed y from vector
		
		cur_x := round_x;
		cur_y := round_y;
		
		---- Iteration 0 ----
		arc_tan := ARC_TAN_DEGREES(0);
		if (angle < 0) then
			arc_tan := resize(-1 * arc_tan, 32);
			round_y := resize(-1 * round_y, 32);
			round_x := resize(-1 * round_x, 32);		
		end if;
		
		cur_x := cur_x - round_y;
		cur_y := cur_y + round_x;
		angle := angle - arc_tan;	
		
		round_x := cur_x;
		round_y := cur_y;
		
		---- Iteration 1 -> 15 ----
		
		for i in 1 to 15 loop
			arc_tan := ARC_TAN_DEGREES(i);
			if (angle < 0) then
				arc_tan := resize(-1 * arc_tan, 32);
				round_y := resize(-1 * round_y, 32);
				round_x := resize(-1 * round_x, 32);		
			end if;
			
			-- Von Neumann rounding
			if (round_x((i-1) downto 0) > 0) then	
				round_x(i) := '1';
			end if;			
			if (round_y((i-1) downto 0) > 0) then
				round_y(i) := '1';
			end if;
			
			-- Shift function propagates left hand 1's in negative numbers			
			cur_x := cur_x - SHIFT_RIGHT(round_y, i);
			cur_y := cur_y + SHIFT_RIGHT(round_x, i);
			angle := angle - arc_tan;		
			
			round_x := cur_x;
			round_y := cur_y;
		
		end loop;
		
		-- ITER_SCALE is multiplied by 2^10 so shifting current values to compensate.
		cur_x := SHIFT_LEFT(cur_x, 10);
		cur_x := cur_x / ITER_SCALE;
		cur_y := SHIFT_LEFT(cur_y, 10);
		cur_y := cur_y / ITER_SCALE;
		
		-- pack the results into 16 bits
		cur_x(31 downto 16) := cur_x(15 downto 0);
		cur_x(15 downto 0) := cur_y(15 downto 0);
		
		rotation_result <= STD_LOGIC_VECTOR(cur_x);
		
	end process;
	
	Vectoring : process(vectoring_vector)
		variable angle, cur_x, cur_y, round_x, round_y, arc_tan : SIGNED(31 downto 0);				
	begin
		---- Initialize values ----
		angle := TO_SIGNED(0,32);		
		round_x := SHIFT_RIGHT(SIGNED(vectoring_vector),16);		-- get signed x from vector
		round_y := SHIFT_LEFT(SIGNED(vectoring_vector),16);		-- shift y left to propagate preceding 1's
		round_y := SHIFT_RIGHT(round_y, 16);					-- get signed y from vector
		
		cur_x := round_x;
		cur_y := round_y;
		
		---- Iteration 0 ----
		arc_tan := ARC_TAN_DEGREES(0);
		if (cur_y >= 0) then
			arc_tan := resize(-1 * arc_tan, 32);
			round_y := resize(-1 * round_y, 32);
			round_x := resize(-1 * round_x, 32);		
		end if;
		
		cur_x := cur_x - round_y;
		cur_y := cur_y + round_x;
		angle := angle - arc_tan;	
		
		round_x := cur_x;
		round_y := cur_y;
		
		---- Iteration 1 -> 15 ----
		
		for i in 1 to 15 loop
			arc_tan := ARC_TAN_DEGREES(i);
			if (cur_y >= 0) then
				arc_tan := resize(-1 * arc_tan, 32);
				round_y := resize(-1 * round_y, 32);
				round_x := resize(-1 * round_x, 32);		
			end if;
			
			-- Von Neumann rounding
			if (round_x((i-1) downto 0) > 0) then	
				round_x(i) := '1';
			end if;			
			if (round_y((i-1) downto 0) > 0) then
				round_y(i) := '1';
			end if;
			
			-- Shift function propagates msb 1's for negative numbers			
			cur_x := cur_x - SHIFT_RIGHT(round_y, i);
			cur_y := cur_y + SHIFT_RIGHT(round_x, i);
			angle := angle - arc_tan;		
			
			round_x := cur_x;
			round_y := cur_y;
		
		end loop;
		
		-- ITER_SCALE is multiplied by 2^10 so shifting current values to compensate.
		cur_x := SHIFT_LEFT(cur_x, 10);
		cur_x := cur_x / ITER_SCALE;
		
		angle := SHIFT_RIGHT(angle, ANGLE_SCALE);
		-- pack the results into 16 bits
		cur_x(31 downto 16) := cur_x(15 downto 0);
		cur_x(15 downto 0) := angle(15 downto 0);
		
		vectorin_result <= STD_LOGIC_VECTOR(cur_x);
	
	end process;

end Behavioral;

