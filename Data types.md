###Standard logic
   - Expands the definition of bit to enchance simulation and syntehsis
   - Provides signal resolution capability
   - Conforms to IEEE Standard 1164

  Requires
  ``` vhdl
  library ieee;
  use ieeee.std_std_logic_1164.all
  ```

 ### values
 - U: unitnitalied
 - X: Forcing Unknown
 - 0: Forcing 0
 - 1: Forcing 1
 - Z: High Impedance
 - W: Weak unknown
 - L: Weaj 0
 - H: Weak 1
 - _ Don't care

### Scalar

#### enumerated
- bit
- std_logic
- boolean
- charater
#### Numeric
- integer
- real

#### Araay types
- bit vector: "1101" "001001110"
- std_logic_vector
- string

- collections
- files

##### constant delcarations

constant rfer_fwef: std_logic_vector(6 downto 0) := "100010":

constant ACTIVE: std_logic := '1';

#### Aritmetic operatios

#### logical operators

#### Relationsal Operators
- =
- /= - NOT EQUAL

#### shift operators
- sll

#### concantenation operator
``` vhdl
signal myNibble:  std_logic_vector(3 downto 0);
signal myByte01:  std_logic_vector(7 downto 0);
signal myByte02:  std_logic_vector(7 downto 0);

myNibble <= "01" & '1' & '0';
myByte01 <= "011" & myNibble & '1';
myByte02 <= "11" & myNibble(2 downto 1) & myByte01(7 downto 4);
```


range constriant: When using a datatype 




### class problem: Busses

signal dataBus:  std_logic_vector(31 downto 0); 
signal highLowBytes: std_logic_vector(15 downto 0); 
signal highByte: std_logic_vector(7 downto 0); 
signal lowByte: std_logic_vector(7 downto 0);     
signal statusBits:  
signal oddBit:      
signal signBit:   
std_logic_vector(7 downto 0); 
std_logic_vector(1 downto 0); std_logic; std_logic;

highbyte <= databus(31 downto 24);
lowbyte <= databus(7 downto 0);
oddbyte <= databus(31);
signbit <= databus(31);

highlowbtye <= hightbyte & lowbyte;
