library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dimmable_display_test is
port(
    clk : in std_logic;
    sw : in std_logic_vector(15 downto 0);
    an : out std_logic_vector(7 downto 0);
    sseg : out std_logic_vector(7 downto 0)
);
end dimmable_display_test;

architecture Behavioral of dimmable_display_test is
    signal w : std_logic_vector(3 downto 0);
begin

    w <= sw(3 downto 0);

    led_dim_display : entity work.dimmable_display
    port map(
        clk => clk,
        reset => '0',
        hex_0 => "1111",
        hex_1 => "0000",
        hex_2 => "1111",
        hex_3 => "0000",
        hex_4 => "1111",
        hex_5 => "0000",
        hex_6 => "1111",
        hex_7 => "0000",
        dp_in => "11111011",
        an => an,
        sseg => sseg,
        w => w
    );

end Behavioral;
