pragma solidity ^0.4.24;

import 'github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol';

/* OWN THIS CONTRACT */

contract Fallback is Ownable {

  mapping(address => uint) public contributions;

  function Fallback() public {
    contributions[msg.sender] = 1000 * (1 ether);
  }

  //first contribute something
  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  function withdraw() public onlyOwner {
    owner.transfer(this.balance);
  }

  //then send something of any value to the contract and you'll become the owner
  function() payable public { 
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}