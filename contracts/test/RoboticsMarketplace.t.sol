// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/RoboticsMarketplace.sol";
import "../src/AgentRegistry.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Mock USDC para testing
contract MockUSDC is ERC20 {
    constructor() ERC20("Mock USDC", "USDC") {}
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}

contract RoboticsMarketplaceTest is Test {
    RoboticsMarketplace public marketplace;
    AgentRegistry public registry;
    MockUSDC public usdc;
    
    address public seller = address(0x111);
    address public buyer = address(0x222);
    address public agent = address(0x333);

    function setUp() public {
        usdc = new MockUSDC();
        registry = new AgentRegistry();
        marketplace = new RoboticsMarketplace(address(usdc), address(registry));

        // Registrar un agente activo
        vm.prank(agent);
        registry.registerAgent(agent, "vps", "ipfs://agent-meta");

        // Dar USDC al comprador
        usdc.mint(buyer, 100 ether);
    }

    function test_ListAsset() public {
        vm.prank(seller);
        marketplace.listAsset("ipfs://manual.pdf", 10 ether);
        
        (uint256 id, address lister, string memory uri, uint256 price, bool isSold) = marketplace.assets(1);
        assertEq(id, 1);
        assertEq(lister, seller);
        assertEq(price, 10 ether);
        assertFalse(isSold);
    }

    function test_PurchaseWithAgent() public {
        // 1. Seller lista el asset
        vm.prank(seller);
        marketplace.listAsset("ipfs://blueprint.cad", 50 ether);

        // 2. Buyer aprueba el gasto de USDC al marketplace
        vm.prank(buyer);
        usdc.approve(address(marketplace), 50 ether);

        // 3. Buyer compra usando el agente
        vm.prank(buyer);
        marketplace.purchaseWithAgent(1, agent);

        // 4. Verificar que el asset está vendido
        (, , , , bool isSold) = marketplace.assets(1);
        assertTrue(isSold);

        // 5. Verificar que el seller recibió el pago
        assertEq(usdc.balanceOf(seller), 50 ether);
    }

    function test_RevertIfAgentInactive() public {
        vm.prank(seller);
        marketplace.listAsset("ipfs://test.pdf", 10 ether);

        vm.prank(buyer);
        usdc.approve(address(marketplace), 10 ether);

        address inactiveAgent = address(0x999);
        vm.prank(buyer);
        vm.expectRevert("Invalid or inactive agent");
        marketplace.purchaseWithAgent(1, inactiveAgent);
    }
}
