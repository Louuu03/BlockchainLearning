// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract ForAndWhileLoops {
    function loops() external{
        for (uint i = 0; i < 10; i ++){
            if( i == 3){
                continue; // skip to next loop, not going below to 'more code'
            }
            // more code
             if( i == 5){
                break; // skip all, not going to i = 6, 7, 8, 9
            }
        }

        uint j = 0;
        while (j < 10){
            j++;
        }
    }
    function sum(uint _n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= _n; i ++){
            s+=1;
        }
        return s;
    }

}