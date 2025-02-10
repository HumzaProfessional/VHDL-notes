#### Process model

##### Name: process (signal01, signal02, etc)
declaration area:
- vadriabes
- constants

##### begin
definitions area:
- define funcitonality
- sequential statements

end process:

##### if statement
``` vhdl
if (boolean) then
  statements;
 elsif (boolean) then
statements; else
 statements;
end if;
```

##### case statements
- expressions and choices are the same data type
- Muitple choices are separed by '|'
- All choicrs must be mutually exclusive
``` vhdl
case (expression) is
when choices =>
statements;
 when choices =>
statements; when others =>
 statements;
end case;


```

##### case statement, with morethan2 signal
``` vhdl
case (switches) is
when "0111" | "1011" | "1110" | "1111" 
morethan 2 <= ACTIVE;
when others 
morethan2 <= ACTIVE;
```


##### for statements

``` vhdl
for i in 0 to 10 loop
  for j in 8 downto 1 loop
    statement;
  end loop;
end loop;

```

##### variables
- can only be declared in porcess, finctions. or procedures
- Updates values instantly when executed
- uses := for assignments
- can be intizaief during declaration

```` vhdl
MY_DRIVER: process(x, y)
  variable status: integer range 0 to 32;
  variable myVariable:  std_logic_vector(7 downto 0);
  variable myInitValue: integer range 0 to 16 := 0;
begin
   ...
  status := 12;
  ...
end process;

 ````

#### variables vs signals
Updating values
- variables update instantly
- signal updarte at the end of process
Declaration
- variables declared  inside processes
- signals declared outside prcoesses

Assignemnts
- Variables assigned with :=
- signals assigned with <=



#### example
= Write a process that will count te number of '0' valyrs in a 32 bit vector and ouput ACTUVE on output isEvan if number of 0's is even.

``` vhdl
process (datain)
  variable count: integer range 0 t0 32;
  isEven <= not ACTIVE
begin
  count :- 0;
for i in 0 to 31 loop
 if (datain(i) = '0') then
  count := count +1;
endif
if (count mod 2)
  isEven <= ACTIVE;
  endif
end process;

```
