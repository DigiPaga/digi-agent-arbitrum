// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/X402Facilitator.sol";
contract X402FacilitatorTest is Test {
    X402Facilitator facilitator;
    function setUp() public { facilitator = new X402Facilitator(address(0x1)); }
    function test_SettlePayment() public {
        vm.expectEmit(true, true, true, true);
        emit IX402Facilitator.PaymentSettled(1, address(0x2), address(0x3), 100);
        facilitator.settlePayment(1, address(0x2), address(0x3), 100, "0x");
    }
}
