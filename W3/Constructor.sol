// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Constructor {  
    address public owner;
    uint public x;
    
    constructor(uint _x){   // initialize state variables
        owner = msg.sender;
        x = _x;
    }
}  
