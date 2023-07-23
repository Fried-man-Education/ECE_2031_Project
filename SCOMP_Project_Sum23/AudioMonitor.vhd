-- AudioMonitor.vhd
-- Created 2023
--
-- This SCOMP peripheral directly passes data from an input bus to SCOMP's I/O bus.

library IEEE;
library lpm;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use lpm.lpm_components.all;

entity AudioMonitor is
port(
    CS          : in  std_logic;
    IO_WRITE    : in  std_logic;
    SYS_CLK     : in  std_logic;  -- SCOMP's clock
    RESETN      : in  std_logic;
    AUD_DATA    : in  std_logic_vector(15 downto 0);
    AUD_NEW     : in  std_logic;
    IO_DATA     : inout  std_logic_vector(15 downto 0);
	 AVERAGE_S   :	out std_logic_vector(15 downto 0);		-- For debugging
	 window_sum1	:out std_logic_vector(31 downto 0)		-- For debugging
	 
);
end AudioMonitor;

architecture a of AudioMonitor is

	 type sample_type is array (0 to 4) of signed(15 downto 0);
    signal parsed_data 	: signed(15 downto 0); 										--data from audio monitor 16 bit signed audio data
    signal out_en       : std_logic;
    signal output_data  : std_logic_vector(15 downto 0);
	 signal average	   : signed(15 downto 0) := (others => '0');				-- running average
	 signal average_temp : signed(31 downto 0);
	 signal window_sum 	: signed(31 downto 0) := (others => '0');				-- sum of the current window
	 signal next_index 	: natural range 0 to 4 := 0;								-- next index to store data
	 signal count 			: natural range 0 to 4 := 0;								-- used to keep track of how many samples are added before array is full
	 signal max				: integer := 5;												-- maximum size of the sample array (should represent the number of clock cycles for 2.5s)
	 signal divisor		: natural range 0 to 5 := 0;	
	 signal sample 	   : sample_type;

begin

    -- Latch data on rising edge of CS to keep it stable during IN
	 
    process (CS) begin
        if rising_edge(CS) then
            output_data <= std_logic_vector(average);
        end if;
    end process;
	 
    -- Drive IO_DATA when needed.
	 
    out_en <= CS AND ( NOT IO_WRITE );
    with out_en select IO_DATA <=
        output_data        when '1',
        "ZZZZZZZZZZZZZZZZ" when others;

	 
    process (RESETN, AUD_NEW)
    begin
        if (RESETN = '0') then
		  
            -- Reset values when RESETN is low
				
            parsed_data <= x"0000";
            sample <= (others => (others => '0'));
            window_sum <= (others => '0');
            average <= (others => '0');

        elsif (rising_edge(AUD_NEW)) then
		  
            -- Parse the new data from AUD_DATA as signed 16-bit
				
            parsed_data <= signed(AUD_DATA);

            -- Calculate the moving average using a sliding window
				
            next_index <= (next_index + 1) mod max;   -- Update the next index 

            if (count < max) then
				
                -- If sample array is not full yet, add the new sample to the window
					 
                sample(count) <= parsed_data;
                window_sum <= window_sum + abs(parsed_data);   	-- Update the sum with the absolute value of the new sample
					 
                count <= count + 1;                           		-- Increment the count of samples in the window
					 
                divisor <= count;                                	-- Update the divisor with the value count

            else
                -- If the sample array is full, replace the oldest sample with the new sample
					 
                window_sum <= window_sum + abs(parsed_data) - sample(next_index);
                sample(next_index) <= parsed_data;
                divisor <= max;   													-- divisor is the size of the sample array

            end if;

            -- Calculate the average using the sum and the number of samples in the window
				
            average_temp <= window_sum / to_signed(max, window_sum'length);
            average <= resize(average_temp, average'length);  		 		-- Resize the average to 16 bits
            AVERAGE_S <= std_logic_vector(average);            			-- Output the average as a 16-bit vector for debugging
            window_sum1 <= std_logic_vector(window_sum);       			-- Output the window sum as a 32-bit vector for debugging

        end if;
    end process;

end a;