// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/IAgentRegistry.sol";

contract AgentRegistry is IAgentRegistry {
    uint256 private _nextAgentId;
    mapping(address => AgentIdentity) private _agents;
    mapping(address => bool) private _isActive;

    event AgentRegistered(address indexed agentAddress, address indexed owner, string agentType, uint256 timestamp);
    event AgentVerified(address indexed agentAddress, bytes32 indexed verificationHash, uint256 timestamp);

    function registerAgent(address agentAddress, string calldata agentType, string calldata metadataURI) external override returns (uint256) {
        require(agentAddress != address(0), "Invalid agent address");
        uint256 agentId = ++_nextAgentId;
        _agents[agentAddress] = AgentIdentity({
            agentAddress: agentAddress, owner: msg.sender, agentType: agentType,
            metadataURI: metadataURI, isActive: true, registeredAt: block.timestamp
        });
        _isActive[agentAddress] = true;
        emit AgentRegistered(agentAddress, msg.sender, agentType, block.timestamp);
        return agentId;
    }

    function verifyAgent(address agentAddress, bytes32 verificationHash) external override {
        require(_isActive[agentAddress], "Agent not registered");
        emit AgentVerified(agentAddress, verificationHash, block.timestamp);
    }

    function getAgentIdentity(address agentAddress) external view override returns (AgentIdentity memory) {
        return _agents[agentAddress];
    }

    function isAgentActive(address agentAddress) external view override returns (bool) {
        return _isActive[agentAddress];
    }
}
