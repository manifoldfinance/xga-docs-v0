---
title: Auctioneer Contract
description: Primary Auction Contract
---

The **Auctioneer Contract** is a Solidity smart contract that implements an auction mechanism for
selling block space. This contract allows bidders to participate in auctions, submit manual bids,
and settle the auctions. It supports multiple bidders, each with a unique ID.

## Key Features

- **Bidders:** Add and remove bidders dynamically.
- **Auctions:** Open and run auctions for selling block space.
- **Manual Bids:** Bidders can submit manual bids with specific quantities and prices.
- **Settlement:** After the auction, settle with successful bidders, transferring owed amounts.

It allows adding and removing bidders and operators. Bidders can place bids on auction slots. Operators can run the auctions.

The Auctioneer contract keeps track of:

A mapping of addresses to operator status
A mapping of addresses to bidder IDs
A mapping of bidder IDs to addresses
A mapping of auction slots to Auction structs
Internal mappings to store bid counts and actual bid values per auction

The Auction struct stores:

The number of items for sale
If the auction is open and settled
Mappings of bidders to their BidderInfo

The BidderInfo struct stores:

The number of items a bidder bought
The amount a bidder owes

It has functions like:

newBidder - Registers a new bidder address and assigns them an ID
removeBidder - Deletes a bidder by ID
addOperator - Grants operator status to an address
removeOperator - Revokes operator status from an address

The contract uses modifiers like onlyOwner and onlyOperator to restrict access.

The key data transformations are:

Mapping addresses to bidder IDs
Tracking auction state per slot
Storing bids received per auction
Tracking items bought and owed per bidder
This allows running decentralized auctions where bidders can securely place bids, operators can manage the auctions, and auction state is persisted on-chain.

## Contract Structure

- The contract is based on the ERC6909 standard.
- It uses the SafeTransferLib for safe WETH (Wrapped Ether) transfers.
- Bidders can participate through the `getBid` function.
- Manual bids are supported via the `bid` function.

## Events

- `BidderAdded` and `BidderRemoved` for dynamic management of bidders.
- `AuctionOpened` signals the start of a new auction.
- `ManualBidSubmitted` is emitted when a bidder submits a manual bid.
- `AuctionSettled` indicates the successful settlement of an auction.

## Errors

- Various error messages to handle exceptional cases, such as invalid bids or insufficient funds.

## Functions

- **newBidder:** Add a new bidder to the auction.
- **removeBidder:** Remove a bidder from the auction.
- **openAuction:** Open a new auction for a specific slot.
- **bid:** Submit a bid for a specific auction slot.
- **run:** Execute the auction for a specific slot, considering manual and contract bids.
- **settle:** Settle the auction by transferring owed amounts to successful bidders.
- **getBidderInfo:** Retrieve information about a bidder after auction settlement.
- **packBid:** Pack bid details into a uint256 for submission.
- **decodeBid:** Decode packed bid information for analysis.
- **checkBid:** Check the validity of a bid before execution.

## State Variables

### maxBidder

```solidity
uint8 public maxBidder;
```

### WETH9

```solidity
WETH public WETH9;
```

### IdMap

```solidity
mapping(address => uint8) public IdMap;
```

### bidderMap

```solidity
mapping(uint8 => address) public bidderMap;
```

### auctions

```solidity
mapping(uint256 => Auction) public auctions;
```

### bidCount

```solidity
mapping(uint256 => uint256) internal bidCount;
```

### bids

```solidity
mapping(uint256 => mapping(uint256 => uint256)) internal bids;
```

## Functions

### constructor

```solidity
constructor(WETH _weth) Owned(msg.sender);
```

### onlyAuctionOpen

```solidity
modifier onlyAuctionOpen(uint256 slot);
```

### newBidder

_Add a new bidder to the auction._

```solidity
function newBidder(address additionalBidder) external onlyOwner returns (uint8 newId);
```

**Parameters**

| Name               | Type      | Description                           |
| ------------------ | --------- | ------------------------------------- |
| `additionalBidder` | `address` | The address of the additional bidder. |

### removeBidder

_Remove a bidder from the auction._

```solidity
function removeBidder(uint8 bidderId) external onlyOwner;
```

**Parameters**

| Name       | Type    | Description                            |
| ---------- | ------- | -------------------------------------- |
| `bidderId` | `uint8` | The index of the bidder to be removed. |

### openAuction

_Open a new auction for a specific slot._

```solidity
function openAuction(uint256 slot, uint120 itemsForSale) external onlyOwner;
```

**Parameters**

| Name           | Type      | Description                                            |
| -------------- | --------- | ------------------------------------------------------ |
| `slot`         | `uint256` | The auction slot.                                      |
| `itemsForSale` | `uint120` | The number of items available for sale in the auction. |

### bid

_Bid function for bidders to submit manual bids._

```solidity
function bid(uint256 slot, uint256[] memory packedBids) external;
```

**Parameters**

| Name         | Type        | Description          |
| ------------ | ----------- | -------------------- |
| `slot`       | `uint256`   | The auction slot.    |
| `packedBids` | `uint256[]` | Array of packed bids |

