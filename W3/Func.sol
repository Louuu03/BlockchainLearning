// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract FunctionIntro {
    function add(uint x, uint y) external pure returns (uint){  //pure: reaad only, doesn't write anything in the blockchain
        return x + y;
    }
    function sub(uint x, uint y) external pure returns (uint){  
        return x - y;
    }
}
