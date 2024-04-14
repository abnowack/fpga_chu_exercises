library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity square_wave_generator is
generic (
    DVSR : natural := 10;
    N_RES : natural := 8
);
port (
    clk : in std_logic;
    m : in std_logic_vector(N_RES-1 downto 0);
    n : in std_logic_vector(N_RES-1 downto 0);
    wave : out std_logic
);
end square_wave_generator;

architecture Behavioral of square_wave_generator is
    signal tick_reg, tick_next : unsigned(N_RES downto 0);
    signal tick : std_logic;
    signal count_en : std_logic;
    signal count_reg, count_next : unsigned(N_RES downto 0);
    signal wave_reg, wave_next : std_logic;
    
    attribute dont_touch : string;
    attribute dont_touch of tick_reg : signal is "yes";
    attribute dont_touch of tick_next : signal is "yes";
    attribute dont_touch of tick : signal is "yes";
    attribute dont_touch of count_en : signal is "yes";
    attribute dont_touch of count_reg : signal is "yes";
    attribute dont_touch of count_next : signal is "yes";
    attribute dont_touch of wave_reg : signal is "yes";
    attribute dont_touch of wave_next : signal is "yes";
begin

    process(clk)
    begin
        if rising_edge(clk) then
            tick_reg <= tick_next;
            count_reg <= count_next;
            wave_reg <= wave_next;
        end if;
    end process;
    
    tick_next <= 
        (others => '0') when (tick_reg = DVSR) else
        tick_reg + 1;
    tick <= '1' when (tick_reg = DVSR) else '0';
    
    count_en <= '1' when (tick = '1') else '0';
    count_next <=
        (others => '0') when (count_en = '1' and count_reg = unsigned('0' & m) + unsigned('0' & n)) else
        count_reg + 1 when (count_en = '1') else
        count_reg;
    
    wave_next <= '1' when (count_reg < unsigned(m)) else '0';
    
    wave <= wave_reg;
    
end Behavioral;
