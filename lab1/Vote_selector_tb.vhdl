library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity Voter_TB is -- entity is not needed
end Voter_TB;

architecture Voter_TB_ARCH of Voter_TB is -- declaration of port
  component Voter
  port (
        signal headref: in std_logic; 
        signal ref1 : in std_logic;
        signal ref2 : in std_logic;
        signal ref3: in std_logic;
        signal finalvote : out std_logic
    );
  end component;

  signal headref : std_logic; -- declarations of signals
  signal ref1 : std_logic;
  signal ref2 : std_logic;
  signal ref3 : std_logic;
  signal finalvote: std_logic;

begin 
  UUT: Voter port map( -- delcaration of inputs and outputs
    head_ref => headref,
    ref1 => ref1,
    ref2 => ref2,
    ref3 => ref3,
    finalvote => finalvote
    );

SWITCH_DRIVER: process -- where akk possible outputs are decided
begin
    headref <= '0'; -- all votes are 0, so the vector will be "0000"
    ref1 <= '0';
    ref2 <= '0';
    ref3 <= '0';
    wait for 20 ns; -- waiting needed for delay
    headref <= '1'; -- vote is "1000", 0 is the final votes
    ref1 <= '0';
    ref2 <= '0';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '1';
    ref2 <= '0';
    ref3 <= '0';
    wait for 20 ns;
   headref <= '1';
    ref1 <= '1';
    ref2 <= '0';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '0';
    ref2 <= '1';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '0';
    ref2 <= '1';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '1';
    ref2 <= '1';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '1';
    ref2 <= '1';
    ref3 <= '0';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '0';
    ref2 <= '0';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '0';
    ref2 <= '0';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '1';
    ref2 <= '0';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '1';
    ref2 <= '0';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '0';
    ref2 <= '1';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '0';
    ref2 <= '1';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '0';
    ref1 <= '1';
    ref2 <= '1';
    ref3 <= '1';
    wait for 20 ns;
    headref <= '1';
    ref1 <= '1';
    ref2 <= '1';
    ref3 <= '1';
    wait; --suspend process forever
end process;

end Voter_TB_ARCH;
      


    
    
    

    
    
    
