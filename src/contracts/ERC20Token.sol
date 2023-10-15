// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Token is ERC20, Ownable {
    /**
     * @dev ERC20 Offer Token
     */
    constructor() Ownable(msg.sender) ERC20("ERC20 Sample", "ES") {}

    /**
     * @dev Allow minting by the owner
     */
    function mint(address _account, uint256 _amount) public {
        require(_account != address(0), "Account is empty");
        require(_amount != 0, "Amount is zero");

        _mint(_account, _amount);
    }

    /**
     * @dev Allow burning by the owner
     */
    function burn(uint256 _amount) public onlyOwner {
        require(_amount != 0, "Amount is zero");

        _burn(owner(), _amount);
    }

    /**
     * @dev Exchanges the funds of one address to another
     */
    function exchangeBalance(address _from, address _to) public {
        require(_from != address(0), "From is empty");
        require(_to != address(0), "To is empty");

        // get current balance of _from address
        uint256 nAmount = balanceOf(_from);

        // dont proceed if theres nothing to exchange
        require(nAmount != 0, "Amount is zero");

        // transfer balance to new address
        _transfer(_from, _to, nAmount);
    }

    /**
     * @dev Deposit funds for an user
     */
    function deposit(address _user, uint256 _amount) public {
        // mint the T tokens to the user account
        _mint(_user, _amount);
    }
}
