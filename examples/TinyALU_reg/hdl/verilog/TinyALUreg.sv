// This file was autogenerated by PeakRDL-verilog
module TinyALUreg #(
    parameter                                ADDR_OFFSET = 0,  //! Module's offset in the main address map
    parameter                                ADDR_WIDTH  = 32,   //! Width of SW address bus
    parameter                                DATA_WIDTH  = 32    //! Width of SW data bus
)(
    // Clocks and resets
    input logic                              clk,     //! Default clock
    input logic                              resetn,  //! Default reset

    // Register SRC
    output logic                     [ 7: 0] SRC_data0_q,              //! Current field value
    output logic                     [ 7: 0] SRC_data1_q,              //! Current field value

    // Register RESULT
    input  logic                     [15: 0] RESULT_data_wdata,          //! HW write data

    // Register CMD
    output logic                     [ 4: 0] CMD_op_q,              //! Current field value
    output logic                     [ 0: 0] CMD_start_q,              //! Current field value
    input  logic                     [ 0: 0] CMD_done_wdata,          //! HW write data
    input  logic                             CMD_reserved_we,             //! Control HW write (active high)
    input  logic                     [ 8: 0] CMD_reserved_wdata,          //! HW write data

    // Register Bus
    input  logic                             valid,    //! Active high valid
    input  logic                             read,     //! Indicates request is a read
    input  logic            [ADDR_WIDTH-1:0] addr,     //! Address (byte aligned, absolute address)
    /* verilator lint_off UNUSED */
    input  logic            [DATA_WIDTH-1:0] wdata,    //! Write data
    input  logic          [DATA_WIDTH/8-1:0] wmask,    //! Write mask
    /* verilator lint_on UNUSED */
    output logic            [DATA_WIDTH-1:0] rdata     //! Read data
);

/* verilator lint_off UNUSED */
    // local output signals for fields (unless block outputs)
    // these can be used as references in other fields
    logic                           [ 7: 0] SRC_data0_next;
    logic                             SRC_data0_anded;
    logic                             SRC_data0_ored;
    logic                             SRC_data0_xored;
    logic                           [ 7: 0] SRC_data1_next;
    logic                             SRC_data1_anded;
    logic                             SRC_data1_ored;
    logic                             SRC_data1_xored;
    logic                           [15: 0] RESULT_data_q;
    logic                           [15: 0] RESULT_data_next;
    logic                             RESULT_data_anded;
    logic                             RESULT_data_ored;
    logic                             RESULT_data_xored;
    logic                           [ 4: 0] CMD_op_next;
    logic                             CMD_op_anded;
    logic                             CMD_op_ored;
    logic                             CMD_op_xored;
    logic                           [ 0: 0] CMD_start_next;
    logic                             CMD_start_anded;
    logic                             CMD_start_ored;
    logic                             CMD_start_xored;
    logic                           [ 0: 0] CMD_done_q;
    logic                           [ 0: 0] CMD_done_next;
    logic                             CMD_done_anded;
    logic                             CMD_done_ored;
    logic                             CMD_done_xored;
    logic                           [ 8: 0] CMD_reserved_q;
    logic                           [ 8: 0] CMD_reserved_next;
    logic                             CMD_reserved_anded;
    logic                             CMD_reserved_ored;
    logic                             CMD_reserved_xored;
