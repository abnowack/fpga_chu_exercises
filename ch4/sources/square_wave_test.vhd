library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity square_wave_test is
    port (
        clk : in std_logic;
        sw : in std_logic_vector(15 downto 0);
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0);
        ja_top : out std_logic_vector(4 downto 1)
    );
end square_wave_test;

architecture Behavioral of square_wave_test is
    signal m, n : std_logic_vector(7 downto 0);
begin

    m <= sw(15 downto 8);
    n <= sw(7 downto 0);

    square_wave_gen : entity work.square_wave_generator
        port map(
            clk => clk,
            m => m,
            n => n,
            wave => ja_top(4)
        );
        
    display : entity work.led_hex_display
        port map(
            clk   => clk,
            reset => '0',
            hex_0 => n(3 downto 0),
            hex_1 => n(7 downto 4),
            hex_2 => "0000",
            hex_3 => "0000",
            hex_4 => m(3 downto 0),
            hex_5 => m(7 downto 4),
            hex_6 => "0000",
            hex_7 => "0000",
            dp_in => "11111111",
            an => an,
            sseg => sseg
        );

end Behavioral;
