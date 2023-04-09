// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Immutable {
    address public immutable owner = msg.sender;
    uint public x;

    // gas spent constant <= immutable <= local variable (memory) <= state variables (storage)

    constructor(){
        owner = msg.sender;
    }

    function foo() external{
        require(msg.sender == owner);
        x +=1 ;
    }

}