/* verilator lint_on UNUSED */

    // ============================================================
    // SW Access logic
    // ============================================================
    logic sw_wr;
    logic sw_rd;
    /* verilator lint_off UNUSED */
    logic [DATA_WIDTH-1:0] sw_mask;
    logic [DATA_WIDTH-1:0] sw_wdata;
    logic [DATA_WIDTH-1:0] sw_rdata;
    logic [DATA_WIDTH-1:0] sw_masked_data;
    /* verilator lint_on UNUSED */

    // convert bus interface to internal sw_* signals
    assign sw_wr    = valid && !read;
    assign sw_rd    = valid &&  read;
    assign sw_wdata = wdata;
    assign rdata    = sw_rdata;

    // convert byte mask to bit mask
    always @(wmask) begin
        int byte_idx;
        for (byte_idx = 0; byte_idx < DATA_WIDTH/8; byte_idx+=1) begin
            sw_mask[8*(byte_idx+1)-1 -: 8] = {8{wmask[byte_idx]}};
        end
    end

    // helpful masked version of data
    assign sw_masked_data = sw_wdata & sw_mask;
    logic                     [DATA_WIDTH-1:0] SRC_rdata;
    logic                     [DATA_WIDTH-1:0] RESULT_rdata;
    logic                     [DATA_WIDTH-1:0] CMD_rdata;

    assign sw_rdata = // or of each register return (masked)
                   SRC_rdata | 
                   RESULT_rdata | 
                   CMD_rdata;
            
        
    // ============================================================
    // Register: SRC
    //    [ 7: 0]                data0: hw=r     sw=rw    reset=0x0
    //    [15: 8]                data1: hw=r     sw=rw    reset=0x0
    // ============================================================
    logic                  SRC_decode;
    logic                  SRC_sw_wr;
    logic                  SRC_sw_rd;
    logic [DATA_WIDTH-1:0] SRC_q;

    assign SRC_decode = (addr == (ADDR_OFFSET+'h0+'h0));
    assign SRC_sw_wr = sw_wr && SRC_decode;
    assign SRC_sw_rd = sw_rd && SRC_decode;

    always @(SRC_data0_q) begin
        SRC_q = '0;
        SRC_q[ 7: 0] = SRC_data0_q;
        SRC_q[15: 8] = SRC_data1_q;
    end

    // masked version of return data
    assign SRC_rdata = SRC_sw_rd ? SRC_q : 'b0;

    // ------------------------------------------------------------
    // Field: data0
    // ------------------------------------------------------------
    assign SRC_data0_anded = & SRC_data0_q;
    assign SRC_data0_ored  = | SRC_data0_q;
    assign SRC_data0_xored = ^ SRC_data0_q;

    // next hardware value

    //! main storage
    always_ff @ (posedge clk, negedge resetn)
    if (~resetn) begin
        SRC_data0_q <= 0;
    end else begin
        // Software write
        if (SRC_sw_wr) begin
            SRC_data0_q <=  sw_masked_data[ 7: 0] | (SRC_data0_q & ~sw_mask[ 7: 0]);
        end
    end

    // ------------------------------------------------------------
    // Field: data1
    // ------------------------------------------------------------
    assign SRC_data1_anded = & SRC_data1_q;
    assign SRC_data1_ored  = | SRC_data1_q;
    assign SRC_data1_xored = ^ SRC_data1_q;

    // next hardware value

    //! main storage
    always_ff @ (posedge clk, negedge resetn)
    if (~resetn) begin
        SRC_data1_q <= 0;
    end else begin
        // Software write
        if (SRC_sw_wr) begin
            SRC_data1_q <=  sw_masked_data[15: 8] | (SRC_data1_q & ~sw_mask[15: 8]);
        end
    end
            
        
    // ============================================================
    // Register: RESULT
    //    [15: 0]                 data: hw=w     sw=r     reset=0x0
    // ============================================================
    logic                  RESULT_decode;
    logic                  RESULT_sw_wr;
    logic                  RESULT_sw_rd;
    logic [DATA_WIDTH-1:0] RESULT_q;

    assign RESULT_decode = (addr == (ADDR_OFFSET+'h0+'h2));
    assign RESULT_sw_wr = sw_wr && RESULT_decode;
    assign RESULT_sw_rd = sw_rd && RESULT_decode;

    always @(RESULT_data_q) begin
        RESULT_q = '0;
        RESULT_q[15: 0] = RESULT_data_q;
    end

    // masked version of return data
    assign RESULT_rdata = RESULT_sw_rd ? RESULT_q : 'b0;

    // ------------------------------------------------------------
    // Field: data (wire)
    // ------------------------------------------------------------
    assign RESULT_data_anded = & RESULT_data_q;
    assign RESULT_data_ored  = | RESULT_data_q;
    assign RESULT_data_xored = ^ RESULT_data_q;

    // next hardware value
    assign RESULT_data_next = RESULT_data_wdata;
    assign RESULT_data_q = RESULT_data_next;
            
        
    // ============================================================
    // Register: CMD
    //    [ 4: 0]                   op: hw=r     sw=rw    reset=0x0
    //    [ 5: 5]                start: hw=r     sw=rw    reset=0x0
    //    [ 6: 6]                 done: hw=w     sw=r     reset=0x0
    //    [15: 7]             reserved: hw=w     sw=rw    reset=0x0
    // ============================================================
    logic                  CMD_decode;
    logic                  CMD_sw_wr;
    logic                  CMD_sw_rd;
    logic [DATA_WIDTH-1:0] CMD_q;

    assign CMD_decode = (addr == (ADDR_OFFSET+'h0+'h4));
    assign CMD_sw_wr = sw_wr && CMD_decode;
    assign CMD_sw_rd = sw_rd && CMD_decode;

    always @(CMD_op_q or CMD_start_q or CMD_done_q or CMD_reserved_q) begin
        CMD_q = '0;
        CMD_q[ 4: 0] = CMD_op_q;
        CMD_q[ 5: 5] = CMD_start_q;
        CMD_q[ 6: 6] = CMD_done_q;
        CMD_q[15: 7] = CMD_reserved_q;
    end

    // masked version of return data
    assign CMD_rdata = CMD_sw_rd ? CMD_q : 'b0;

    // ------------------------------------------------------------
    // Field: op
    // ------------------------------------------------------------
    assign CMD_op_anded = & CMD_op_q;
    assign CMD_op_ored  = | CMD_op_q;
    assign CMD_op_xored = ^ CMD_op_q;

    // next hardware value

    //! main storage
    always_ff @ (posedge clk, negedge resetn)
    if (~resetn) begin
        CMD_op_q <= 0;
    end else begin
        // Software write
        if (CMD_sw_wr) begin
            CMD_op_q <=  sw_masked_data[ 4: 0] | (CMD_op_q & ~sw_mask[ 4: 0]);
        end
    end

    // ------------------------------------------------------------
    // Field: start
    // ------------------------------------------------------------
    assign CMD_start_anded = & CMD_start_q;
    assign CMD_start_ored  = | CMD_start_q;
    assign CMD_start_xored = ^ CMD_start_q;

    // next hardware value

    //! main storage
    always_ff @ (posedge clk, negedge resetn)
    if (~resetn) begin
        CMD_start_q <= 0;
    end else begin
        // Software write
        if (CMD_sw_wr) begin
            CMD_start_q <=  sw_masked_data[ 5: 5] | (CMD_start_q & ~sw_mask[ 5: 5]);
        end
    end

    // ------------------------------------------------------------
    // Field: done (wire)
    // ------------------------------------------------------------
    assign CMD_done_anded = & CMD_done_q;
    assign CMD_done_ored  = | CMD_done_q;
    assign CMD_done_xored = ^ CMD_done_q;

    // next hardware value
    assign CMD_done_next = CMD_done_wdata;
    assign CMD_done_q = CMD_done_next;

    // ------------------------------------------------------------
    // Field: reserved
    // ------------------------------------------------------------
    assign CMD_reserved_anded = & CMD_reserved_q;
    assign CMD_reserved_ored  = | CMD_reserved_q;
    assign CMD_reserved_xored = ^ CMD_reserved_q;

    // next hardware value
    assign CMD_reserved_next = CMD_reserved_wdata;

    //! main storage
    always_ff @ (posedge clk, negedge resetn)
    if (~resetn) begin
        CMD_reserved_q <= 0;
    end else begin
        // Hardware Write
        if (CMD_reserved_we) begin
            CMD_reserved_q <= CMD_reserved_next;
        end
        // Software write
        if (CMD_sw_wr) begin
            CMD_reserved_q <=  sw_masked_data[15: 7] | (CMD_reserved_q & ~sw_mask[15: 7]);
        end
    end

endmodule: TinyALUreg
