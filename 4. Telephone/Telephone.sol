pragma solidity ^0.4.18;


/* OWN THIS CONTRACT */
contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  //direct call to this from your external account won't work 
  // we need a contract to call this func
  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {   
      owner = _owner;
    }
  }
}