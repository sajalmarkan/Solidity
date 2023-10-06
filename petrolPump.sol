// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

struct carinfo{
    uint carnum;
    address addr;
    string name;
    uint val;
}
contract petrolpump is ERC20{
    mapping(address=>carinfo) public cars;
    address owner;

    
    constructor() ERC20("token","tkn"){
        owner = msg.sender;
        _mint(msg.sender,100000*10**18);
    }

    function carDetails(uint _carnum, string memory _name) public payable {
        require(msg.value>=1 ether,"give some money");
        uint val =msg.value;

        cars[msg.sender].carnum=_carnum;
        cars[msg.sender].name=_name;
        cars[msg.sender].addr=msg.sender;
        cars[msg.sender].val=val;
    }

    function transfer() public returns (bool) {
        uint _amount=cars[msg.sender].val*1000;

        // uint _amount=cars[msg.sender].val-(cars[msg.sender].val*10)/100;
        address to =msg.sender;
        _transfer(owner, to,_amount);
        return true;
    }

    // function balanceOf(address who) external view returns (uint256 balance){
    //     who =msg.sender;
    //     return balance;
    // }

    function transfer2() public returns(string memory, uint) {
        require(balanceOf(msg.sender)>0,"amount should be greater than 0");
        uint _amount= balanceOf(msg.sender);
        _burn(msg.sender,balanceOf(msg.sender));
        address to =owner;
        _transfer(msg.sender, to,_amount);
        return ("your amount is" , _amount);
        // return true;
    }
    

}
