// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract DataLocations {
    struct MyStruct{
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public MyStructs;

    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory){
        MyStructs[msg.sender]= MyStruct({foo: 123, text: 'bar'});

        MyStruct storage ex = MyStructs[msg.sender];
        ex.text='foo';

        MyStruct memory readOnly = MyStructs[msg.sender];
        readOnly.foo = 456;

        uint[] memory memArr= new uint[](3);                    //array initialized in memory can only be fixed size
        memArr[0]=234;
        return memArr;
    }

    function _internal(uint[] calldata y) private{
        uint x = y [0];
    }
}