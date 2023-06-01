module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] state = 0;

always @(clk) begin

    if (result)
    begin
        if(taken)
            state = &state ? state : state + 1;
        else 
            state = |state ? state -1 : state ;
    end

    if(request)
    begin
        prediction = state[1];
    end


end


endmodule
