// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract IfElse {
    function examplel(uint _x) external pure returns (uint){
        if(_x<10){
            return 1;
        }else if (_x<20){
            return 2;
        } // else{ return 3 }  (optional)
        return 3;
    }
    function tenary(uint _x) external pure returns(uint){
        //if (_x<10){
        //    return 1;
        //}
        //return 2;
        return _x < 10 ? 1 : 2;
    }
}
