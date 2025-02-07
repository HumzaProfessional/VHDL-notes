--*******************************************************************************
-- MyChip
-- Designer: Scott Tippens
--
-- Wrapper for MirrorSegments Project to map Basys3 resources to MirrorSegments
-- ports.  We will be using the 4 right most slide switches for the value input.
-- The center button on the digital button pad will be our mode input and we will
-- use the right most 7-segment display for our digit.
--
--*******************************************************************************
library ieee;
use ieee.std_logic_1164.all;


entity MyChip is
	port (
		sw:   in  std_logic_vector(3 downto 0);    --slide switch inputs
		btnC: in  std_logic;                       --center button digtital pad
		seg:  out std_logic_vector (6 downto 0);   --segments for 7-seg displays
		an:   out std_logic_vector (3 downto 0));  --anodes for 7-seg displays
end MyChip;

architecture MyChip_ARCH of MyChip is

	-------------------------------------------------------------------CONSTANTS
	constant SELECT_RIGHT_7SEG_DISPLAY: std_logic_vector(3 downto 0) := "1110";

	--mirrored-segment-driver------------------------------------------COMPONENT
	component MirroredSegments
		port(
			value:    in  std_logic_vector(3 downto 0);
			mode:     in  std_logic;
			sevenSeg: out std_logic_vector(6 downto 0)
		);
	end component;

	--internal connections-----------------------------------------------SIGNALS
	signal sevenSeg: std_logic_vector(6 downto 0);

begin
	an   <= SELECT_RIGHT_7SEG_DISPLAY;
	
	--reverse-bit-order-for-segments-to-match-Basys3-connections----------------
	seg(0) <= sevenSeg(6);
	seg(1) <= sevenSeg(5);
	seg(2) <= sevenSeg(4);
	seg(3) <= sevenSeg(3);
	seg(4) <= sevenSeg(2);
	seg(5) <= sevenSeg(1);
	seg(6) <= sevenSeg(0);

	--segment-driver---------------------------------------------------COMPONENT
	SEGMENT_DRIVER: MirroredSegments port map (
		value => sw,
		mode  => btnC,
		sevenSeg => sevenSeg
	);

end MyChip_ARCH;
