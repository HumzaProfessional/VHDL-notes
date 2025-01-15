
``` vhdl
entity Intro is //
  port (
    sw1: in std_logic; // name: port-mode 
    sw2: in std_logic;
    sw3: in std_logic;
    led1: out std_logic;
    led2: out std_logic;
    led3: out std_logic;
end Intro;

architecture Intro_ARCH of Intro is
begin
  led1 <= sw1 or sw2 or sw3
  led2 <= (sw1 and sw2) 
```



### component diagram

  #######################
--# sw3              led3# 
  #                      #
--#sw2               led2#




Signals - connect elements of a block diagram
``` vhdl
signal myWire: std_logic;
signal myBus: std_logic_vector(15 downto 0);
signal count: integer rsnge to 0 to 2000

myWire <= '1'
my

```



## Naming Conventions

General guildines
- Entity, architecture, componenet: UpperCamelCase
- Signals, variables: lowerCamelCase
- Constants: ALL_UPPER_CASE
- Reverse words: lowercaae

specific guidlines
- Architexture names: EntityName_ARCH
- Process labels: REGISTER_CONTROL
