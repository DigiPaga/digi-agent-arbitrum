// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AgentRegistry.sol";
import "../src/RoboticsMarketplace.sol";

contract DeployRobinhoodScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        AgentRegistry agentRegistry = new AgentRegistry();
        address mockUsdc = 0x0000000000000000000000000000000000000001;
        RoboticsMarketplace marketplace = new RoboticsMarketplace(mockUsdc, address(agentRegistry));
        vm.stopBroadcast();
        console.log("RH AgentRegistry:", address(agentRegistry));
        console.log("RH Marketplace:", address(marketplace));
    }
}
