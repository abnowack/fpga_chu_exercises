library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stopwatch_test is
    port (
        clk : in std_logic;
        btn : in std_logic_vector(3 downto 0);
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0)
    );
end stopwatch_test;

architecture Behavioral of stopwatch_test is
    signal d0, d1, d2, d3, d4, d5 : std_logic_vector(3 downto 0);
begin

    display : entity work.led_hex_display
    port map(
        clk   => clk,
        reset => '0',
        hex_0 => d0,
        hex_1 => d1,
        hex_2 => d2,
        hex_3 => d3,
        hex_4 => d4,
        hex_5 => d5,
        hex_6 => "0000",
        hex_7 => "0000",
        dp_in => "11101111",
        an => an,
        sseg => sseg
    );
    
    stopwatch : entity work.stopwatch
    port map(
        clk => clk,
        go => btn(1),
        clr => btn(0),
        d5 => d5,
        d4 => d4,
        d3 => d3,
        d2 => d2,
        d1 => d1,
        d0 => d0
    );
    
end Behavioral;
