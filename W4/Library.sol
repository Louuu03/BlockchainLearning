// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

library Math { //no state varible
    function max (uint x, uint y ) internal pure returns (uint){       //internal =>embedded in contract test, public => deploy seperrately from the contract Test
        return x>=y ? x: y;
    }
}
contract Test {
    function testMax(uint x, uint y) external pure returns (uint){
        return Math.max(x, y);
    }
}

library Arraylib {
    function find(uint[] storage arr, uint x) internal view returns (uint){
        for (uint i = 0; i< arr.length; i ++){
            if(arr[i] == x){
                return i;
            }
        }
        revert('Not Found')
    }
}

contract TestArray{
    using Arraylib for uint[]; 
    uint[] public arr=[3,2,1];

    function testFind() external view returns (uint i){
        return arr.find(2);
    }
}