library IEEE;
use IEEE.std_logic_1164.all;

entity fourBitsFullAdder is
    port (
        sumFinal : out std_logic_vector (3 downto 0);
        mainCarryOut : out std_logic;
		  sum4bits :  out STD_LOGIC_VECTOR (6 downto 0);
		  cout :  out STD_LOGIC_VECTOR(6 downto 0);
        aSum : in std_logic_vector (3 downto 0);
        bSum : in std_logic_vector (3 downto 0);
        mainCarryIn : in std_logic
    );
end entity;

architecture arch_fourBitsFullAdder of fourBitsFullAdder is

    component oneBitFullAdder is
        port (
            sum, carryOut : out std_logic;
            a, b, carryIn : in std_logic
        );
    end component;
	 
	 -- Componente del codificador para el display de 7 segmentos
	component SevenSegCodec is

    Port ( 
			sum4 : in  STD_LOGIC_VECTOR (3 downto 0);
			seg7 : out  STD_LOGIC_VECTOR (6 downto 0));
	 
end component;

    signal auxCarry : std_logic_vector (4 downto 0);
	 signal concat: std_logic_vector(3 downto 0);
	 signal sfinal: std_logic_vector(3 downto 0);

begin

    auxCarry(0) <= mainCarryIn;

    bit_s0: oneBitFullAdder port map (
        sum => sfinal(0),
        carryOut => auxCarry(1),
        a => aSum(0),
        b => bSum(0),
        carryIn => auxCarry(0)
    );

    bit_s1: oneBitFullAdder port map (
        sum => sfinal(1),
        carryOut => auxCarry(2),
        a => aSum(1),
        b => bSum(1),
        carryIn => auxCarry(1)
    );

    bit_s2: oneBitFullAdder port map (
        sum => sfinal(2),
        carryOut => auxCarry(3),
        a => aSum(2),
        b => bSum(2),
        carryIn => auxCarry(2)
    );

    bit_s3: oneBitFullAdder port map (
        sum => sfinal(3),
        carryOut => auxCarry(4),
        a => aSum(3),
        b => bSum(3),
        carryIn => auxCarry(3)
    );

    mainCarryOut <= auxCarry(4);
	 concat <= "000" & auxCarry(4);
	 sumFinal <= sfinal;
	  
	 conv0: SevenSegCodec port map(sfinal, sum4bits);

	 conv1: SevenSegCodec port map(concat, cout);

end architecture;