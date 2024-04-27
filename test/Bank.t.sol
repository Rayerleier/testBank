// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank bank;
    address alice = makeAddr("alice");
    function setUp() public {
        bank = new Bank();
    }

    function test_depositETH () public{
        uint256 depositAmount = 20 ether;
        vm.deal(alice, depositAmount);
        vm.prank(alice);
        bank.depositETH{value: depositAmount}(alice, depositAmount);
        assertEq(bank.balanceOf(alice), depositAmount);
    }

}
