# DigiPaga Marketplace
[![Arbitrum](https://img.shields.io/badge/Arbitrum-2D3748?style=for-the-badge&logo=arbitrum&logoColor=white)](https://arbitrum.io)
[![Buildathon](https://img.shields.io/badge/Buildathon-Arbitrum%20Open%20House%20Singapore-2D3748?style=for-the-badge)](https://openhouse.arbitrum.io)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-363636?style=for-the-badge&logo=solidity&logoColor=white)](https://soliditylang.org)
[![Next.js](https://img.shields.io/badge/Next.js-14-black?style=for-the-badge&logo=next.js&logoColor=white)](https://nextjs.org)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

> **Dual-rail marketplace enabling autonomous AI agents and humans to discover, purchase, and trade digital assets via x402 payments on Arbitrum and Robinhood Chain.**

---

## 📋 Table of Contents
- [Problem](#-problem)
- [Solution](#-solution)
- [Key Features](#-key-features)
- [Architecture](#-architecture)
- [How It Works](#-how-it-works)
- [Tech Stack](#-tech-stack)
- [Smart Contracts](#-smart-contracts)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Team](#-team)
- [License](#-license)

---
## 🔥 Problem

Traditional marketplaces require human intervention for every transaction, creating friction and limiting scalability. AI agents, autonomous systems, and decentralized applications lack a native, trustless mechanism to:
- **Purchase digital assets** without human approval workflows
- **Verify identity and reputation** on-chain
- **Execute micro-payments** efficiently across multiple chains
- **Access gated content** programmatically

The result? Billions in potential automated commerce remain locked behind manual processes.

---

## 💡 Solution

**DigiPaga Marketplace** is a dual-rail platform that bridges autonomous agents and human users through:
1. **Agentic Commerce Rail**: AI agents purchase digital assets directly via **x402 (HTTP 402 Payment Required)** protocol, using **ERC-8004** for on-chain identity verification.
2. **Human Discovery Rail**: Interactive marketplace for humans to explore, curate, and manage assets with intuitive UX.

Both rails settle on **Arbitrum** and **Robinhood Chain**, enabling sub-second finality and near-zero gas fees.

---
## 🌟 Key Features

### For AI Agents
- ✅ **x402 Native Payments**: HTTP 402 status code + EIP-3009/EIP-712 signatures for trustless micro-payments
- ✅ **ERC-8004 Identity**: On-chain agent registration and reputation tracking
- ✅ **Account Abstraction**: ZeroDev-powered smart accounts for gasless transactions
- ✅ **Multi-Chain**: Deploy on Arbitrum Sepolia, Arbitrum One, or Robinhood Chain

### For Humans
- ✅ **Dual-Rail Discovery**: Visual marketplace with filtering, search, and curation
- ✅ **Interactive Maps**: Geographic and categorical asset exploration
- ✅ **Wallet Integration**: Wagmi + MetaMask/Rabby support
- ✅ **IPFS Storage**: Decentralized asset delivery and verification

### For Developers
- ✅ **Foundry-Based**: Fastest smart contract development and testing framework
- ✅ **Type-Safe**: Full TypeScript stack from contracts to frontend
- ✅ **CI/CD Ready**: GitHub Actions for automated testing and deployment
- ✅ **Modular Architecture**: Clean separation of concerns, easy to extend

---
