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
  generic(SIZEE: positive);
  port (
      reset: in std_logic;
      clock: in std_logic;
      dataIn: in std_logic_vector(SIZE-1 downto 0);
      dataOut: out std_logic_vector(SIZE-1 downto 0)
      
      );
end 

````
