// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract ViewAndPureFunc{
    uint public num;

    function viewFunc() external view returns (uint) {
        return num;
    }
    function pureFunc() external view returns (uint) {  //  doesn't read data from a contract or blockchain
        return 1;
    }

    function addToNum(uint _x) external view returns (uint) {
        return num + _x;
    }
    function add(uint _x, uint _y) external pure returns (uint) {
        return _y + _x;
    }
}