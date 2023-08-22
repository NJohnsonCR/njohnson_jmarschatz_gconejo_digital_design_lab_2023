library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity FourBitFullAdder is
		Port ( bitA :   in STD_LOGIC_VECTOR (3 downto 0);
				 bitB :   in STD_LOGIC_VECTOR (3 downto 0);
				 cin :   in STD_LOGIC;
				 sum4bits :  out STD_LOGIC_VECTOR (6 downto 0);
				 cout :  out STD_LOGIC_VECTOR(6 downto 0));
end FourBitFullAdder;
 
architecture Structural of FourBitFullAdder is
 
-- Componente del full adder de 1 bit
component OneBitFullAdder
		Port ( bitA :  in STD_LOGIC;
				 bitB :  in STD_LOGIC;
				 cin :  in STD_LOGIC;
				 suma : out STD_LOGIC;
				 cout : out STD_LOGIC);
end component;


-- Componente del codificador para el display de 7 segmentos
component SevenSegCodec is

    Port ( 
			sum4 : in  STD_LOGIC_VECTOR (3 downto 0);
			seg7 : out  STD_LOGIC_VECTOR (6 downto 0));
	 
end component;
 

signal co0,co1,co2,co3: STD_LOGIC;
Signal sumResult: STD_LOGIC_VECTOR (3 downto 0);
signal concat: std_logic_vector(3 downto 0); -- concatenar el carry de salida

 
begin
 
-- Suma de 4 bits usando full adders de 1 bit
S0: OneBitFullAdder port map( bitA(0), bitB(0), cin, co0, sumResult(0));
S1: OneBitFullAdder port map( bitA(1), bitB(1), co0, co1, sumResult(1));
S2: OneBitFullAdder port map( bitA(2), bitB(2), co1, co2, sumResult(2));
S3: OneBitFullAdder port map( bitA(3), bitB(3), co2, co3, sumResult(3));

concat <= "000" & co3;

conv0: SevenSegCodec port map(sumResult, sum4bits);

conv1: SevenSegCodec port map(concat, cout);
 
end Structural;