pragma solidity ^0.5.2;

import "../erc20/ERC20.sol";
import "./Lockable.sol";
import "./Pausable.sol";

/**
 * @title ERC20Extended for UNICZ COIN
 * @dev ERC20 modified with needed transfers. 1. pausable 2. lockable
 */
contract ERC20Extended is ERC20, Pausable, Lockable {

    mapping (address => uint256) public airDropHistory;
    event AirDrop(address _receiver, uint256 _amount);

    function dropToken(address[] memory receivers, uint256[] memory values) public {
        require(receivers.length != 0);
        require(receivers.length == values.length);

        for (uint256 i = 0; i < receivers.length; i++) {
            address receiver = receivers[i];
            uint256 amount = values[i];

            transfer(receiver, amount);
            airDropHistory[receiver] += amount;

            emit AirDrop(receiver, amount);
        }
    }

    function transfer(address to, uint256 value) public  checkLock whenNotPaused returns (bool) {
        return super.transfer(to, value);
    }

    function transferFrom(address from, address to, uint256 value) public  checkLock whenNotPaused returns (bool) {
        return super.transferFrom(from, to, value);
    }

    function approve(address spender, uint256 value) public checkLock whenNotPaused returns (bool) {
        return super.approve(spender, value);
    }

    function increaseAllowance(address spender, uint addedValue) public checkLock whenNotPaused returns (bool success) {
        return super.increaseAllowance(spender, addedValue);
    }

    function decreaseAllowance(address spender, uint subtractedValue) public checkLock whenNotPaused returns (bool success) {
        return super.decreaseAllowance(spender, subtractedValue);
    }
}
