// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IX402Facilitator.sol";
contract X402Facilitator is IX402Facilitator {
    IERC20 public immutable token;
    constructor(address _token) { token = IERC20(_token); }
    function settlePayment(uint256 assetId, address buyer, address agent, uint256 amount, bytes calldata signature) external override {
        emit PaymentSettled(assetId, buyer, agent, amount);
    }
}
