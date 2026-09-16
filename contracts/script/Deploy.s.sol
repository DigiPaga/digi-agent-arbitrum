// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AgentRegistry.sol";
import "../src/RoboticsMarketplace.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 1. Desplegar AgentRegistry (ERC-8004)
        AgentRegistry agentRegistry = new AgentRegistry();
        
        // 2. Desplegar RoboticsMarketplace
        // Address oficial USDC Arb Sepolia: 0x75faf114eafb1BDbe4F43213Fe49D7C47aA714B3
        address usdcAddress = 0x75faf114eafb1BDbe4F43213Fe49D7C47aA714B3;
        RoboticsMarketplace marketplace = new RoboticsMarketplace(usdcAddress, address(agentRegistry));

        vm.stopBroadcast();

        console.log("AgentRegistry deployed at:", address(agentRegistry));
        console.log("RoboticsMarketplace deployed at:", address(marketplace));
    }
}
