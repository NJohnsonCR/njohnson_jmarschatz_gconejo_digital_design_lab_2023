library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Declaración del módulo de la suma de 1 bit --

entity OneBitFullAdder is

    Port(bitA : in STD_LOGIC; bitB : in STD_LOGIC; cin  : in STD_LOGIC;
          cout : out STD_LOGIC; suma : out STD_LOGIC);

end OneBitFullAdder;


architecture Structural of OneBitFullAdder is

    begin 

        cout <= (bitA AND bitB) OR (cin AND (bitA XOR bitB));

        suma <= (bitA XOR bitB) XOR cin;

end Structural;