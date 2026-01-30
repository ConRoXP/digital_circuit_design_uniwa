library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPS is port(
  clock: in std_logic;
  reset: in std_logic);
end MIPS;

architecture behavioral of MIPS is
  component ALU port(
    ALUin1: in std_logic_vector(31 downto 0);
    ALUin2: in std_logic_vector(31 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUresult: out std_logic_vector(31 downto 0);
    zero: out std_logic);
  end component;
  
  component Registerfile port(
    clk: in std_logic;
    reset: in std_logic;
    read_reg1: in std_logic_vector(4 downto 0);
    read_reg2: in std_logic_vector(4 downto 0);
    write_reg: in std_logic_vector(4 downto 0);
    write_data: in std_logic_vector(31 downto 0);
    write_enable: in std_logic;
    read_data1: out std_logic_vector(31 downto 0);
    read_data2: out std_logic_vector(31 downto 0));
  end component;
  
  component Datamem port(
    clk: in std_logic;
    mem_write: in std_logic;
    mem_read: in std_logic;
    address: in std_logic_vector(31 downto 0);
    write_data: in std_logic_vector(31 downto 0);
    read_data: out std_logic_vector(31 downto 0));
  end component;
  
  component Imem port(
    address: in std_logic_vector(31 downto 0);
    instruction: out std_logic_vector(31 downto 0));
  end component;
  
  component Control port(
    opcode: in std_logic_vector(5 downto 0);
    regdst: out std_logic;
    ALUsrc: out std_logic;
    memtoreg: out std_logic;
    regwrite: out std_logic;
    memread: out std_logic;
    memwrite: out std_logic;
    branch: out std_logic;
    ALUop: out std_logic_vector(1 downto 0));
  end component;
  
  component ALUcontrol port(
    funct: in std_logic_vector(5 downto 0);
    ALUop: in std_logic_vector(1 downto 0);
    ALUcontrol: out std_logic_vector(3 downto 0));
  end component;
  
  component PC port(
    clk: in std_logic;
    reset: in std_logic;
    pc_in: in std_logic_vector(31 downto 0);
    pc_out: out std_logic_vector(31 downto 0));
  end component;
  
  component Mux5_2to1 port(
    in0: in std_logic_vector(4 downto 0);
    in1: in std_logic_vector(4 downto 0);
    set: in std_logic;
    output: out std_logic_vector(4 downto 0));
  end component;
  
  component Signextension port(
    in16: in std_logic_vector(15 downto 0);
    out32: out std_logic_vector(31 downto 0));
  end component;
  
  component Mux32_2to1 port(
    in0: in std_logic_vector(31 downto 0);
    in1: in std_logic_vector(31 downto 0);
    set: in std_logic;
    output: out std_logic_vector(31 downto 0));
  end component;
  
  --Leftshift component ommited
  
  --Adder32 added directly as entity

  --Control
  signal RegDst: std_logic;
  signal Branch: std_logic;
  signal MemRead: std_logic;
  signal MemToReg: std_logic;
  signal ALUOp: std_logic_vector(1 downto 0);
  signal MemWrite: std_logic;
  signal ALUSrc: std_logic;
  signal RegWrite: std_logic;
  --PC
  signal PCOut: std_logic_vector(31 downto 0);
  --ALU
  signal Zero: std_logic;
  signal ALUout: std_logic_vector(31 downto 0);
  --Register File
  signal RegOut1: std_logic_vector(31 downto 0);
  signal RegOut2: std_logic_vector(31 downto 0);
  --MUX
  signal MUXtoReg: std_logic_vector(4 downto 0);
  signal MUXtoALU: std_logic_vector(31 downto 0);
  signal MUXtoPC: std_logic_vector(31 downto 0);
  signal MUXtoRegWrite: std_logic_vector(31 downto 0);
  signal Branch_isTrue: std_logic;
  --ALU Control
  signal ALUctrl_out: std_logic_vector(3 downto 0);
  --Sign Extend
  signal SignExOut: std_logic_vector(31 downto 0);
  --Data Mem
  signal DataMemOut: std_logic_vector(31 downto 0);
  --Instruction Mem
  signal IMOut: std_logic_vector(31 downto 0);
  --Adder32
  signal ONE: std_logic_vector(31 downto 0);
  signal AddressNoBranch: std_logic_vector(31 downto 0);
  signal AddressBranch: std_logic_vector(31 downto 0);
  
  begin
    ONE <= std_logic_vector(to_unsigned(1,32));
    FA_PC: entity work.Adder32 port map(
      in0 => PCOut,
      in1 => ONE,
      result => AddressNoBranch);
      
    FA_Branch: entity work.Adder32 port map(
      in0 => AddressNoBranch,
      in1 => SignExOut,
      result => AddressBranch);
      
    Prog_Counter: PC port map(
      pc_in => MUXtoPC,
      pc_out => PCOut,
      clk => clock,
      reset => reset);
      
    Instr_Mem: Imem port map(
      address => PCout,
      instruction => IMOut);
        
    RegFile: Registerfile port map(
      read_reg1 => IMOut(25 downto 21),
      read_reg2 => IMOut(20 downto 16),
      write_reg => MUXtoReg,
      write_data => MUXtoRegWrite,
      write_enable => RegWrite,
      read_data1 => RegOut1,
      read_data2 => RegOut2,
      clk => clock,
      reset => reset);
        
    Ctrl: Control port map(
      opcode => IMOut(31 downto 26),
      regdst => RegDst,
      ALUsrc => ALUSrc,
      memtoreg => MemToReg,
      regwrite => RegWrite,
      memread => MemRead,
      memwrite => MemWrite,
      branch => Branch,
      ALUop => ALUOp);

    ALUctrl: ALUcontrol port map(
      funct => IMOut(5 downto 0),
      ALUop => ALUOp,
      ALUcontrol => ALUctrl_out);
        
    ALU1: ALU port map(
      ALUin1 => RegOut1,
      ALUin2 => MUXtoALU,
      ALUctrl => ALUctrl_out,
      ALUresult => ALUout,
      zero => Zero);
          
    Data_Mem: Datamem port map(
      mem_write => MemWrite,
      mem_read => MemRead,
      address => ALUout,
      write_data => RegOut2,
      read_data => DataMemOut,
      clk => clock);
          
    MUXreg: Mux5_2to1 port map(
      in0 => IMOut(20 downto 16),
      in1 => IMout(15 downto 11),
      set => RegDst,
      output => MUXtoReg);
          
    MUXalu_in: Mux32_2to1 port map(
      in0 => RegOut2,
      in1 => SignExOut,
      set => ALUSrc,
      output => MUXtoALU);
          
    MUXdatamem: Mux32_2to1 port map(
      in1 => DataMemOut,
      in0 => ALUout,
      set => MemToReg,
      output => MUXtoRegWrite);
          
    Branch_isTrue <= Branch AND (not Zero);
    MUXaddress: Mux32_2to1 port map(
      in0 => AddressNoBranch,
      in1 => AddressBranch,
      set => Branch_isTrue,
      output => MUXtoPC);
          
    Sign_Ext: Signextension port map(
      in16 => IMOut(15 downto 0),
      out32 => SignExOut);
      
  end behavioral;
