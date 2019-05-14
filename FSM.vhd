-- Done by Khalil_Baydoun and Nourhane_AbdelSamad 

library ieee;
use ieee.std_logic_1164.all;

entity FSM is 
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
end FSM ; 

architecture myarch of FSM is 
type state is (S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21) ;
signal CS, NS : state ;


begin

SEQUENTIAL:process(clk)
begin 

if clk'event AND clk='1' then 
CS<=NS;
end if; 
end process SEQUENTIAL;
 

comb_logic : process (CS, money, ready,clear)
begin
if(clear='1')then
 NS<=s1;
returned<=0;
succeeded<='0';
object_sold<=1;

else
case CS is

when S1 =>

if(ready='1') 
then
succeeded <= '0' ;
returned <= 0 ;
object_sold <=0;

end if ;

if (money = 250) then NS <= S2 ;
elsif (money = 500) then NS <= S3 ;
elsif (money = 1000) then NS <= S5 ;
elsif (money = 5000) then NS <= S21 ;
else NS <= S1;
end if ;



when S2 =>
if(ready='1') then
succeeded <= '0' ;
returned <= 0 ;
object_sold <=0;

end if ;

if (money = 250) then NS <= S3 ;
elsif (money = 500) then NS <= S4 ;
elsif (money = 1000) then NS <= S6 ;
else NS <= S2 ;
end if ;



when S3 =>
if(ready='1') then

if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
succeeded <= '1';
returned <= 0;
object_sold <= selected ;
NS <= S1;

else
succeeded <= '0' ;
returned <= money ;
object_sold <=0;
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S4 ;
elsif (money = 500) then NS <= S5 ;
elsif (money = 1000) then NS <= S7 ;
else NS <= S3 ;
end if ;




when S4 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then NS <= S2 ; 
end if ;
end if ;
else
succeeded <= '0' ;
returned <= money ;
object_sold <=0;
NS <= S1;
end if ;

end if ;


if (money = 250) then NS <= S5 ;
elsif (money = 500) then NS <= S6 ;
elsif (money = 1000) then NS <= S8 ;
else NS <= S4 ;
end if ;
------------------------------------------------------------------------------------------------------------------------------------------------
when S5 =>

if(ready='1') then


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 500;
object_sold <= selected ;
else
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then NS <= S3 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then succeeded <= '1';
object_sold <= selected ;
NS <= S1 ;
else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if ;

if (money = 250) then NS <= S6 ;
elsif (money = 500) then NS <= S7 ;
elsif (money = 1000) then NS <= S9 ;
else NS <= S5 ;
end if ;

when S6 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
if(available = '1') then
succeeded <= '1';
returned <= 750;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then
if(available = '1') then 
succeeded <= '1';
returned <= 250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S2 ; 
end if ;
end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if ;

if (money = 250) then NS <= S7 ;
elsif (money = 500) then NS <= S8 ;
elsif (money = 1000) then NS <= S10 ;
else NS <= S6 ;
end if ;
-------------------------------------------------------------------------------------------------------------------------
when S7 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then 
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then
if(available = '1') then
succeeded <= '1';
returned <= 500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S3 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then succeeded <= '1';
returned <= 0;
object_sold <= selected ; 

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if; 

if (money = 250) then NS <= S8 ;
elsif (money = 500) then NS <= S9 ;
elsif (money = 1000) then NS <= S11 ;
else NS <= S7 ;
end if ;



------------------------------------------------------------------------------------------------


when S8 =>


if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
if(available = '1') then
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then
succeeded <= '1';
returned <= 250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S2 ; 
end if ;
end if ; 

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if ;
if (money = 250) then NS <= S9 ;
elsif (money = 500) then NS <= S10 ;
elsif (money = 1000) then NS <= S12 ;
else NS <= S8 ;
end if ;


-----------------------------------------------------------------------------------------------------------------------------------
when S9 =>



if(ready='1') then


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 1500;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S3 ; 
end if ;
end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then
succeeded <= '1';
returned <= 0;
object_sold <= selected ;
else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S10 ;
elsif (money = 500) then NS <= S11 ;
elsif (money = 1000) then NS <= S13 ;
else NS <= S9 ;
end if ;
-----------------------------------------------------------------------------------------------------------------------------------
when S10 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then 
succeeded <= '1';
returned <= 1750;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S8 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then
succeeded <= '1';
returned <= 750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")then   succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then
succeeded <= '1';
returned <= 250;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S2 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S11 ;
elsif (money = 500) then NS <= S12 ;
elsif (money = 1000) then NS <= S14 ;
else NS <= S10 ;
end if ;

