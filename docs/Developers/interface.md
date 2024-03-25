---
title: Primary Market Interface
description: Primary Market Auction and Settlement contract interface
---

## Interface

[_See the ERC6909 Interface reference for additional information_](../Reference/erc6909.md)

### Functions

#### getBid

_Get the bid from a bidder for a specific slot and round._

```solidity
function getBid(uint256 slot) external view returns (uint256[] memory packedBids);
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

**Returns**

| Name         | Type        | Description                                                                                       |
| ------------ | ----------- | ------------------------------------------------------------------------------------------------- |
| `packedBids` | `uint256[]` | Array of bids (in a packed format). uint256(uint128(bidPrice),uint120(itemsToBuy),uint8(biderId)) |

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

### addOperator

_Add a new operator to the auction._

```solidity
function addOperator(address newOperator) external onlyOwner;
```

**Parameters**

| Name          | Type      | Description                     |
| ------------- | --------- | ------------------------------- |
| `newOperator` | `address` | The address of the new operator |

### removeOperator

_Remove an operator from the auction._

```solidity
function removeOperator(address oldOperator) external onlyOwner;
```

**Parameters**

| Name          | Type      | Description                        |
| ------------- | --------- | ---------------------------------- |
| `oldOperator` | `address` | Address of operator to be removed. |

### openAuction

_Open a new auction for a specific slot._

```solidity
function openAuction(uint256 slot, uint120 itemsForSale) external onlyOperator;
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
function run(uint256 slot) public onlyOperator;
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

### settle

_Settle the auction for a specific slot._

```solidity
function settle(uint256 slot, address recipient) public onlyOperator;
```

**Parameters**

| Name        | Type      | Description                                        |
| ----------- | --------- | -------------------------------------------------- |
| `slot`      | `uint256` | The auction slot.                                  |
| `recipient` | `address` | The address of the recipient of the settled funds. |

### runAndSettle

```solidity
function runAndSettle(uint256 slot, address recipient) external onlyOperator;
```

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
function checkAndStoreBid(
    bool revertInvalid,
    address bidder,
    uint256 slot,
    uint256 itemsForSale,
    uint256[] memory packedBids
) internal;
```

**Parameters**

| Name            | Type        | Description                                                                                                                                                                                   |
| --------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `revertInvalid` | `bool`      | true for manual bids causing reverts for invalid data                                                                                                                                         |
| `bidder`        | `address`   | Address of bidder.                                                                                                                                                                            |
| `slot`          | `uint256`   | The auction slot.                                                                                                                                                                             |
| `itemsForSale`  | `uint256`   | Total items for sale for the slot.                                                                                                                                                            |
| `packedBids`    | `uint256[]` | Array of packed bids Requirements: - The number of items in the bid must not exceed the available items for sale in the auction. - The bidder must have enough funds to cover the bid amount. |

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

## Events

### OperatorAdded

```solidity
event OperatorAdded(address newOperator);
```

### OperatorRemoved

```solidity
event OperatorRemoved(address oldOperator);
```

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

### Unauthorized

```solidity
error Unauthorized();
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
