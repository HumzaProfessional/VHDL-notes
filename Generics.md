### Ovwrview
- Provide methods for passing parameters to components
- Allows more general design desrciptions
- Redices development/debug time
- Allows flexible simulatnous isntantiaiotn

### Declaring a Generic Compoenent - Register 
```` vhdl
library ieee;
use ieee.std_logic_1164.all;

entity Register is
  generic(SIZE: positive);
  port (
      reset: in std_logic;
      clock: in std_logic;
      dataIn: in std_logic_vector(SIZE-1 downto 0);
      dataOut: out std_logic_vector(SIZE-1 downto 0)
      
      );
end  Register;

architecture Register_ARCH of Register is
  constant ACTIVE: std_logic := '1';
begin
  process(reset, clock)
  begin
    if (reset=ACTIVE)
       dataOut <= (others=>'0');
    elsif (rising_edge(clock)) then
       dataOut <= dataIn;
   end if;
end process;
end Register_ARCH;
 



````
