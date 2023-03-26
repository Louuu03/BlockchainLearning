// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract StateVariables {
    uint public StateVariable = 123;

    function foo() external{
        uint notStateVariable= 321;
    } 
}