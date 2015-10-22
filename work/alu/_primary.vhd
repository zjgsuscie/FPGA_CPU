library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        op              : in     vl_logic;
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        c               : out    vl_logic_vector(7 downto 0)
    );
end alu;
