### 3-t0-8 decoder
``` vhdl
with sel select
data <= "00000001" when "000",
        "00000010" when "001",
        "00000100" when "010",
        "00001000" when "011",
        "00010000" when "100",
        "00100000" when "101",
        "01000000" when "110",
        "10000000" when others,
```

### 8-t0-3 encoder

``` vhdl
code <= "111" when ( data(7)='1' ) else 
        "110" when ( data(6)='1' ) else 
        "101" when ( data(5)='1' ) else 
        "100" when ( data(4)='1' ) else 
        "011" when ( data(3)='1' ) else 
        "010" when ( data(2)='1' ) else 
        "001" when ( data(1)='1' ) else 
        "000" when others;
```

### muitplexer 

``` vhdl
with sel select 
x <= dataIn(0) when "000",    
    dataIn(1) when "001",   
    dataIn(2) when "010",     
    dataIn(3) when "011",     
    dataIn(4) when "100",     
    dataIn(5) when "101",    
    dataIn(6) when "110",    
    dataIn(7) when others;
```






#### 4 fundammental design elemetns
- code conversion: takes code singals and 
- signal routing: ex: taking a bus and dividing between parts of the design
- storage: holding information
- control: 


### challegne progblem - barrel shifter - 8bit

this will require a process 

``` vhdl
process(data bus, shiftby, direction)
begin 
   if (shiftby = "000") then
    data out <= databus;
    elsif( shiftby = "001") then
     if(direction = '0') then
              dataout <= '0' & databus(7 downto 1);
              else
              dataout <= databus(6 downto 0) & '0';
              endif;
```

### barrel shifter - 32 bit

``` vhdl
process (databus, shiftby, direction)
        variable tempdata; shiftby(31 downto 0)
begin
        tempdata := databus;
        for i in 0 to 31 loop
        if(shiftby < i) then
                if(direction = '0') then
                        tempdata := '0' & tempdata(31 downto 1);
                 else
                        tempdata := tem
                 endif
            

```
