-- This lab demonstrates a 4 inputs of votes from referees.
-- It determine the decision of the call from the votes.
-- The vote is determined by the majority: either 1's or 0's.
-- if there 

--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VoteSelect is -- making of the port
  port(
    headref: in std_logic; -- defines the first bit: the heaf ref
    ref1 : in std_logic;
    ref2 : in std_logic;
    ref3: in std_logic;
    finalvote: out std_logic -- the output signal
    );

end VoteSelect;

architecture Behavioral_ARCH of VoteSelect is 
    signal votes: std_logic_vector(3 downto 0); -- vector which will contain the votes as bits
begin
    votes <= headref & ref1 & ref2 & ref3; -- each vote is assigned to each bit of votes vector.

  
    with votes select
        finalvote <= '0' when "0000",  -- 0 '1's: Majority '0'
                '0' when "0001",  --
                '0' when "0010",  
                headref when "0011", -- 2 '1's: Tie, use head_ref's vote
                '0' when "0100", 
                headref when "0101", -- 2 '1's: Tie
                headref when "0110", -- 2 '1's: Tie
                '1' when "0111",  
                '0' when "1000",  
                headref when "1001", -- 2 '1's: Tie
                headref when "1010", -- 2 '1's: Tie
                '1' when "1011",  -- 
                headref when "1100", -- 2 '1's: Tie
                '1' when "1101",  
                '1' when "1110",  
                '1' when "1111",  -- 4 '1's: Majority '1'
                'X' when others;    -- Undefined case
end Behavioral_ARCH;
  
  

    
