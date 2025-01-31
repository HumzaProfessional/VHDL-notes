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

### test bench

SWITCH_DRIVER: process is
begin
sw1 <= not ACTIVE;
sw2 <= not ACTIVE;
sw3 <= not ACTIVE;
wait for 100ns;
sw1 <= ACTIVE;
sw2 <= not ACTIVE;
sw3 <= not ACTIVE;
wait for 100ns;
sw1 <= not ACTIVE;
sw2 <= ACTIVE;
sw3 <= not ACTIVE;
wait for 100ns;
sw1 <= ACTIVE;
sw2 <= ACTIVE;
sw3 <= not ACTIVE;
wait for 100ns;
sw1 <= not ACTIVE;
sw2 <= not ACTIVE;
sw3 <= ACTIVE;
wait for 100ns;
sw1 <= ACTIVE;
Tippens
sw2 <= not ACTIVE;
sw3 <= ACTIVE;
wait for 100ns;
sw1 <= not ACTIVE;
sw2 <= ACTIVE;
sw3 <= ACTIVE;
wait for 100ns;
sw1 <= ACTIVE;
sw2 <= ACTIVE;
sw3 <= ACTIVE;
wait;
end process;
