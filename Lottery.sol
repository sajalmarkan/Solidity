// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Lottery
{
    address[] public participants;
    uint public endTime;
    address payable public winner;
    address public manager;

    constructor() {
        manager = msg.sender;
        endTime = block.timestamp + 30 seconds;
    }
    function recieveETHR() public payable{
        require(msg.value ==1 ether,"Amount is not in bond");
        require(block.timestamp<endTime,"time out");
        participants.push(payable(msg.sender));
    }
    function Totalpant()view public returns(uint)
    {
        return participants.length;
    }
    function pickWinner() public {
        require(msg.sender == manager, "Only the manager can pick a winner");
        require(block.timestamp > endTime, "Cannot pick a winner before the lottery ends");
        uint256 index = random() % participants.length;
        winner = payable(participants[index]);
        winner.transfer(address(this).balance);
    }
       function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants)));
    }
}
        
