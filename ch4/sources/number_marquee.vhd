library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.util_pkg.all;

entity number_marquee is
    generic (
        CLOCK_HZ : natural;
        UPDATE_MS : natural;
        NUM_DIGITS : natural
    );
    port (
        clk : in std_logic;
        en : in std_logic;
        dir : in std_logic;
        disp_num : in slv_array(NUM_DIGITS-1 downto 0)(3 downto 0);
        digit_0 : out std_logic_vector(3 downto 0);
        digit_1 : out std_logic_vector(3 downto 0);
        digit_2 : out std_logic_vector(3 downto 0);
        digit_3 : out std_logic_vector(3 downto 0)
    );
end number_marquee;

architecture Behavioral of number_marquee is
    signal index_0_reg, index_0_next : unsigned(ceil_log2(NUM_DIGITS)-1 downto 0);
    signal index_1_reg, index_1_next : unsigned(ceil_log2(NUM_DIGITS)-1 downto 0);
    signal index_2_reg, index_2_next : unsigned(ceil_log2(NUM_DIGITS)-1 downto 0);
    signal index_3_reg, index_3_next : unsigned(ceil_log2(NUM_DIGITS)-1 downto 0);
    signal count : std_logic_vector(ceil_log2(NUM_DIGITS)-1 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            index_0_reg <= index_0_next;
            index_1_reg <= index_1_next;
            index_2_reg <= index_2_next;
            index_3_reg <= index_3_next;
        end if;
    end process;
    
    index_0_next <= resize((unsigned(count) + 0) mod NUM_DIGITS, index_0_next'length);
    index_1_next <= resize((unsigned(count) + 1) mod NUM_DIGITS, index_1_next'length);
    index_2_next <= resize((unsigned(count) + 2) mod NUM_DIGITS, index_2_next'length);
    index_3_next <= resize((unsigned(count) + 3) mod NUM_DIGITS, index_3_next'length);

    counter : entity work.counter
    generic map (
        CLOCK_HZ => CLOCK_HZ,
        TICK_MS => UPDATE_MS,
        COUNT_MAX => NUM_DIGITS
    )
    port map(
        clk => clk,
        en => en,
        up => dir,
        tick => open,
        count => count
    );
    
    digit_0 <= disp_num(to_integer(index_0_reg));
    digit_1 <= disp_num(to_integer(index_1_reg));
    digit_2 <= disp_num(to_integer(index_2_reg));
    digit_3 <= disp_num(to_integer(index_3_reg));

end Behavioral;
