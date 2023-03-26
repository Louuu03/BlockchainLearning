// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Event {  
    event Log(string message, uint val);//parameter will be logged on the blockchain
    //indexed helps you quickly serached for log by parameters, you can add up to 3 parameters
    event IndexedLog(address indexed sender, uint val);

    function example() external{
        emit Log("foo", 123);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external{
        emit Message(msg.sender, _to, message);
    }
}  
