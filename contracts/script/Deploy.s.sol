// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AgentRegistry.sol";
import "../src/RoboticsMarketplace.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        AgentRegistry agentRegistry = new AgentRegistry();
        
        // Checksum corregido para USDC en Arbitrum Sepolia
        address usdcAddress = 0x75faF114eAfb1bDbE4F43213fE49d7C47Aa714b3;
        RoboticsMarketplace marketplace = new RoboticsMarketplace(usdcAddress, address(agentRegistry));

        vm.stopBroadcast();

        console.log("AgentRegistry deployed at:", address(agentRegistry));
        console.log("RoboticsMarketplace deployed at:", address(marketplace));
    }
}
