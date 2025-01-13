## Steps in VhDl designo(or any digital design)

- Define design requirments
- Define design interfaces
- Declare design entity
- Develop system level strategy
- Declare design architecture 
- Test the design
- Synthesize the design

## Example Led and light bar

``` vhdl
entity Intro is
  port (
    sw1: in std_logic; 
    sw2: in std_logic;
    sw3: in std_logic;
    led1: out std_logic;
    led2: out std_logic;
    led3: out std_logic;

architecture Intro_ARCH of Intro is
begin
  led1 <= sw1 or sw2 or sw3
  led2 <= (sw1 and sw2) 
```
test benching

Advantages of High intergration

- More sillicon per unit area
- lower development costs
- lower power costs
- lower power consumption
- better performance
- faster time to market

Programmable device technology
- SSI/MSI componenets (ROMs, Muitplexers)
- Simple field profrmamable devices (PAL, PLA, PROM)
- Complex field programmable devices (CPLD, FPGA)
- Gate array asic
- - 
- Standard cell ASIC
- Full custome ASIC

decsion in process making


## Synthesis
high to low abtraction

