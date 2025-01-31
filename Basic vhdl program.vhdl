library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Intro is
port (
    sw1: in std_logic;
    sw2: in std_logic;
    sw3: in std_logic;
    led1: out std_logic;
    led2: out std_logic;
    led3: out std_logic
);
end Intro;

architecture Intro_ARCH of Intro is
begin
led1 <= sw1 or sw2 or sw3;
led2 <= (sw1 and sw2) or (sw1 and sw3) or (sw2 and sw3);
led3 <= sw1 and sw2 and sw3;
end Intro_ARCH;
