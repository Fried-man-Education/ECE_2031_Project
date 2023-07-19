-- AudioMonitor.vhd
-- Created 2023
--
-- This SCOMP peripheral directly passes data from an input bus to SCOMP's I/O bus.

library IEEE;
library lpm;

use IEEE.std_logic_1164.all;
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
    IO_DATA     : inout  std_logic_vector(15 downto 0)
);
end AudioMonitor;

architecture a of AudioMonitor is

    signal out_en      			: std_logic;
    signal parsed_data 			: std_logic_vector(15 downto 0);
    signal output_data 			: std_logic_vector(15 downto 0);
	 signal sample_count   		: integer range 0 to 30000000 := 0; -- counter for number of samples
    signal sum_abs_samples 	: integer; 									-- sum of absolute values of samples
	 signal avg_abs_samples		: integer;									-- average of absolute values of samples
	 constant divisor				: integer := 30000000;					-- amount of clock cycles equivalent to 2.5s 
		
begin

    -- Latch data on rising edge of CS to keep it stable during IN
    process (CS) begin
        if rising_edge(CS) then
            output_data <=  std_logic_vector(to_unsigned(avg_abs_samples, output_data'length));
        end if;
    end process;
    -- Drive IO_DATA when needed.
    out_en <= CS AND ( NOT IO_WRITE );
    with out_en select IO_DATA <=
        output_data        when '1',
        "ZZZZZZZZZZZZZZZZ" when others;

    -- This template device just copies the input data
    -- to IO_DATA by latching the data every time a new
    -- value is ready.
process (RESETN, SYS_CLK) -- Process is sensitive to the RESETN and SYS_CLK signals
    begin
        if (RESETN = '0') then 			
            parsed_data <= (others => '0'); 
            sum_abs_samples <= 0; 							-- Reset sum_abs_samples to 0
            sample_count <= 0; 								-- Reset sample_count to 0
            avg_abs_samples <= 0;							-- Reset avg_abs_samples to 0
        elsif (rising_edge(AUD_NEW)) then
            parsed_data <= AUD_DATA; 						-- Copy the current audio data into parsed_data
				
            sum_abs_samples <= sum_abs_samples + to_integer(signed(parsed_data)); -- Add the absolute value of the parsed data to the running sum
				
            sample_count <= sample_count + 1; 							-- Increment the sample_count
            if sample_count = divisor then 								-- If the sample count has reached the divisor (i.e., we have accumulated enough samples)
                avg_abs_samples <= sum_abs_samples / divisor; 		-- Calculate the average of absolute sample values
                sample_count <= 0; 											-- Reset the sample count for the next averaging period
            end if;
        end if;
    end process;

end a; -- End of architecture a