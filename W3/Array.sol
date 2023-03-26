// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Array {
    uint[] public nums = [1, 2, 3];   //dynamic
    uint[3] public numsFixed =  [4, 5, 6]; //fixed

    function examples() external{
        nums.push(4);  // [1, 2, 3, 4]
        uint x = nums[1];
        nums[2] = 777;  //[1, 2, 777, 4]
        delete nums[1];  //[1, 0, 777, 4]  replace the element to 0
        nums.pop();   //[1, 0, 777] remove the last element
        uint len = nums.length;

        //create array in memory, needs to be fixed
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }
    function returnArray() external view returns (uint[] memory){
        return nums;
    }
    // not recommended to return an array: use too much gas
}