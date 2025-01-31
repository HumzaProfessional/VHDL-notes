library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VOTE_SELECT is
  port(
    head_ref: in std_logic;
    ref_1 : in std_logic;
    ref_2 : in std_logic;
    ref_2: in std_logic;
    vote: out std_logic

    );

end VOTE_SELECT

 architecture Behavioral of VOTE_SELECT is
    signal vote_count : integer range 0 to 4;
    signal votes      : std_logic_vector(3 downto 0);
begin
    votes <= head_ref & ref_1 & ref_2 & ref_3; -- each vote is assigned to each bit of votes vector.

    -- Count the number of '1's
  process(votes)
     begin
        vote_count <= to_integer(unsigned(votes(0))) + -- integers are needed to add up thr votes
                     to_integer(unsigned(votes(1))) +
                     to_integer(unsigned(votes(2))) +
                     to_integer(unsigned(votes(3)));
     end process;


  
    with votes select
        vote <= '0' when "0000",  -- 0 '1's: Majority '0'
                '0' when "0001",  --
                '0' when "0010",  
                head_ref when "0011", -- 2 '1's: Tie, use head_ref's vote
                '0' when "0100", 
                head_ref when "0101", -- 2 '1's: Tie
                head_ref when "0110", -- 2 '1's: Tie
                '1' when "0111",  
                '0' when "1000",  
                head_ref when "1001", -- 2 '1's: Tie
                head_ref when "1010", -- 2 '1's: Tie
                '1' when "1011",  -- 
                head_ref when "1100", -- 2 '1's: Tie
                '1' when "1101",  
                '1' when "1110",  
                '1' when "1111",  -- 4 '1's: Majority '1'
                'X' when others;    -- Undefined case
    -- Determine the outcome using with-select
 --   with vote_count select
   --     vote <= '1' when 3 | 4,                -- Majority '1'
     --           head_ref when 2,               -- Tie: head_ref's vote
       --         '0' when 0 | 1,                -- Majority '0'
         --       'X' when others;               -- Undefined (shouldn't occur)
end Behavioral;
  
 
    
