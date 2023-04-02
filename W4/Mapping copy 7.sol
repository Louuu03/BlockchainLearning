// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

// X -> Y
// Y&X ->Z
// order would be the most base like
// X->Y->Z


contract X {
    function foo() public pure virtual returns(string memory){
        return "X";
    }
    function bar() public pure virtual returns(string memory){
        return "X";
    }
     function x() public pure virtual returns(string memory){
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns(string memory){
        return "Y";
    }
    function bar() public pure virtual override returns(string memory){
        return "Y";
    }
     function y() public pure virtual returns(string memory){
        return "Y";
    }
}

contract Z is X, Y {   // inheritance needs to be in order or the contract wouldn't compile
    unction foo() public pure override(X,Y) returns(string memory){
        return "Z";
    }
    function bar() public pure override(X,Y) returns(string memory){
        return "Z";
    }
}