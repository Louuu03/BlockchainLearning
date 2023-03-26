// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

//use less gas than variables
contract Constants {
    address public constant MY_ADDRESS=0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant My_UINT=123;
}
contract Var {
    address public  MY_ADDRESS=0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
}