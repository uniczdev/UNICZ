pragma solidity ^0.5.2;

import "../extensions/ERC20Extended.sol";


/**
 * @title UnicusZCoin
 */
contract UnicusZCoin is ERC20Extended {

    string public constant name = "UNICUS-Z COIN";
    string public constant symbol = "UNICZ";
    uint public constant decimals = 18;
    uint public constant INITIAL_SUPPLY = 800000000 * (10 ** uint256(decimals));

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

}
