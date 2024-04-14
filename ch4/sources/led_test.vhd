library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity led_test is
    port(
        clk : in std_logic;
        btn : in std_logic_vector(4 downto 0);
        sw : in std_logic_vector(7 downto 0);
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0)
    );
end led_test;

architecture Behavioral of led_test is
    signal d7, d6, d5, d4, d3, d2, d1, d0 : std_logic_vector(7 downto 0) := (others => '1');
begin
    led_display : entity work.led_display
        port map(
            clk => clk,
            reset => '0',
            in_0 => d0,
            in_1 => d1,
            in_2 => d2,
            in_3 => d3,
            in_4 => d4,
            in_5 => d5,
            in_6 => d6,
            in_7 => d7,
            an => an,
            sseg => sseg
        );
    
    process(clk)
    begin
        if rising_edge(clk) then
            if(btn(0) = '1') then
                d0 <= sw;
            end if;
            
            if(btn(1) = '1') then
                d1 <= sw;
            end if;
                        
            if(btn(2) = '1') then
                d2 <= sw;
            end if;
            
            if(btn(3) = '1') then
                d3 <= sw;
            end if;
            
            if(btn(4) = '1') then
                d4 <= sw;
            end if;
        end if;
    end process;
end Behavioral;
