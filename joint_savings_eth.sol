pragma solidity ^0.5.0;

contract JointSavings {

    address payable accountOne; 
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastToWithdrawAmount;
    uint public contractBalance;

    /*
    Create function to withdraw funds checking if recipient is one of the two accounts and 
    the contract has sufficient balance. Change lastToWithdraw if new recipient and lastToWithdrawAmount.
    Transfer and update contractBalance.
    */
    function withdraw(uint amount, address payable recipient) public {

        require(recipient == accountOne || recipient == accountTwo, "You do not own this account!");
        require(contractBalance >= amount, "Insufficient Funds!");
        if (lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }
        recipient.transfer(amount);
        lastToWithdrawAmount = amount;
        contractBalance = address(this).balance;
    }


    /*
    Create function to deposit to contract and update balance.
    */
    function deposit() public payable {

        contractBalance = address(this).balance;
    }

    /*
    Create function to set the accounts
    */
    function setAccounts(address payable account1, address payable account2) public{

        accountOne = account1;
        accountTwo = account2;
    }

    //Fallback function
    function () external payable {

    }
}