library ieee;
use ieee.std_logic_1164.all;

entity dualportram is
port( clk : in std_logic;
da  : in std_logic_vector(7 downto 0);
db  : in std_logic_vector(7 downto 0);
addra : in natural range 1027 downto 0;
addrb : in natural range 1027 downto 0;
rea : in std_logic;
reb : in std_logic;
wra : in std_logic;
wrb : in std_logic;
dao : out std_logic_vector(7 downto 0);
dbo : out std_logic_vector(7 downto 0));
end entity;

architecture behav of dualportram is

-- creating a memory array
subtype regis is std_logic_vector(7 downto 0);
type memory is array(1027 downto 0) of regis;

signal ram : memory;
signal addregisa : natural range 1027 downto 0;
signal addregisb : natural range 1027 downto 0;

begin
process(clk)
begin
-- Reading and Writing for port a
if(rising_edge(clk)) then
if(wra = '1') then
ram(addra) <= da;
end if;

addregisa <= addra;
end if;

if(rea = '1') then
dao <= ram(addregisa);
end if;

-- Reading and Writing for port b
if(rising_edge(clk)) then
if(wrb = '1') then
ram(addrb) <= db;
end if;

addregisb <=  addrb;
end if;

if(reb = '1') then
dbo <= ram(addregisb);
end if;

end process;
end behav;
