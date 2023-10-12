// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract multiLevelMarkeing {
    mapping(address => bool) public user;
    mapping(address => address) public head;
    uint256 public totalusers = 1;

    address public owner;

    constructor() {
        owner = msg.sender;
        user[owner]=true;
    }

    function marketing(address _head) public payable {
        require(msg.value == 1 ether, "give some money");
        require(!user[msg.sender], "user is already available with us");
        require(user[_head], "head is not available with us");
        head[msg.sender] = _head;
        totalusers++;
        user[msg.sender]= true;

        address _heading = _head;

        if (_heading != address(0)) {
            payable(_heading).transfer((1 ether * 5) / 100);
            _heading = head[_heading];
            if (_heading != address(0)) {
                payable(_heading).transfer((1 ether * 4) / 100);
                _heading = head[_heading];
                if (_heading != address(0)) {
                    payable(_heading).transfer((1 ether * 3) / 100);
                    _heading = head[_heading];
                    if (_heading != address(0)) {
                        payable(_heading).transfer((1 ether * 2) / 100);
                        _heading = head[_heading];
                        if (_heading != address(0)) {
                            payable(_heading).transfer((1 ether * 1) / 100);
                            _heading = head[_heading];
                        }
                    }
                }
            }
        }
    }
}
