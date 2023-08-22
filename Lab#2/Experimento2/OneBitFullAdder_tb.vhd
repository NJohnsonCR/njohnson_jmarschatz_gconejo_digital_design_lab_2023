LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY OneBitFullAdder_tb IS
END OneBitFullAdder_tb;
 
ARCHITECTURE behavior OF OneBitFullAdder_tb IS
 
 
 
 
 COMPONENT OneBitFullAdder
 PORT(
		 bitA : IN std_logic;
		 bitB : IN std_logic;
		 cin : IN std_logic;
		 suma : OUT std_logic;
		 cout : OUT std_logic
		 );
 END COMPONENT;
 
 --Inputs
 signal bitA : std_logic := '0';
 signal bitB : std_logic := '0';
 signal cin : std_logic := '0';
 
 --Outputs
 signal suma : std_logic;
 signal cout : std_logic;
 
BEGIN
 

 uut: OneBitFullAdder PORT MAP (
									 bitA => bitA,
									 bitB => bitB,
									 cin => cin,
									 suma => suma,
									 cout => cout
									 );
 
 -- Stimulus process
 stim_proc: process
 
 begin
	 -- hold reset state for 100 ns.
	 wait for 40 ns;
	 
	 -- insert stimulus here
	 bitA <= '1';
	 bitB <= '0';
	 cin <= '0';
	 wait for 10 ns;
	 
	 bitA <= '0';
	 bitB <= '1';
	 cin <= '0';
	 wait for 10 ns;
	 
	 bitA <= '1';
	 bitB <= '1';
	 cin <= '0';
	 wait for 10 ns;
	 
	 bitA <= '0';
	 bitB <= '0';
	 cin <= '1';
	 wait for 10 ns;
	 
	 bitA <= '1';
	 bitB <= '0';
	 cin <= '1';
	 wait for 10 ns;
	 
	 bitA <= '0';
	 bitB <= '1';
	 cin <= '1';
	 wait for 10 ns;
	 
	 bitA <= '1';
	 bitB <= '1';
	 cin <= '1';
	 wait for 10 ns;
 
 end process;
 
END;