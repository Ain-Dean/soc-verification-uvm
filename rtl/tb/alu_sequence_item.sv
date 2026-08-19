class alu_sequence_item;
    rand logic [7:0] a;
    rand logic [7:0] b;
    rand logic [1:0] op;
    logic [7:0] result;

    // Constraint to prevent division-like underflows or filter operations
    constraint valid_ops { op inside {[2'b00 : 2'b10]}; }
endclass
