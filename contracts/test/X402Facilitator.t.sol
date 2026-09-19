// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/X402Facilitator.sol";

contract X402FacilitatorTest is Test {
    X402Facilitator facilitator;
    address mockToken = address(0x1);
    address buyer = address(0x2);
    address agent = address(0x3);

    function setUp() public {
        facilitator = new X402Facilitator(mockToken);
    }

    function test_SettlePayment() public {
        // Foundry espera el evento tal como se define en el contrato
        vm.expectEmit(true, true, true, true);
        emit PaymentSettled(1, buyer, agent, 100);
        
        facilitator.settlePayment(1, buyer, agent, 100, "0x");
    }
}
