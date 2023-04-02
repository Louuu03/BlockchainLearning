// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

// contract Counter {
//     uint public count;

//     function inc() external{
//         count +=1;
//     }
//     function dec() external{
//         count -=1;
//     }
// }

interface ICounter{
    function count () external view returns (uint);             //Can functions from different contract put into the sale interface?
    function inc () external;

}

contract CallInterface {
    uint public count;
    function examples(address _counter) external{
        //Counter(_counter).inc();
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
     }
}