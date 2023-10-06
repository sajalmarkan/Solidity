// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct cars{
    uint carno;
    string name;
    address number;
}

contract CarContract{
    address public manager;
    mapping(address=>cars) public car;
    constructor() {
        manager = msg.sender;
        
    }

    function getether(uint _carno, string memory _name) external payable{
        require(msg.value == 1 ether,"amount not recieved");
        car[msg.sender].carno= _carno;
        car[msg.sender].name = _name;
        car[msg.sender].number =msg.sender;
        
        // participants.push(payable(msg.sender));
    }

    function return_car(uint _no) external{
        require(car[msg.sender].carno==_no,"car donot match");
        delete car[msg.sender];
        payable(msg.sender).transfer(0.75 ether);
    }
}

