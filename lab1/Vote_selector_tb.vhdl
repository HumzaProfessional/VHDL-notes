library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Voter_TB is
end Voter_TB;

architecture Voter_TB_ARCH of Voter_TB is 
  component Voter
  port (
        signal head_ref: in std_logic;
        signal ref_1 : in std_logic;
        signal ref_2 : in std_logic;
        signal ref_3: in std_logic;
        signal vote : out std_logic
    );
  end component;

  signal head_ref : std_logic;
  signal ref_1 : std_logic;
  signal ref_2 : std_logic;
  signal ref_3 : std_logic;
  signal vote: std_logic;

begin 
  UUT: Voter port map(
    head_ref => head_ref,
    ref_1 => ref_1,
    ref_2 => ref_2,
    ref_3 => ref_3,
    vote => vote
    );

SWITCH_DRIVER: process
begin
    head_ref <= '0';
    ref_1 <= '0';
    ref_2 <= '0';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '0';
    ref_2 <= '0';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '1';
    ref_2 <= '0';
    ref_3 <= '0';
    wait for 20 ns;
   head_ref <= '1';
    ref_1 <= '1';
    ref_2 <= '0';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '0';
    ref_2 <= '1';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '0';
    ref_2 <= '1';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '1';
    ref_2 <= '1';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '1';
    ref_2 <= '1';
    ref_3 <= '0';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '0';
    ref_2 <= '0';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '0';
    ref_2 <= '0';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '1';
    ref_2 <= '0';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '1';
    ref_2 <= '0';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '0';
    ref_2 <= '1';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '0';
    ref_2 <= '1';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '0';
    ref_1 <= '1';
    ref_2 <= '1';
    ref_3 <= '1';
    wait for 20 ns;
    head_ref <= '1';
    ref_1 <= '1';
    ref_2 <= '1';
    ref_3 <= '1';
    wait; --suspend process forever
end process;

end Voter_TB_ARCH;
      


    
    
    

    
    
    
