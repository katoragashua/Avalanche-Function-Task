// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error UserNotFound(address user);

contract Donation {
    uint public totalAmount;
    mapping(address => uint) public userBalance;


    function donate(uint _amount) external {
        require(_amount > 0, "Zero Value not allowed");
        assert(_amount > 2);
        userBalance[msg.sender] += _amount;
        totalAmount += _amount;
    }

     function getUserBalances(address _user) external view returns (uint) {
        uint balance = userBalance[_user];
        if (balance == 0 && _user != address(0)) {
            revert UserNotFound(_user);
        }
        return balance;
    }

}