-------------------------------------------------------------------------------------------------------------------------------------
when S11 =>

if(ready='1') then


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1')then
succeeded <= '1';
returned <= 2000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S9 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1')
then succeeded <= '1';
returned <= 1500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then 
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then
succeeded <= '1';
returned <= 500;
object_sold <= selected ;

else 
if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S3 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S12 ;
elsif (money = 500) then NS <= S13 ;
elsif (money = 1000) then NS <= S15 ;
else NS <= S11 ;
end if ;

------------------------------------------------------------------------------------------------------------------------------
when S12 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then 
succeeded <= '1';
returned <= 2250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")then   succeeded <= '1' ; object_sold <=selected ; NS <=  S10 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1')then
succeeded <= '1';
returned <= 1750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S8 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01")then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then
succeeded <= '1';
returned <= 750;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S13 ;
elsif (money = 500) then NS <= S14 ;
elsif (money = 1000) then NS <= S16 ;
else NS <= S12 ;
end if ;
------------------------------------------------------------------------------------------------------------------------------
when S13 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then 
succeeded <= '1';
returned <= 2500;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S11 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then 
succeeded <= '1';
returned <= 2000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S9 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then
succeeded <= '1';
returned <= 1500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then 
succeeded <= '1';
returned <= 0;
object_sold <= selected ;
else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S14 ;
elsif (money = 500) then NS <= S15 ;
elsif (money = 1000) then NS <= S17 ;
else NS <= S13 ;
end if ;

---------------------------------------------------------------------------------------------------------------------------
when S14 =>


if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 2750;
object_sold <= selected ;
else 
if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S12 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1')
then succeeded <= '1';
returned <= 2250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S10 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1')then 
succeeded <= '1';
returned <= 1750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S8 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then 
if(available = '1') then
succeeded <= '1';
returned <= 250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S2 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S15 ;
elsif (money = 500) then NS <= S16 ;
elsif (money = 1000) then NS <= S18 ;
else NS <= S14 ;
end if ;
----------------------------------------------------------------------------------------------------------------------------

when S15 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 3000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S13 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then 
succeeded <= '1';
returned <= 2500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S11 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 2000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")then   succeeded <= '1' ; object_sold <=selected ; NS <=  S9 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 1500;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 )
then if(available = '1') then 
succeeded <= '1';
returned <= 500;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S3 ; 
end if ;
        end if ;

elsif(selected = 510)
then
succeeded <= '1';
returned <= 0;
object_sold <= selected ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S16 ;
elsif (money = 500) then NS <= S17 ;
elsif (money = 1000) then NS <= S19 ;
else NS <= S15 ;
end if ;
----------------------------------------------------------------------------------------------------------------------------
when S16 =>



if(ready='1') then


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then 
succeeded <= '1';
returned <= 3250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S14 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then 
succeeded <= '1';
returned <= 2750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S12 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 2250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S10 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 1750;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S8 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 )
then if(available = '1')then 
succeeded <= '1';
returned <= 750;
object_sold <= selected ;
else 
if(decision = "11")then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
        end if ;

elsif(selected = 510) then 

if(available = '1') then
succeeded <= '1';
returned <= 250;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S2 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S17 ;
elsif (money = 500) then NS <= S18 ;
elsif (money = 1000) then NS <= S20 ;
else NS <= S16 ;
end if ;
---------------------------------------------------------------------------------------------------------------------------
when S17 =>

if(ready='1') then


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 3500;
object_sold <= selected ;
else
if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S15 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1')then
succeeded <= '1';
returned <= 3000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S13 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 2500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S11 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 2000;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S9 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then 
if(available = '1') then 
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01")  then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
        end if ;

elsif(selected = 510) then 
if(available = '1') then 
succeeded <= '1';
returned <= 500;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S3 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if ;
if (money = 250) then NS <= S18 ;
elsif (money = 500) then NS <= S19 ;
elsif (money = 1000) then NS <= S21 ;
else NS <= S17 ;
end if ;

---------------------------------------------------------------------------------------------------------------------------
when S18 =>

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 3750;
object_sold <= selected ;
else 
if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S16 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then 
succeeded <= '1';
returned <= 3250;
object_sold <= selected ;
else 

