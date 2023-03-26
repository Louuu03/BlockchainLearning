// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract LocalVariables{
    uint public number;
    bool public boolean;
    address public myAddress;
    
    function foo() external  {
        uint localX = 123;
        bool localY = false;

        localX +=456;
        localY = true;

        number = 123;
        boolean = true;
        myAddress = address(1);
    }
} 