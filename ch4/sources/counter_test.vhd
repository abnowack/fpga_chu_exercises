library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity counter_test is
end counter_test;

architecture Behavioral of counter_test is
    constant CLOCK_HZ : natural := 100000;
    constant TICK_MS : natural := 12;
    constant COUNT_MAX : natural := 15;
    
    constant CLOCK_PERIOD : time := CLOCK_HZ * 1 ns;

    signal clk : std_logic := '0';
    signal tick : std_logic;
    signal count : std_logic_vector(ceil_log2(COUNT_MAX)-1 downto 0) := (others => '0');
begin

    clk <= not clk after CLOCK_PERIOD / 2;

    counter : entity work.counter
    generic map(
        CLOCK_HZ => CLOCK_HZ,
        TICK_MS => TICK_MS,
        COUNT_MAX => COUNT_MAX
    )
    port map(
        clk => clk,
        en => '1',
        tick => tick,
        count => count
    );

end Behavioral;
