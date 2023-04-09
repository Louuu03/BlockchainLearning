// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Kill {

    function kill() external{
        constructor() payable {}
        selfdestruct(payable(msg.sender)); //address thaht force the rest of ether in the contract to

    }

    function testCall() external pure returns (uint){
        return 123;
    }
}

contract Helper{
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external{
        _.kill();
    }
}