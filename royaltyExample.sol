pragma solidity ^0.8.0;

contract royaltyExample {

	// this represents a 20% royalty
	uint8 royalty = 20;
	address payable owner;

	// the person who deploys the contract is the owner
	constructor() {
		owner = payable(msg.sender);
	}

	// allows someone to pay another, but the royalty is taken out and held within the smart contract balance
	function sendMoneySomewhere(address payable _to) public payable {
		uint256 amount = (msg.value * royalty) / 100;
		_to.transfer(amount);
	}

	// withdraw entire contract balance, only the owner can use this
	function withdrawAll() public {
		require(msg.sender == owner);
		payable(msg.sender).transfer(address(this).balance);
	}

	// withdraw a specified amount of the contract balance, only the owner can use this
	function withdrawAmount(uint256 _amount) public {
		require(msg.sender == owner);
		payable(msg.sender).transfer(_amount);
	}

}
