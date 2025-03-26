library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RandomNumberGenerator is
    Port (
        button     : in  std_logic;  -- Start button input
        reset      : in  std_logic;  -- Asynchronous reset (active high)
        clock      : in  std_logic;  -- System clock
        segDisplay : out std_logic_vector(6 downto 0)  -- 7-seg display output
    );
end RandomNumberGenerator;

architecture Behavioral of RandomNumberGenerator is

    -- Define a state machine to control the operation.
    type state_type is (Idle, Generate, Display);
    signal state      : state_type := Idle;

    -- A counter to count the number of generated numbers (0 to 5).
    signal gen_count  : integer range 0 to 5 := 0;

    -- LFSR for pseudo-random number generation (4-bit).
    signal lfsr       : std_logic_vector(3 downto 0) := "1011"; -- initial seed
    signal random_val : integer range 0 to 9;  -- Random digit (0-9)

    -- Timing counter for how long each number is displayed.
    signal display_timer : integer := 0;
    constant DISPLAY_TIME : integer := 5000000; -- adjust for your clock frequency

    -- For button edge detection.
    signal button_prev : std_logic := '0';
    signal button_edge : std_logic := '0';

    -- Function to decode a digit (0-9) into a 7-seg pattern.
    function seg_decoder(digit: integer) return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case digit is
            when 0 => seg := "1000000";  -- 0
            when 1 => seg := "1111001";  -- 1
            when 2 => seg := "0100100";  -- 2
            when 3 => seg := "0110000";  -- 3
            when 4 => seg := "0011001";  -- 4
            when 5 => seg := "0010010";  -- 5
            when 6 => seg := "0000010";  -- 6
            when 7 => seg := "1111000";  -- 7
            when 8 => seg := "0000000";  -- 8
            when 9 => seg := "0010000";  -- 9
            when others => seg := "1111111";  -- All segments off
        end case;
        return seg;
    end seg_decoder;

begin

    -- LFSR Process: Update the LFSR on each clock edge.
    LFSR_Process: process(clock, reset)
    begin
        if reset = '1' then
            lfsr <= "1011";  -- Reset seed
        elsif rising_edge(clock) then
            -- A simple 4-bit LFSR with taps on bit 3 and bit 2 (x^4 + x^3 + 1)
            lfsr <= lfsr(2 downto 0) & (lfsr(3) xor lfsr(2));
        end if;
    end process;

    -- Main State Machine Process
    Main_Process: process(clock, reset)
    begin
        if reset = '1' then
            state         <= Idle;
            gen_count     <= 0;
            display_timer <= 0;
            segDisplay    <= seg_decoder(0);
            button_prev   <= '0';
        elsif rising_edge(clock) then

            -- Simple edge detection for the button.
            if (button = '1' and button_prev = '0') then
                button_edge <= '1';
            else
                button_edge <= '0';
            end if;
            button_prev <= button;

            case state is
                when Idle =>
                    -- Wait for a button press to start the generation sequence.
                    if button_edge = '1' then
                        state     <= Generate;
                        gen_count <= 0;
                    end if;

                when Generate =>
                    -- Generate a new random digit using the LFSR.
                    random_val <= to_integer(unsigned(lfsr)) mod 10;
                    state <= Display;
                    display_timer <= 0;

                when Display =>
                    -- Display the generated number.
                    segDisplay <= seg_decoder(random_val);
                    display_timer <= display_timer + 1;
                    if display_timer = DISPLAY_TIME then
                        gen_count <= gen_count + 1;
                        if gen_count = 5 then
                            -- Generation sequence complete; go back to Idle.
                            state <= Idle;
                        else
                            -- Generate next number.
                            state <= Generate;
                        end if;
                    end if;

                when others =>
                    state <= Idle;
            end case;
        end if;
    end process;

end Behavioral;
