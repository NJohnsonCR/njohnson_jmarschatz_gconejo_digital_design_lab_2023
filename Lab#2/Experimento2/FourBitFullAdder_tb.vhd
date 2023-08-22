LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FourBitFullAdder_tb IS
END FourBitFullAdder_tb;
 
ARCHITECTURE behavior OF FourBitFullAdder_tb IS
 
-- Declaracion del componente de testeo 
 
COMPONENT FourBitFullAdder
PORT(
		bitA : IN std_logic_vector(3 downto 0);
		bitB : IN std_logic_vector(3 downto 0);
		cin : IN std_logic;
		sum4bits : OUT std_logic_vector(6 downto 0);
		cout : OUT std_logic_vector(6 downto 0)
		);
END COMPONENT;
 
--Inputs
signal bitA : std_logic_vector(3 downto 0) := (others => '0');
signal bitB : std_logic_vector(3 downto 0) := (others => '0');
signal cin : std_logic := '0';
 
--Outputs
signal sum4bits : std_logic_vector(6 downto 0);
signal cout : std_logic_vector(6 downto 0);
 
BEGIN
 
-- Instancia del test
uut: FourBitFullAdder PORT MAP (
bitA => bitA,
bitB => bitB,
cin => cin,
sum4bits => sum4bits,
cout => cout
);
 
stim_proc: process
begin
-- Estado de reset por 100ns
wait for 50 ns;
bitA <= "0001";
bitB <= "0001";
 
wait for 50 ns;
bitA <= "1111";
bitB <= "1100";
 
wait for 50 ns;
bitA <= "0110";
bitB <= "0111";
 
wait for 50 ns;
bitA <= "1111";
bitB <= "1111";

wait for 50 ns;
bitA <= "1111";
bitB <= "1111";
 
wait;
 
end process;
 
END;