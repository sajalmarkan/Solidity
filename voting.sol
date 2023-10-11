// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract voting{

    struct vote{
    uint age;
    string name;
    address addr;
    }
    uint public votess =0;

    address owner;
    mapping(address=>vote) public votes;
    constructor(){
        owner = msg.sender;
    }

    function user( string memory _name,uint _age) external{
        require(owner!=msg.sender,"you are owner you cant vote");
        require(msg.sender!=votes[msg.sender].addr,"already voted");
        votes[msg.sender].name =_name;
        votes[msg.sender].age =_age;
        votes[msg.sender].addr=msg.sender;
        votess++;

        
    }
    function check(address addr) external view returns(string memory abc){
        addr=msg.sender;
        if(votes[msg.sender].age>=18){
            abc="you are eligible to vote";
            return abc;
        }
        else {
            abc="you are not eligible";
            return abc;
        }
    }
}
