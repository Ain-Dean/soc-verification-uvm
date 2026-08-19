class alu_driver;
    virtual alu_interface vif;

    function new(virtual alu_interface vif);
        this.vif = vif;
    endfunction

    task drive_item(alu_sequence_item item);
        @(posedge vif.clk);
        vif.a    <= item.a;
        vif.b    <= item.b;
        vif.op   <= item.op;
        vif.rst_n <= 1'b1;
    endtask
endclass
