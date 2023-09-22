// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ICriptechBRLToken is IERC20 {
    function mint(address _account, uint256 _amount) external;

    function burn(uint256 _amount) external;

    function exchangeBalance(address _from, address _to) external;

    function invest(address _investor, uint256 _amount) external;

    function balanceOf(address emissorAddress) external view returns (uint256);
}
