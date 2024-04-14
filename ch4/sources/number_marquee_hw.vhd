library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity number_marquee_hw is
    port (
        clk : in std_logic;
        btn : in std_logic_vector(1 downto 0);
        an : out std_logic_vector(7 downto 0);
        sseg : out std_logic_vector(7 downto 0)
    );
end number_marquee_hw;

architecture Behavioral of number_marquee_hw is
    constant CLOCK_HZ : natural := 100000000;
    constant NUM_DIGITS : natural := 10;
    
    signal disp_num : slv_array(NUM_DIGITS-1 downto 0)(3 downto 0) := (x"0", x"1", x"2", x"3", x"4", x"5", x"6", x"7", x"8", x"9");
    signal digit_0 : std_logic_vector(3 downto 0);
    signal digit_1 : std_logic_vector(3 downto 0);
    signal digit_2 : std_logic_vector(3 downto 0);
    signal digit_3 : std_logic_vector(3 downto 0);
begin

    number_marquee : entity work.number_marquee
    generic map (
        CLOCK_HZ => CLOCK_HZ,
        UPDATE_MS => 500,
        NUM_DIGITS => NUM_DIGITS
    )
    port map (
        clk => clk,
        en => not btn(0),
        dir => btn(1),
        disp_num => disp_num,
        digit_0 => digit_0,
        digit_1 => digit_1,
        digit_2 => digit_2,
        digit_3 => digit_3
    );
    
    display : entity work.led_hex_display
    port map(
        clk   => clk,
        reset => '0',
        hex_0 => digit_0,
        hex_1 => digit_1,
        hex_2 => digit_2,
        hex_3 => digit_3,
        hex_4 => "0000",
        hex_5 => "0000",
        hex_6 => "0000",
        hex_7 => "0000",
        dp_in => "11111111",
        an => an,
        sseg => sseg
    );
    
end Behavioral;
