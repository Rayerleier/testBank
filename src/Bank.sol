// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract Bank{


    mapping(address => uint) public balanceOf;

    event Deposit(address indexed user, uint amount);

    function depositETH(address user, uint256 amount) external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balanceOf[user] += amount;
        emit Deposit(user, amount);
    }
}