### run

_Execute the auction for a specific slot._

```solidity
function run(uint256 slot) external onlyAuctionOpen(slot) onlyOwner;
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

### settle

_Settle the auction for a specific slot._

```solidity
function settle(uint256 slot) external onlyOwner;
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

### getBidderInfo

_Retrieve information about a bidder after auction settlement._

```solidity
function getBidderInfo(uint256 slot, address bidder) external view returns (uint120 itemsBought, uint128 amountOwed);
```

**Parameters**

| Name     | Type      | Description                                                  |
| -------- | --------- | ------------------------------------------------------------ |
| `slot`   | `uint256` | The slot identifier of the auction.                          |
| `bidder` | `address` | The address of the bidder for whom information is requested. |

**Returns**

| Name          | Type      | Description                                                                                                                                                                                                          |
| ------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `itemsBought` | `uint120` | The number of items bought by the bidder in the specified auction.                                                                                                                                                   |
| `amountOwed`  | `uint128` | The amount owed by the bidder for the items bought in the specified auction. Requirements: - The auction must have been settled. - The provided `bidder` address must be valid and have participated in the auction. |

### packBid

_Packed Bid details into a uint256 for submission._

```solidity
function packBid(uint256 bidPrice, uint256 itemsToBuy, uint256 bidderId) external pure returns (uint256 packedBid);
```

**Parameters**

| Name         | Type      | Description                  |
| ------------ | --------- | ---------------------------- |
| `bidPrice`   | `uint256` | Price per item.              |
| `itemsToBuy` | `uint256` | Items to buy in the auction. |
| `bidderId`   | `uint256` | Id for bidder                |

**Returns**

| Name        | Type      | Description            |
| ----------- | --------- | ---------------------- |
| `packedBid` | `uint256` | for auction submission |

### decodeBid

_Decode the packed bid information._

```solidity
function decodeBid(uint256 packedBid) internal pure returns (uint8 bidderId, uint120 itemsToBuy, uint128 bidPrice);
```

**Parameters**

| Name        | Type      | Description                 |
| ----------- | --------- | --------------------------- |
| `packedBid` | `uint256` | The packed bid information. |

**Returns**

| Name         | Type      | Description                                  |
| ------------ | --------- | -------------------------------------------- |
| `bidderId`   | `uint8`   | The bidder's ID.                             |
| `itemsToBuy` | `uint120` | The number of items the bidder wants to buy. |
| `bidPrice`   | `uint128` | The price per item in the bid.               |

### checkAndStoreBid

_Check the validity of a bid._

```solidity
function checkAndStoreBid(address bidder, uint256 slot, uint256 itemsForSale, uint256[] memory packedBids) internal;
```

**Parameters**

| Name           | Type        | Description                                                                                                                                                                                   |
| -------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bidder`       | `address`   | Address of bidder.                                                                                                                                                                            |
| `slot`         | `uint256`   | The auction slot.                                                                                                                                                                             |
| `itemsForSale` | `uint256`   | Total items for sale for the slot.                                                                                                                                                            |
| `packedBids`   | `uint256[]` | Array of packed bids Requirements: - The number of items in the bid must not exceed the available items for sale in the auction. - The bidder must have enough funds to cover the bid amount. |

### isContract

_checks codesize for contract existence_

```solidity
function isContract(address _addr) internal view returns (bool _isContract);
```

**Parameters**

| Name    | Type      | Description                  |
| ------- | --------- | ---------------------------- |
| `_addr` | `address` | address of contract to check |

## Events

### AuctionSettled

```solidity
event AuctionSettled(uint256 indexed slot);
```

### BidderAdded

```solidity
event BidderAdded(address indexed bidder, uint8 bidderId);
```

### BidderRemoved

```solidity
event BidderRemoved(address indexed bidder, uint8 bidderId);
```

### AuctionOpened

```solidity
event AuctionOpened(uint256 indexed slot, uint120 itemsForSale);
```

## Errors

### InvalidId

```solidity
error InvalidId();
```

### InvalidBidItems

```solidity
error InvalidBidItems();
```

### InsufficientFunds

```solidity
error InsufficientFunds();
```

### AuctionNotOpen

```solidity
error AuctionNotOpen(uint256 slot);
```

### AuctionNotClosed

```solidity
error AuctionNotClosed(uint256 slot);
```

### AuctionAlreadyOpen

```solidity
error AuctionAlreadyOpen(uint256 slot);
```

### AuctionAlreadySettled

```solidity
error AuctionAlreadySettled(uint256 slot);
```

### BidderNotRegistered

```solidity
error BidderNotRegistered(address bidder);
```

### BidderAlreadyExists

```solidity
error BidderAlreadyExists(address bidder);
```

## Structs

### Auction

```solidity
struct Auction {
    uint120 itemsForSale;
    bool isOpen;
    bool isSettled;
    mapping(address => BidderInfo) biddersInfo;
}
```

### BidderInfo

```solidity
struct BidderInfo {
    uint120 itemsBought;
    uint128 amountOwed;
}
```
