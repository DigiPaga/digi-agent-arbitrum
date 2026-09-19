// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IAgentRegistry {
    struct AgentIdentity { address agentAddress; address owner; string agentType; string metadataURI; bool isActive; uint256 registeredAt; }
    function registerAgent(address agentAddress, string calldata agentType, string calldata metadataURI) external returns (uint256);
    function verifyAgent(address agentAddress, bytes32 verificationHash) external;
    function getAgentIdentity(address agentAddress) external view returns (AgentIdentity memory);
    function isAgentActive(address agentAddress) external view returns (bool);
}
