// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Fallback {
    // execute when a function doesn't exist
    // directly send ETH
    //to enable a smart contract to receive ETH

    event Log(string func, address sender, uint value, bytes data );
    //when no receive or msg.data is not empty
    fallback() external payable{
        emit Log('fallback', msg.sender, msg.value, msg.data);
    }


    //when msg.data is empty or else call fallback
    receive() external payable{
        emit Log('receive', msg.sender, msg.value, '');

    }

}