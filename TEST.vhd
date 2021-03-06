library ieee;
use ieee.std_logic_1164.all;
entity vend_test is 
end vend_test;


architecture vend_test_arch of vend_test is 

component  FSM is 
port 
(clk : in std_logic ;
clear: in std_logic;
money : in integer  ; 
available : in std_logic ;
selected : in integer ;
decision : in std_logic_vector(1 downto 0) ;
ready: in std_logic ;


succeeded : out std_logic;
returned : out integer ;
object_sold : out integer );
end component;

signal clkT : std_logic ;
signal moneyT :  integer  ;
signal clearT : std_logic; 
signal availableT :  std_logic ;
signal selectedT :  integer ;
signal decisionT :  std_logic_vector(1 downto 0) ;
signal readyT:  std_logic ;


signal succeededT :  std_logic;
signal returnedT :integer ;
signal object_soldT :  integer ;
 
begin 
u1: FSM port map(clk=>clkT,clear=>clearT,money=>moneyT,available=>availableT,selected=>selectedT,decision=>decisionT,ready =>readyT,succeeded=>succeededT,
returned=>returnedT,object_sold=>object_soldT);
   process
 begin
-- please make the run time up to 600 ns to see the full results
clkT<='0';
readyT<='0';
moneyT<=1000;--entering 1000 money
selectedT<=203;
decisionT <="01";
availableT<='1';
wait for 10 ns;
clkT<='1';

wait for 10 ns;
clkT<='0';
moneyT <=1000;--entering another 1000 now there is 2000 in the machine
wait for  10 ns;
clkT<='1';
moneyT<=0;
wait for 10 ns;
clkT<='0';
readyT<='1';--buy a 500L.L item
wait for  10 ns;
clkT<='1';
readyT<='0';
WAIT for 10 ns;
clkT<='0';
clearT<='1';--clearing everything

wait for 10 ns;
clkT<='1';
clearT<='0';
wait for 10 ns;
clkT<='0';
readyT<='0';
moneyT<=5000;--entering 5000 money
selectedT<=508;--item costs 3000L.L
decisionT <="01";
availableT<='1';
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
readyT<='1';--buy a 3000L.L item and getting back 2000L.L
wait for  10 ns;
clkT<='1';
readyT<='0';
WAIT for 10 ns;
clkT<='0';
clearT<='1';--clearing everything
wait for 10 ns;
clkT<='1';
clearT<='0';
wait for 10 ns;
clkT<='0';
readyT<='0';
moneyT<=500;--entering 500 money
selectedT<=508;--item costs 3000L.L
decisionT <="01";
availableT<='1';
WAIT for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
moneyT<=1000;--entering 1000 so we have 1500 now
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
moneyT<=500;--entering 500 so we have 2000
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
moneyT<=1000;---entering 1000 so we have 3000 now thus we can buy the item
wait for 10 ns;
clkT<='1';
moneyT<=0;
wait for 10 ns;
clkT<='0';
readyT<='1';--we buy the item and get 0 L.L back;
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
clearT<='1';--clearing everything
wait for 10 ns;
clkT<='1';
clearT<='0';
wait for 10 ns;
clkT<='0';
readyT<='0';
moneyT<=1000;--entering 1000 money
selectedT<=106;--1500L.L item
decisionT <="01";
availableT<='0';-- available 0 means machine has no money to return so we buy two 1500 items  from the 3000 we are going to enter
wait for 10 ns;
clkT<='1';

wait for 10 ns;
clkT<='0';
moneyT <=1000;--entering another 1000 now there is 2000 in the machine
wait for  10 ns;
clkT<='1';
moneyT<=1000;--entering another 1000 there is now 3000 in the machine
wait for 10 ns;
clkT<='0';
moneyT<=0;
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
readyT<='1';--buy a 1500L.L item amd get succeeded =1;
wait for  10 ns;
clkT<='1';
readyT<='0';
selectedT<=305;--another 1500 item
WAIT for 10 ns;
clkT<='0';
readyT<='1';--buy a 1500L.L item and get succeded =1
wait for 10 ns;
clkT<='0';
readyT<='0';
wait for 10 ns;
clkT<='1';
wait for 10 ns;
clkT<='0';
clearT<='1';--clearing everything
wait for 10 ns;
clkT<='1';
clearT<='0';
wait for 10 ns;
clkT<='0';
readyT<='0';
moneyT<=1000;--entering 1000 money
selectedT<=509;
decisionT <="01";
availableT<='1';
wait for 10 ns;
clkT<='1';

wait for 10 ns;
clkT<='0';
moneyT <=1000;--entering another 1000 now there is 2000 in the machine
wait for  10 ns;
clkT<='1';
moneyT<=0;
wait for 10 ns;
clkT<='0';
readyT<='1';--attempt to buy a 3000L.L item but not succeding and getiing back our money
wait for  10 ns;
clkT<='1';
readyT<='0';
WAIT for 10 ns;
clkT<='0';
clearT<='1';--clearing everything

wait for 10 ns;
clkT<='1';
clearT<='0';
wait for 10 ns;


wait;
end process;

end vend_test_arch ;
