library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity led_banner is
    generic (
    );
    port (
        clk : in std_logic;
        btn : in std_logic_vector(0 downto 0);
        led : out std_logic_vector(0 downto 0)
    );
end led_banner;

architecture Behavioral of led_banner is
    signal tick : std_logic;
begin

    ticker : entity work.ticker
    generic map(
        CLOCK_HZ => 100000000,
        TICK_MS => 100
    )
    port map(
        clk => clk,
        en => btn(0),
        tick => led(
    );
    
    

    
end Behavioral;
