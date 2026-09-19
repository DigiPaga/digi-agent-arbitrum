// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/X402Facilitator.sol";
import "../src/interfaces/IX402Facilitator.sol";

// Al heredar de IX402Facilitator, el evento PaymentSettled entra en el alcance de este contrato
contract X402FacilitatorTest is Test, IX402Facilitator {
    X402Facilitator facilitator;
    address mockToken = address(0x1);
    address buyer = address(0x2);
    address agent = address(0x3);

    function setUp() public {
        facilitator = new X402Facilitator(mockToken);
    }

    function test_SettlePayment() public {
        // Ahora Foundry reconoce el evento porque este contrato hereda la interfaz
        vm.expectEmit(true, true, true, true);
        emit PaymentSettled(1, buyer, agent, 100);
        
        facilitator.settlePayment(1, buyer, agent, 100, "0x");
    }
}
