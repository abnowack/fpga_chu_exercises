library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dimmable_display is
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
        sseg : out std_logic_vector(7 downto 0);
        w : in std_logic_vector(3 downto 0)
    );
end dimmable_display;

architecture Behavioral of dimmable_display is
    signal wave : std_logic;
    signal an_dim : std_logic_vector(7 downto 0);
begin

    square_wave_gen : entity work.square_wave_generator
         generic map(
            DVSR => 10,
            N_RES => 4
         )
         port map(
             clk => clk,
             m => w,
             n => (others => '1'),
             wave => wave
         );
         
     display : entity work.led_hex_display
         port map(
             clk   => clk,
             reset => reset,
             hex_0 => hex_0,
             hex_1 => hex_1,
             hex_2 => hex_2,
             hex_3 => hex_3,
             hex_4 => hex_4,
             hex_5 => hex_5,
             hex_6 => hex_6,
             hex_7 => hex_7,
             dp_in => dp_in,
             an => an_dim,
             sseg => sseg
         );
     
     an <= an_dim when (wave = '1') else (others => '1');

end Behavioral;
