// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assessment {
    uint public exp = 2500;
    
    event ExpIncreased(address indexed user, uint amount);
    event ExpDecreased(address indexed user, uint amount);
    event DefendFailed(address indexed user, string reason);

    function pressAttackButton() public {
        // Add 5000 exp when the attack button is pressed
        exp += 5000;

        // Emit an event to log the exp increase
        emit ExpIncreased(msg.sender, 5000);
    }

    function pressDefendButton() public {
        // Subtract 2500 exp when the defend button is pressed
        if (exp < 2500) {
            // Provide a detailed reason for the revert
            emit DefendFailed(msg.sender, "Not enough exp to defend");
            revert("Not enough exp to defend");
        }

        exp -= 2500;

        // Emit an event to log the exp decrease
        emit ExpDecreased(msg.sender, 2500);
    }

    function getExp() public view returns (uint) {
        return exp;
    }
}
