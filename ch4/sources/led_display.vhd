library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use ieee.numeric_std.all;

entity led_display is
  port (
    clk   : in std_logic;
    reset : in std_logic;
    in_0 : in std_logic_vector(7 downto 0);
    in_1 : in std_logic_vector(7 downto 0);
    in_2 : in std_logic_vector(7 downto 0);
    in_3 : in std_logic_vector(7 downto 0);
    in_4 : in std_logic_vector(7 downto 0);
    in_5 : in std_logic_vector(7 downto 0);
    in_6 : in std_logic_vector(7 downto 0);
    in_7 : in std_logic_vector(7 downto 0);
    an : out std_logic_vector(7 downto 0);
    sseg : out std_logic_vector(7 downto 0)
  );
end entity;

architecture Behavioral of led_display is
    constant N : integer := 17;
    signal q_reg : unsigned(N-1 downto 0);
    signal q_next : unsigned(N-1 downto 0);
    signal sel : std_logic_vector(2 downto 0);
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
    
    sel <= std_logic_vector(q_reg(N-1 downto N-3));
    
    process(sel, in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7)
    begin
        case sel is
            when "000" =>
                an(7 downto 0) <= "11111110";
                sseg <= in_0;
            when "001" =>
                an(7 downto 0) <= "11111101";
                sseg <= in_1;
            when "010" =>
                an(7 downto 0) <= "11111011";
                sseg <= in_2;
            when "011" =>
                an(7 downto 0) <= "11110111";
                sseg <= in_3;
            when "100" =>
                an(7 downto 0) <= "11101111";
                sseg <= in_4;
            when "101" =>
                an(7 downto 0) <= "11011111";
                sseg <= in_5;
            when "110" =>
                an(7 downto 0) <= "10111111";
                sseg <= in_6;
            when "111" =>
                an(7 downto 0) <= "01111111";
                sseg <= in_7;
        end case;
    end process;

end architecture;