if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S14 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then 
if(available = '1') then 
succeeded <= '1';
returned <= 2750;
object_sold <= selected ;
else 

if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S12 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then 
succeeded <= '1';
returned <= 2250;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S10 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 )
then if(available = '1') then
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
        end if ;

elsif(selected = 510) then
if(available = '1') then 
succeeded <= '1';
returned <= 750;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S4 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S19 ;
elsif (money = 500) then NS <= S20 ;
else NS <= S18 ;
end if ;
----------------------------------------------------------------------------------------------------------------------------
when S19 =>
if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 4000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S17 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 3500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S15 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then 
succeeded <= '1';
returned <= 3000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S13 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1') then
succeeded <= '1';
returned <= 2500;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S11 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then
if(available = '1') then
succeeded <= '1';
returned <= 1500;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
        end if ;

elsif(selected = 510) then
if(available = '1') then 
succeeded <= '1';
returned <= 1000;
object_sold <= selected ;

else 
if(decision = "11") then  returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S5 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ; end if;

if (money = 250) then NS <= S20 ;
elsif (money = 500) then NS <= S21 ;
else NS <= S19 ;
end if ;
-------------------------------------------------------------------------------------------------------------------------------------
when S20 =>

if(ready='1')
then

if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 4250;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then   succeeded <= '1' ; object_sold <=selected ; NS <=  S18 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 3750;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S16 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then
succeeded <= '1';
returned <= 3250;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then  returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S14 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  )
then if(available = '1')then 
succeeded <= '1';
returned <= 2750;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S12 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then
if(available = '1') then
succeeded <= '1';
returned <= 1750;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01")then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S8 ; 
end if ;
        end if ;

elsif(selected = 510) then 
if(available = '1') then
succeeded <= '1';
returned <= 1250;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S6 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;
end if ;

if (money = 250) then NS <= S21 ;
else NS <= S20 ;
end if ;
-------------------------------------------------------------------------------------------------------
 when S21 => 

if(ready='1') then 


if (selected = 202 or selected = 203 or selected = 205 or selected = 206 or selected = 301 or selected = 408 or selected = 411 or selected = 412 or selected = 203)
then
if(available = '1') then
succeeded <= '1';
returned <= 4500;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S19 ; 
end if ;
end if ;
elsif(selected = 101 or selected = 102 or selected = 103 or selected = 201 or selected = 302 or selected = 306  or selected = 407 or selected = 409 or selected = 410 or selected = 601 or selected = 602 or selected = 603 or selected = 604 or selected = 605 or selected = 606 or selected = 607 or selected = 608 or selected = 609 or selected = 610)
then if(available = '1') then
succeeded <= '1';
returned <= 4000;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S17 ; 
end if ;
end if ;
elsif(selected = 104 or selected = 105 or selected = 106 or selected = 204 or selected = 304 or selected = 305  or selected = 401 or selected = 402 or selected = 403 or selected = 404 or selected = 501 or selected = 502 or selected = 503 or selected = 504)
then
if(available = '1') then
succeeded <= '1';
returned <= 3500;
object_sold <= selected ;
else 

if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then succeeded <= '1' ; object_sold <=selected ; NS <=  S15 ; 
end if ;
        end if ;

elsif(selected = 303 or selected = 405 or selected = 406 or selected = 505 or selected = 506 or selected = 507  ) then
if(available = '1') then
succeeded <= '1';
returned <= 3000;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S13 ; 
end if ;
        end if ;

elsif(selected = 508 or selected = 509 ) then
if(available = '1') then
succeeded <= '1';
returned <= 2000;
object_sold <= selected ;
else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10") then  succeeded <= '1' ; object_sold <=selected ; NS <=  S9 ; 
end if ;
        end if ;

elsif(selected = 510) then
if(available = '1') then
succeeded <= '1';
returned <= 1500;
object_sold <= selected ;

else 
if(decision = "11") then returned <= money ; succeeded <= '0' ; object_sold <=0;  NS <= S1 ; 
elsif(decision = "01") then returned <= 0 ; succeeded <= '1' ; object_sold <=selected ; NS <= S1 ;
elsif(decision = "10")  then succeeded <= '1' ; object_sold <=selected ; NS <=  S7 ; 
end if ;
        end if ;

else
succeeded <= '0' ;
returned <= money ;
object_sold <= 0; 
NS <= S1;
end if ;

end if ;
---------------------------------------------------------------------------------------------------------------


end case ;
end if;
end process comb_logic  ;

end myarch ;
