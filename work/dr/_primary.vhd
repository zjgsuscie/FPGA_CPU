library verilog;
use verilog.vl_types.all;
entity dr is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end dr;
