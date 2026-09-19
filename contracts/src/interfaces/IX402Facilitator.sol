// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IX402Facilitator {
    event PaymentSettled(uint256 indexed assetId, address indexed buyer, address indexed agent, uint256 amount);
    function settlePayment(uint256 assetId, address buyer, address agent, uint256 amount, bytes calldata signature) external;
}
