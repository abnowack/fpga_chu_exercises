library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity led_hex_test is
    port(
        clk : in std_logic;
        sw : in std_logic_vector(15 downto 0);
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0)
    );
end led_hex_test;

architecture Behavioral of led_hex_test is
    signal a, b : std_logic_vector(8 downto 0);
    signal sum : std_logic_vector(15 downto 0);
begin
    led_hex_display : entity work.led_hex_display
        port map(
            clk => clk,
            reset => '0',
            hex_0 => b(3 downto 0),
            hex_1 => b(7 downto 4),
            hex_2 => a(3 downto 0),
            hex_3 => a(7 downto 4),
            hex_4 => sum(3 downto 0),
            hex_5 => sum(7 downto 4),
            hex_6 => sum(11 downto 8),
            hex_7 => sum(15 downto 12),
            dp_in => "11111011",
            an => an,
            sseg => sseg
        );
    
    a <= "0" & sw(7 downto 0);
    b <= "0" & sw(15 downto 8);
    sum <= "0000000" & std_logic_vector(unsigned(a) + unsigned(b));
    
end Behavioral;
