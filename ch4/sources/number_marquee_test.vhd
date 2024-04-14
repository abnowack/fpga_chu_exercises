library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity number_marquee_test is
end number_marquee_test;

architecture Behavioral of number_marquee_test is
    constant CLOCK_HZ : natural := 100000000;
    constant NUM_DIGITS : natural := 10;
    
    constant CLOCK_PERIOD : time := (1000000000 / CLOCK_HZ) * 1 ns;

    signal clk : std_logic := '0';

    signal disp_num : slv_array(NUM_DIGITS-1 downto 0)(3 downto 0) := (x"0", x"1", x"2", x"3", x"4", x"5", x"6", x"7", x"8", x"9");
    signal digit_0 : std_logic_vector(3 downto 0);
    signal digit_1 : std_logic_vector(3 downto 0);
    signal digit_2 : std_logic_vector(3 downto 0);
    signal digit_3 : std_logic_vector(3 downto 0);
begin

    clk <= not clk after CLOCK_PERIOD / 2;

    number_marquee : entity work.number_marquee
    generic map (
        CLOCK_HZ => CLOCK_HZ,
        UPDATE_MS => 500,
        NUM_DIGITS => NUM_DIGITS
    )
    port map (
        clk => clk,
        disp_num => disp_num,
        digit_0 => digit_0,
        digit_1 => digit_1,
        digit_2 => digit_2,
        digit_3 => digit_3
    );
    
end Behavioral;
