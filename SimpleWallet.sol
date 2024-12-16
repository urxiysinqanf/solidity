// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;

    // Event to log deposits
    event Deposit(address indexed sender, uint amount);

    // Event to log withdrawals
    event Withdrawal(address indexed receiver, uint amount);

    constructor() {
        // Set the contract deployer as the owner
        owner = msg.sender;
    }

    // Modifier to restrict certain functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    // Function to deposit funds into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0!");
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw funds from the contract
    function withdraw(uint _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient funds!");
        payable(owner).transfer(_amount);
        emit Withdrawal(owner, _amount);
    }

    // Function to check the contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
