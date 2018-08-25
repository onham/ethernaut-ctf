pragma solidity ^0.4.18;

/* YOU ARE GIVEN 20 TOKENS TO START WITH -- GET MORE THAN THAT TO WIN */ 

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  function Token(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0); 
    //the thing here is it'll always be greater than 0 -- since the two values are UNSIGNED integers    
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance){
    return balances[_owner];
  }
}






/*

both variables in require in this instance are uints and will always return a positive value -- to exploit this, all we need to do is make an external call to transfer

this is known as overflow -- 
we can check for it with if statements::
if (a+c>a) {
  a = a+c;
}

we can prevent overflow by using OZ's SafeMath library::
a = a.add(c)

*/