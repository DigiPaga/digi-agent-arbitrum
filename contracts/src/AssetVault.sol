// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AssetVault {
    mapping(uint256 => string) private _assetURIs;
    function storeAsset(uint256 assetId, string calldata uri) external { _assetURIs[assetId] = uri; }
    function getAssetURI(uint256 assetId) external view returns (string memory) { return _assetURIs[assetId]; }
}
