library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity counter is
    generic (
        CLOCK_HZ : natural;
        TICK_MS : natural;
        COUNT_MAX : natural
    );
    port (
        clk : in std_logic;
        en : in std_logic;
        up : in std_logic;
        tick : out std_logic;
        count : out std_logic_vector(ceil_log2(COUNT_MAX)-1 downto 0)
    );
end counter;

architecture Behavioral of counter is
    signal tick_int : std_logic;
    signal count_reg, count_next : unsigned(ceil_log2(COUNT_MAX)-1 downto 0) := (others => '0');
begin

    ticker : entity work.ticker
    generic map(
        CLOCK_HZ => CLOCK_HZ,
        TICK_MS => TICK_MS
    )
    port map(
        clk => clk,
        en => en,
        tick => tick_int
    );
    
    process(clk)
    begin
        if rising_edge(clk) then
            count_reg <= count_next;
        end if;
    end process;
    
    count_next <= to_unsigned(0, count_next'length) when (up = '1' and tick_int = '1' and count_reg = to_unsigned(COUNT_MAX-1, count_next'length)) else
                  to_unsigned(COUNT_MAX-1, count_next'length) when (up = '0' and tick_int = '1' and count_reg = to_unsigned(0, count_next'length)) else
                  count_reg + 1 when (up = '1' and tick_int = '1') else
                  count_reg - 1 when (up = '0' and tick_int = '1') else
                  count_reg;
    
    count <= std_logic_vector(count_reg);
    
    
--    d0_en <= '1' when (ms_tick = '1') else '0';
--    d0_next <=
--        "0000" when (d0_en = '1' and d0_reg = "1111" and cw = '1') else
--        "1111" when (d0_en = '1' and d0_reg = "0000" and cw = '0') else
--        d0_reg + 1 when (d0_en = '1' and cw = '1') else
--        d0_reg - 1 when (d0_en = '1' and cw = '0') else
--        d0_reg;
--    d0_tick <= '1' when (d0_reg = "1111") else '0';
    
end Behavioral;
