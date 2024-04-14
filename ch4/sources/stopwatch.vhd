library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stopwatch is
    port (
        clk : in std_logic;
        go, clr : in std_logic;
        d0, d1, d2, d3, d4, d5 : out std_logic_vector(3 downto 0)
    );
end stopwatch;

architecture Behavioral of stopwatch is
    constant DVSR : integer := 10000;
    signal ms_reg, ms_next : unsigned(23 downto 0);
    signal d5_reg, d5_next : unsigned(3 downto 0);
    signal d4_reg, d4_next : unsigned(3 downto 0);
    signal d3_reg, d3_next : unsigned(3 downto 0);
    signal d2_reg, d2_next : unsigned(3 downto 0);
    signal d1_reg, d1_next : unsigned(3 downto 0);
    signal d0_reg, d0_next : unsigned(3 downto 0);
    signal d0_en, d1_en, d2_en, d3_en, d4_en, d5_en : std_logic;
    signal ms_tick, d0_tick, d1_tick, d2_tick, d3_tick, d4_tick : std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            ms_reg <= ms_next;
            d5_reg <= d5_next;
            d4_reg <= d4_next;
            d3_reg <= d3_next;
            d2_reg <= d2_next;
            d1_reg <= d1_next;
            d0_reg <= d0_next;
        end if;
    end process;

    ms_next <= 
        (others => '0') when (clr = '1') or (ms_reg = DVSR and go = '1') else
        ms_reg + 1 when (go = '1') else
        ms_reg;
    ms_tick <= '1' when (ms_reg = DVSR) else '0';
        
    d0_en <= '1' when (ms_tick = '1') else '0';
    d0_next <=
        "0000" when (clr = '1') or (d0_en = '1' and d0_reg = 9) else
        d0_reg + 1 when (d0_en = '1') else
        d0_reg;
    d0_tick <= '1' when (d0_reg = 9) else '0';
    
    d1_en <= '1' when (ms_tick = '1') and (d0_tick = '1') else '0';
    d1_next <=
        "0000" when (clr = '1') or (d1_en = '1' and d1_reg = 9) else
        d1_reg + 1 when (d1_en = '1') else
        d1_reg;
    d1_tick <= '1' when (d1_reg = 9) else '0';

    d2_en <= '1' when (ms_tick = '1') and (d0_tick = '1') and (d1_tick = '1') else '0';
    d2_next <=
        "0000" when (clr = '1') or (d2_en = '1' and d2_reg = 9) else
        d2_reg + 1 when (d2_en = '1') else
        d2_reg;
    d2_tick <= '1' when (d2_reg = 9) else '0';
    
    d3_en <= '1' when (ms_tick = '1') and (d0_tick = '1') and (d1_tick = '1') and (d2_tick = '1') else '0';
    d3_next <=
        "0000" when (clr = '1') or (d3_en = '1' and d3_reg = 9) else
        d3_reg + 1 when (d3_en = '1') else
        d3_reg;
    d3_tick <= '1' when (d3_reg = 9) else '0';

    d4_en <= '1' when (ms_tick = '1') and (d0_tick = '1') and (d1_tick = '1') and (d2_tick = '1') and (d3_tick = '1') else '0';
    d4_next <=
        "0000" when (clr = '1') or (d4_en = '1' and d4_reg = 9) else
        d4_reg + 1 when (d4_en = '1') else
        d4_reg;
    d4_tick <= '1' when (d4_reg = 9) else '0';

    d5_en <= '1' when (ms_tick = '1') and (d0_tick = '1') and (d1_tick = '1') and (d2_tick = '1') and (d3_tick = '1') and (d4_tick = '1') else '0';
    d5_next <=
        "0000" when (clr = '1') or (d5_en = '1' and d5_reg = 9) else
        d5_reg + 1 when (d5_en = '1') else
        d5_reg;

    d0 <= std_logic_vector(d0_reg);
    d1 <= std_logic_vector(d1_reg);
    d2 <= std_logic_vector(d2_reg);
    d3 <= std_logic_vector(d3_reg);
    d4 <= std_logic_vector(d4_reg);
    d5 <= std_logic_vector(d5_reg);
    
end Behavioral;
