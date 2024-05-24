# Auctioneer

[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/Auctioneer.sol)

**Inherits:** ERC6909,
[Ownable2Step](/src/auth/Ownable2Step.sol/abstract.Ownable2Step.md)

_Implements an auction mechanism for selling block space._

## State Variables

### maxBidder

```solidity
uint8 public maxBidder;
```

### WETH9

```solidity
WETH public immutable WETH9;
```

### accountant

```solidity
address public accountant;
```

### maxBids

```solidity
uint256 public maxBids = 50;
```

### minGasAmount

```solidity
uint120 public minGasAmount = 20_000;
```

### operator

```solidity
address public operator;
```

### IdMap

```solidity
mapping(address bidder => uint8 id) public IdMap;
```

### bidderMap

```solidity
mapping(uint8 id => address bidder) public bidderMap;
```

### auctions

```solidity
mapping(uint256 slot => Auction) public auctions;
```

### slotsCount

```solidity
uint256 public slotsCount;
```

### slotsAuctioned

```solidity
mapping(uint256 index => uint256 slot) public slotsAuctioned;
```

### bidCount

```solidity
mapping(uint256 slot => uint256 count) public bidCount;
```

### bids

```solidity
mapping(uint256 slot => mapping(uint256 index => uint256 bid)) internal bids;
```

## Functions

### constructor

```solidity
constructor(WETH _weth, address _accountant) Ownable2Step(msg.sender);
```

### onlyOperator

```solidity
modifier onlyOperator();
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

### changeOperator

_Change operator of the auction._

```solidity
function changeOperator(address newOperator) external onlyOwner;
```

**Parameters**

| Name          | Type      | Description                     |
| ------------- | --------- | ------------------------------- |
| `newOperator` | `address` | The address of the new operator |

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

### runAndSettle

_Execute the auction for a specific slot._

```solidity
function runAndSettle(uint256 slot) public onlyOperator;
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

### payout

_Payout revenue from auction to validators_

```solidity
function payout(uint256 slot) external onlyOperator;
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

### refund

_Refund revenue from auction to bidders_

```solidity
function refund(uint256 slot) external onlyOperator;
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
function packBid(uint128 bidPrice, uint120 itemsToBuy, uint8 bidderId) external pure returns (uint256 packedBid);
```

**Parameters**

| Name         | Type      | Description                  |
| ------------ | --------- | ---------------------------- |
| `bidPrice`   | `uint128` | Price per item.              |
| `itemsToBuy` | `uint120` | Items to buy in the auction. |
| `bidderId`   | `uint8`   | Id for bidder                |

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

### calcAverageBid

_Calculate average bid price for the last n auctions_

```solidity
function calcAverageBid(uint256 numAuctions) external view returns (uint128 avBidPrice);
```

**Parameters**

| Name          | Type      | Description                       |
| ------------- | --------- | --------------------------------- |
| `numAuctions` | `uint256` | Number of auctions to average for |

**Returns**

| Name         | Type      | Description         |
| ------------ | --------- | ------------------- |
| `avBidPrice` | `uint128` | for last n auctions |

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

### updateAccountant

_update accountant address_

```solidity
function updateAccountant(address newAccountant) external onlyOwner;
```

### updateMaxBids

_update max num of bids per bidder_

```solidity
function updateMaxBids(uint256 newMaxBids) external onlyOwner;
```

### updateMinGasAmount

_update minGasAmount_

```solidity
function updateMinGasAmount(uint120 newAmount) external onlyOwner;
```

## Events

### OperatorUpdated

```solidity
event OperatorUpdated(address indexed oldOperator, address indexed newOperator);
```

### AuctionSettled

```solidity
event AuctionSettled(uint256 indexed slot);
```

### BidderAdded

```solidity
event BidderAdded(address indexed bidder, uint8 indexed bidderId);
```

### BidderRemoved

```solidity
event BidderRemoved(address indexed bidder, uint8 indexed bidderId);
```

### AuctionOpened

```solidity
event AuctionOpened(uint256 indexed slot, uint120 itemsForSale);
```

### AuctionPaidOut

```solidity
event AuctionPaidOut(uint256 indexed slot);
```

### AuctionRefund

```solidity
event AuctionRefund(uint256 indexed slot);
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

## Structs

### Auction

```solidity
struct Auction {
    uint120 itemsForSale;
    bool isOpen;
    bool isSettled;
    bool isPaidOut;
    bool isRefunded;
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
