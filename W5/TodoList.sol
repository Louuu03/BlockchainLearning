// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract OwnerOnly{
    struct Task {
        string name;
        bool completed;
    }
    Task[] private Lists;

    address private owner;

    constructor(){
        owner = msg.sender;
    }

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }

    function find(string _name) internal returns (Task){
        for (uint i = 0; i<= Lists.length; i ++) {
            if (keccak256(abi.encodePacked(Lists[i].name)) == keccak256(abi.encodePacked(_name))){
                return Lists[i];
            }
        }
        revert("Task Not Found!");
    }

    function create(string calldata _name) external ownerOnly{
        Lists.push(Task(_name, false));
    }

    function get(uint memory _index) external view ownerOnly returns (Task memory){
        return Lists[_index];
    }

    function update(string _name, bool _completed) external ownerOnly{
        Task theTask = find(_name);
        theTask.completed = _completed;
    }

    function kill() external ownerOnly{
         selfdestruct(payable(msg.sender)); 
    }
}

contract ForEveryOne{
    struct Task {
        string name;
        bool completed;
    }

    mapping(address => Task[]) userTasks;


    function find(string _name) internal returns (Task) {
        for (uint i = 0; i<= userTasks[msg.sender].length; i ++) {
            if (keccak256(abi.encodePacked( userTasks[msg.sender][i].name)) == keccak256(abi.encodePacked(_name))){
                return userTasks[msg.sender][i];
            }
        }
        revert("Task Not Found!");
    }

    function create(string calldata _name) external {
        Task _task = userTasks[msg.sender];
        _task.push(Task(_name, false));
    }
    function update(string _name, bool _completed) external {
        Task theTask = find(_name);
        theTask.complete = _completed;
    }
    function get(uint memory _index) view external returns (){
        return userTasks[msg.sender][_index];
    }

    function kill() external ownerOnly{
         selfdestruct(payable(msg.sender)); 
    }
}

contract SaveMoney{
    struct Task {
        string name;
        bool completed;
    }
    Task[] private Lists;

    address private owner;

    constructor(){
        owner = msg.sender;
    }

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }

    function create(string calldata _name) external ownerOnly{
        Lists.push(Task(_name, false));
    }

    function find(string _name) internal returns (Task){
        for (uint i = 0; i<= Lists.length; i ++) {
            if (keccak256(abi.encodePacked(Lists[i].name)) == keccak256(abi.encodePacked(_name))){
                return Lists[i];
            }
        }
        revert("Task Not Found!");
    }
    
    function get(uint memory _index) external view ownerOnly returns (Task memory){
        return Lists[_index];
    }

    function update(string _name, bool _completed) external ownerOnly{
        Task theTask = find(_name);
        theTask.completed = _completed;
    }

    function kill() external ownerOnly{
         selfdestruct(payable(msg.sender)); 
    }
}