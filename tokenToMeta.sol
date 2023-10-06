// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract meta is ERC20{

    constructor() ERC20("sam","sam"){
        _mint(msg.sender,10000000 ether);
    }


    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        uint _amount=(amount*5)/100;
         uint amt = amount-_amount;
        _transfer(msg.sender, to, amt);
        _burn(msg.sender,_amount);
        
        return true;
    }
}
