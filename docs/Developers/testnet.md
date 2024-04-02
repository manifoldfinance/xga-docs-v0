---
title: MEV L2 Testnet
description: Testing information for node operators, validators, builders, and searchers.
---

## Node Operators

Please coordinate with us to register your validator set with our registry service. We will provide
you with the necessary information to get started.

## Validators

Connecting to the relay without being registered will result in your validator operating correctly
so long as MEV Boost is also running.

## Holesky Information

- **L2 RPC (TESTNET):**

  - Description: L2 Node RPC (Testnet)
  - URL: [https://holesky-api.securerpc.com/l2](https://holesky-api.securerpc.com/l2/)
  - Methods: eth\_\*
  - ChainId: 42169

- **Beta bundle RPC (Testnet):**
  - Description: Beta bundle submission RPC
  - URL: [https://holesky-api.securerpc.com/v2](https://holesky-api.securerpc.com/v2)
  - Method: mev_sendBetaBundle
  - Parameters:
    - `txs`: List of txs as bundle e.g. [0x2323...,]
    - `slot`: slot number e.g. "11282389"
  - ChainId: 17000

## Builders and searchers

Aquire some Holesky Testnet ETH through a faucet in the resources listed below. If you are unable to
secure enough, please reach out to us.

### Contracts

L2 _Auctioneer_: `0x277058D78307F11e590D91eDfF3D4b1C0fAA240c` L2 _SettlementHouse_:
`0xD26004b2DB8e2e17e074EedE115bF200cb5D10d9` _L1StandardBridgeProxy_:
`0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C`,

To monetize yourself on L2, send some ETH on L1 (Holesky) to
`0x3Ae5Ca0B05bE12d4FF9983Ed70D86de9C34e820C`

mevETH Reward Address: `0x583d8a136e5e4387234A50EB9fd790d9c513484C`

- Holesky Network ID: `17000`
- Holesky Chain ID: `17000`
- L2 Chain ID: `42169`
- L2 RPC Endpoint: [@holesky-l2.v2-stag.manifoldx.com](https://holesky-l2.v2-stag.manifoldx.com/)

!!! warning

    The L2 RPC Endpoint requires a username and password, this is provided by us during the closed testing period

### Resources

- Block Explorers
  - [holesky.etherscan.io](https://holesky.etherscan.io/)
  - [holesky.beaconcha.in](https://holesky.beaconcha.in/)
  - [dora-holesky.pk910.de](https://dora-holesky.pk910.de/)
- Ethstats: [ethstats.holesky.ethpandaops.io](https://ethstats.holesky.ethpandaops.io)
- Faucets:
  - [holesky-faucet.pk910.de](https://holesky-faucet.pk910.de/)
  - [QuickNode Faucet](https://faucet.quicknode.com/ethereum/holesky)
  - [Chainstack Faucet](https://faucet.chainstack.com/holesky-faucet)
  - [Automata Holesky Faucet](https://holeskyfaucet.io)
