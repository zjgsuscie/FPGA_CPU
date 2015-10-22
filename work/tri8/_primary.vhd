library verilog;
use verilog.vl_types.all;
entity tri8 is
    port(
        \on\            : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0)
    );
end tri8;
