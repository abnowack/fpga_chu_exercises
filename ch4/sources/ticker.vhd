library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity ticker is
    generic (
        CLOCK_HZ : natural;
        TICK_MS : natural
    );
    port (
        clk : in std_logic;
        en : in std_logic;
        tick : out std_logic
    );
end ticker;

architecture Behavioral of ticker is
    constant DVSR : natural := CLOCK_HZ / 1000;
    signal ms_reg, ms_next : unsigned(ceil_log2(DVSR)-1 downto 0) := (others => '0');
    signal ms_tick : std_logic := '0';
    
    signal d0_reg, d0_next : unsigned(ceil_log2(TICK_MS)-1 downto 0) := (others => '0');
    signal d0_en : std_logic;
    signal d0_tick : std_logic;
begin

    process(clk)
    begin
        if rising_edge(clk) then
            ms_reg <= ms_next;
            d0_reg <= d0_next;
        end if;
    end process;
    
    ms_next <= 
        (others => '0') when (ms_reg = DVSR-1 and en = '1') else
        ms_reg + 1 when (en = '1') else
        ms_reg;
    ms_tick <= '1' when (ms_reg = DVSR-1) else '0';
        
    d0_en <= '1' when (ms_tick = '1') else '0';
    d0_next <=
        to_unsigned(0, d0_next'length) when (d0_en = '1' and d0_reg = to_unsigned(TICK_MS-1, d0_next'length)) else
        d0_reg + 1 when (d0_en = '1') else
        d0_reg;
    d0_tick <= '1' when (d0_reg = to_unsigned(TICK_MS-1, d0_reg'length)) else '0';
    
    tick <= d0_tick and ms_tick;
    
end Behavioral;
