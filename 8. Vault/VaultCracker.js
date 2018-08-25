import Web3 from 'web3';

let contractAddress = /* CONTRACT ADDRESS */;

let password;

password = web3.eth.getStorageAt(contractAddress, index);

//FOR METAMASK ERRORS ::

web3.eth.getStorageAt(contractAddress, 1, (error, result) => {
	password = result;
});

//password will be in hex ==> convert to ASCII