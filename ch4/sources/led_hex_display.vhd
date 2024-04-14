library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use ieee.numeric_std.all;

entity led_hex_display is
  port (
    clk   : in std_logic;
    reset : in std_logic;
    hex_0 : in std_logic_vector(3 downto 0);
    hex_1 : in std_logic_vector(3 downto 0);
    hex_2 : in std_logic_vector(3 downto 0);
    hex_3 : in std_logic_vector(3 downto 0);
    hex_4 : in std_logic_vector(3 downto 0);
    hex_5 : in std_logic_vector(3 downto 0);
    hex_6 : in std_logic_vector(3 downto 0);
    hex_7 : in std_logic_vector(3 downto 0);
    dp_in : in std_logic_vector(7 downto 0);
    an : out std_logic_vector(7 downto 0);
    sseg : out std_logic_vector(7 downto 0)
  );
end entity;

architecture Behavioral of led_hex_display is
    constant N : integer := 16;
    signal q_reg : unsigned(N downto 0);
    signal q_next : unsigned(N downto 0);
    signal sel : std_logic_vector(2 downto 0);
    signal hex : std_logic_vector(3 downto 0);
    signal dp : std_logic;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            q_reg <= (others => '0');
        elsif rising_edge(clk) then
            q_reg <= q_next;
        end if;
    end process;

    q_next <= q_reg + 1;
    
    sel <= std_logic_vector(q_reg(N downto N-2));
    
    process(sel, dp_in, hex_0, hex_1, hex_2, hex_3, hex_4, hex_5, hex_6, hex_7)
    begin
        case sel is
            when "000" =>
                an(7 downto 0) <= "11111110";
                hex <= hex_0;
                dp <= dp_in(0);
            when "001" =>
                an(7 downto 0) <= "11111101";
                hex <= hex_1;
                dp <= dp_in(1);
            when "010" =>
                an(7 downto 0) <= "11111011";
                hex <= hex_2;
                dp <= dp_in(2);
            when "011" =>
                an(7 downto 0) <= "11110111";
                hex <= hex_3;
                dp <= dp_in(3);
            when "100" =>
                an(7 downto 0) <= "11101111";
                hex <= hex_4;
                dp <= dp_in(4);
            when "101" =>
                an(7 downto 0) <= "11011111";
                hex <= hex_5;
                dp <= dp_in(5);
            when "110" =>
                an(7 downto 0) <= "10111111";
                hex <= hex_6;
                dp <= dp_in(6);
            when "111" =>
                an(7 downto 0) <= "01111111";
                hex <= hex_7;
                dp <= dp_in(7);
        end case;
    end process;
    
    with hex select
        sseg(6 downto 0) <=
            "1000000" when "0000",
            "1111001" when "0001",
            "0100100" when "0010",
            "0110000" when "0011",
            "0011001" when "0100",
            "0010010" when "0101",
            "0000010" when "0110",
            "1111000" when "0111",
            "0000000" when "1000",
            "0010000" when "1001",
            "0001000" when "1010",
            "0000011" when "1011",
            "1000110" when "1100",
            "0100001" when "1101",
            "0000110" when "1110",
            "0001110" when "1111";
        sseg(7) <= dp;        
end architecture;
