// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IAgentRegistry.sol";

contract RoboticsMarketplace {
    IERC20 public immutable paymentToken;
    IAgentRegistry public immutable agentRegistry;

    struct Asset { uint256 id; address seller; string ipfsURI; uint256 price; bool isSold; }
    uint256 private _nextAssetId;
    mapping(uint256 => Asset) public assets;

    event AssetListed(uint256 indexed assetId, address indexed seller, uint256 price, string ipfsURI);
    event AssetPurchased(uint256 indexed assetId, address indexed buyer, address indexed agent, uint256 price);

    constructor(address _paymentToken, address _agentRegistry) {
        paymentToken = IERC20(_paymentToken);
        agentRegistry = IAgentRegistry(_agentRegistry);
    }

    function listAsset(string calldata ipfsURI, uint256 price) external {
        require(price > 0, "Price must be > 0");
        uint256 assetId = ++_nextAssetId;
        assets[assetId] = Asset({ id: assetId, seller: msg.sender, ipfsURI: ipfsURI, price: price, isSold: false });
        emit AssetListed(assetId, msg.sender, price, ipfsURI);
    }

    function purchaseWithAgent(uint256 assetId, address agentAddress) external {
        Asset storage asset = assets[assetId];
        require(agentRegistry.isAgentActive(agentAddress), "Invalid or inactive agent");
        require(paymentToken.transferFrom(msg.sender, address(this), asset.price), "Transfer failed");
        asset.isSold = true;
        require(paymentToken.transfer(asset.seller, asset.price), "Payout failed");
        emit AssetPurchased(assetId, msg.sender, agentAddress, asset.price);
    }
}
