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

### Generic Down counter quiz qeustion

``` vhdl
entity counter is
 generic (
       SIZE: interger);
       port (
            loadEN: in std_logic;
            decrementEN: in std_logic;
            startCount: in std_logic_vector(SIZe-1 downto 0)
            )

architecture Counter_ARCH of Counter is
  ocnstant ACTIVE: std_logic := '1';
  begin
     process( reset, clock)
       variable count: unsigned(SIZE-1 downto 0),
    begin 
      if (reset := ACTIVE) then
        count := 0;
        currentCount :- 0;
        zeroCOuntEN <= not ACTIVE;
          elsif(risign_edge(clock)) then
             if(LoadEN = ACTIVE) then
               count := unsigned(startCount);
            elsif(decrementEn = ACTIVE) then
             if (count /= 0) then
                count := count - 1;
                if (count - 0) then
                  zeroCountEN <= ACTIVE
                endif;
            endif
        endif
    currentCount <= std_logic_vector(count);
  endif;
```             
              
