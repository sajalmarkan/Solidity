// SPDX-License-Identifier: MIT

pragma solidity >=0.8. 13<0.9.0;

contract eventTicket{
    uint numberOfTicket;
    uint ticketPrice;
    uint totalAmount;
    uint startAt;
    uint endAt;
    uint time;
    string message ="enjoy your event";

    constructor (uint _ticketPrice){
        ticketPrice= _ticketPrice;
        startAt =block.timestamp;
        endAt=block.timestamp +7 days;
        time = (endAt -startAt) /60/60/24;
    }

    function buy(uint _value) public returns(uint ticketId)
    {
        numberOfTicket++;
        totalAmount +=_value;
        ticketId =numberOfTicket;
    } 
    function amount() public view returns(uint){
        return totalAmount;
    }
}
