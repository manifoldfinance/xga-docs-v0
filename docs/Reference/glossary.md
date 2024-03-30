---
title: Glossary
---

## Documentation Overview

The document is a thorough and technical exploration of auction design and implementation in the
context of Ethereum, focusing on a block proposer call market auction. It provides a detailed
specification for this auction type, a glossary of terms, accounting procedures, market design
considerations, and an analysis of different auction formats. The document is structured into
distinct sections, each covering a critical aspect of the auction system.

## Validators

$\pi_{\text {stake }}(0):$ Initial asset distribution $R_t$ : Staking block reward at block height
$t$ $S\left(i, \pi_{\text {stake }}\right):$ Slash that validator $i$ receives if the staking
distribution is $\pi_{\text {stake }}$

#### C, _Maximum Block Size_

let C denote the maximum size of a block (C is for “capacity”)

#### Gas Price

A gas price is usually measured in Gwei and 1 Gwei =10−9 ETH.

The correct measure is Wei =10-18 ETH.

## Block Proposer Call Market Auction Specification

This section serves as a technical blueprint for the proposed auction contract, detailing its
properties, functions, events, storage, invariants, and testing procedures.

## Accounting

Discusses the financial aspects of the auction system, including various proposals for managing
remunerations for validators and builders. It also introduces a bid adjustment feature for the
auction system.

## Discussion Market Designs

This extensive section delves into the design considerations, updates, and trade-offs in the auction
market. It covers the structure of both the primary and beta markets, along with the initial version
of the MEV Protocol and auction accounting details.

## Static Sealed Bid Auctions

An analytical discussion on different auction formats, particularly focusing on uniform price and
discriminatory price auctions. It proposes an augmented uniform price auction to mitigate
underpricing and details the discriminatory price auction format.

## Terms

-         | **value**        | **description**                                                                                                                 | **** |
  |------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------|------|
  | `blockhash` | uint blockNumber | returns (bytes32): **hash** of the given block when `blocknumber` is one of the 256 most recent blocks; otherwise returns zero | |
  | `block.basefee ` | uint | current block’s base fee (EIP-3198 and EIP-1559) | |
  | `block.chainid ` | uint | current chain id | |
  | `block.coinbase` | address payable | current block miner’s address | |
  | `block.difficulty` | uint | current block difficulty | |
  | `block.gaslimit` | uint | current block `gaslimit` | |
