// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract S {
    string public name;

    constructor(string memory _name){
        name= _name;
    }
}

contract T{
     string public text;

    constructor(string memory _text){
        text= _text;
    }
}

contract U is S('name'), T('text'){

}

//Dynamic input
contract V is S, T{
    constructor(string memory _name, string memory _text) S(_name) T(_text){

    }
}

contract W is S('name'), T{
     constructor( string memory _text) T(_text){

    }
}

//order of initialization is determined by order of inheritance
// S => T => Y
// the contract itself is always the last
contract Y is S, T{ //Others are determined by this order
     constructor(string memory _name, string memory _text) S(_name) T(_text){

    }
}
