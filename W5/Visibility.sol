// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Visibility{
    uint private x =0;
    uint internal y = 1;
    uint public z = 2;


    function privateFunc() private pure returns (uint){
        return 0;
    }

    function internalFunc() internal pure returns (uint){
        return 10;
    }

    function publicFunc() public pure returns (uint){
        return 20;
    }

    function externalFunc() external pure returns (uint){
        return 30;
    }

    function examples() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();
        // No externalFunc();
        this.externalFunc(); // gas inefficient
    }
}

contract VisibilityChild is Visibility {
    function example2() external view{
        y + z;
        internalFunc();
        publicFunc();
        // not external and private;
    }
}