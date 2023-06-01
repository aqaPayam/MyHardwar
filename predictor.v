module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] state = 2'b11;

always @(posedge clk) begin

    if (result)
    begin
        if(taken)
            state = &state ? state : state + 1;
        else 
            state = |state ? state -1 : state ;
    end

    if(request)
        prediction = state[1];


end


endmodule
