``` vhdl
signal <name>: <data type>; // notation
```

Signals can be grouped together in VHDL.  
- These groupings are called vectors. •
-  Specify bit value range •
-  Can use downto or to in range declaration •
-  Can access subvectors within vector •
-  Can access individual signals within vector •
-  Can merge vectors into larger vector

``` vhdl
architecture myDesign_ARCH of myDesign is 
signal dataBus:   
std_logic_vector(7 downto 0);
signal highNibble: std_logic_vector(3 downto 0); 
signal signBit: std_logic; 
begin 
highNibble <= dataBus(7 downto 4); 
signBit   <= dataBus(7); 
... 
end myDesign_ARCH;
```

#### conditional signal codes
- Treated as single concurrent data flow statement
- complex conditions possible
- implited priority

``` vhdl
with sel select
x <= d when "00",
    c when "01",
    b when "10",
    a when others;
```

