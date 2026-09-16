# ETHSKILLS Guardrails for DigiPaga Robotics

Before writing Solidity, deploying contracts, integrating DeFi, or building a dApp frontend, you MUST read and follow:
https://ethskills.com/SKILL.md

## Project-Specific Context
- **Target Chains**: Arbitrum Sepolia (421614), Arbitrum One (42161), Robinhood Chain Testnet (46630).
- **Core Standards**: ERC-8004 (Agent Identity), x402 (HTTP 402 Payments), EIP-3009/EIP-7702 (Signatures/Smart EOAs).
- **Tooling**: Foundry (forge, cast), Rust/Stylus (cargo-stylus), Next.js, Viem, ZeroDev (Account Abstraction).
- **Rule**: Never hallucinate contract addresses. Always fetch verified addresses from https://ethskills.com/addresses/SKILL.md or official docs.
- **Security**: Run mental CROPS review (Censorship Resistance, Open Source, Privacy, Security) before finalizing any contract logic.
