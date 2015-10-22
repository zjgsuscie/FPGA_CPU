library verilog;
use verilog.vl_types.all;
entity tri6 is
    port(
        \on\            : in     vl_logic;
        din             : in     vl_logic_vector(5 downto 0);
        dout            : out    vl_logic_vector(5 downto 0)
    );
end tri6;
