// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Mapping {
    mapping(address => uint) public balances;                      //  a balance of each address   
    mapping(address => mapping(address => bool)) public isFriend;  //     

    function example() external{
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];   //=0

        balances[msg.sender] += 465;

        delete balances[msg.sender];  //=0

        isFriend[msg.sender][address(this)] = true;
    }



}