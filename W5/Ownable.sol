// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Ownable {
    address public owner;
    
    constructor(){
        owner= msg.sender
    }

    modifier onlyOwner(){
        require(msg.sender == owner, 'not owner');
    }

    function setOwner(address _newOwnenr) external onlyOwner {
        require(_newOwnenr != address(0), 'invalid address');
        owner = _newOwner;
    } 

    function onlyOwnerCall() external onlyOwner{

    }

    function anyOneCall() external{

    }
}