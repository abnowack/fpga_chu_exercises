library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rotating_square is
    port (
        clk : in std_logic;
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0);
        btn : in std_logic_vector(3 downto 0)
    );
end rotating_square;

architecture Behavioral of rotating_square is
    constant DVSR : integer := 10000000;
    signal ms_reg, ms_next : unsigned(30 downto 0);
    signal ms_tick : std_logic;
    signal d0_en : std_logic;
    signal d0_reg, d0_next : unsigned(3 downto 0);
    signal d0_tick : std_logic;
    
    signal num_0_reg, num_0_next, num_0 : std_logic_vector(7 downto 0);
    signal num_1_reg, num_1_next, num_1 : std_logic_vector(7 downto 0);
    signal num_2_reg, num_2_next, num_2 : std_logic_vector(7 downto 0);
    signal num_3_reg, num_3_next, num_3 : std_logic_vector(7 downto 0);
    signal num_4_reg, num_4_next, num_4 : std_logic_vector(7 downto 0);
    signal num_5_reg, num_5_next, num_5 : std_logic_vector(7 downto 0);
    signal num_6_reg, num_6_next, num_6 : std_logic_vector(7 downto 0);
    signal num_7_reg, num_7_next, num_7 : std_logic_vector(7 downto 0);
    
    signal en : std_logic;
    signal cw : std_logic;

    constant bottom_square : std_logic_vector(7 downto 0) := "10100011";
    constant top_square : std_logic_vector(7 downto 0) := "10011100";
begin

    process(clk)
    begin
        if rising_edge(clk) then
            ms_reg <= ms_next;
            d0_reg <= d0_next;
            num_0_reg <= num_0_next;
            num_1_reg <= num_1_next;
            num_2_reg <= num_2_next;
            num_3_reg <= num_3_next;
            num_4_reg <= num_4_next;
            num_5_reg <= num_5_next;
            num_6_reg <= num_6_next;
            num_7_reg <= num_7_next;
        end if;
    end process;
    
    ms_next <= 
        (others => '0') when (ms_reg = DVSR and en = '1') else
        ms_reg + 1 when (en = '1') else ms_reg;
    ms_tick <= '1' when (ms_reg = DVSR) else '0';
        
    d0_en <= '1' when (ms_tick = '1') else '0';
    d0_next <=
        "0000" when (d0_en = '1' and d0_reg = "1111" and cw = '1') else
        "1111" when (d0_en = '1' and d0_reg = "0000" and cw = '0') else
        d0_reg + 1 when (d0_en = '1' and cw = '1') else
        d0_reg - 1 when (d0_en = '1' and cw = '0') else
        d0_reg;
    d0_tick <= '1' when (d0_reg = "1111") else '0';
    
    num_0_next <= bottom_square when (d0_reg = 0) else
                  top_square when (d0_reg = 15) else (others => '1');
    num_1_next <= bottom_square when (d0_reg = 1) else
                  top_square when (d0_reg = 14) else (others => '1');
    num_2_next <= bottom_square when (d0_reg = 2) else
                  top_square when (d0_reg = 13) else (others => '1');
    num_3_next <= bottom_square when (d0_reg = 3) else
                  top_square when (d0_reg = 12) else (others => '1');
    num_4_next <= bottom_square when (d0_reg = 4) else
                  top_square when (d0_reg = 11) else (others => '1');
    num_5_next <= bottom_square when (d0_reg = 5) else
                  top_square when (d0_reg = 10) else (others => '1');
    num_6_next <= bottom_square when (d0_reg = 6) else
                  top_square when (d0_reg = 9) else (others => '1');
    num_7_next <= bottom_square when (d0_reg = 7) else
                  top_square when (d0_reg = 8) else (others => '1');      
                                     
    led_display : entity work.led_display
    port map(
        clk => clk,
        reset => '0',
        in_0 => num_0,
        in_1 => num_1,
        in_2 => num_2,
        in_3 => num_3,
        in_4 => num_4,
        in_5 => num_5,
        in_6 => num_6,
        in_7 => num_7,
        an => an,
        sseg => sseg
    );
    
    num_0 <= num_0_reg;
    num_1 <= num_1_reg;
    num_2 <= num_2_reg;
    num_3 <= num_3_reg;
    num_4 <= num_4_reg;
    num_5 <= num_5_reg;
    num_6 <= num_6_reg;
    num_7 <= num_7_reg;
    
    en <= not btn(0);
    cw <= not btn(1);

end Behavioral;
