// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract FunctionModifier{
    bool public paused;
    uint public count;


    function setPause(bool _paused) external{
        paused=_paused;
    }

    modifier whenNotPaused() {
        require(!paused, 'paused');
        _;
    }

    function increase() external whenNotPaused {
        //require(!paused, 'paused');
        count +=1;
    }
    function decrease() external whenNotPaused{
        //require(!paused, 'paused');
        count -=1;
    }

    modifier cap(uint _x) {
        require(_x<100, '_x>100');
        _;
    }

    function increaseBy(uint _x) external cap(_x) {
        //require(_x<100, '_x>100');
        count +=1;
    }

    modifier sandwich(){
        count+= 10; //call before function
        _;
        count *=2; //call after function
    }
    function foo() external sandwich{
        count ++;
    }
}