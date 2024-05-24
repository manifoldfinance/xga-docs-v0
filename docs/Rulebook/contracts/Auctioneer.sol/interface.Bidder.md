# Bidder

[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/Auctioneer.sol)

## Functions

### getBid

_Get the bid from a bidder for a specific slot and round._

```solidity
function getBid(uint256 slot) external view returns (uint256[] memory packedBids);
```

**Parameters**

| Name   | Type      | Description       |
| ------ | --------- | ----------------- |
| `slot` | `uint256` | The auction slot. |

**Returns**

| Name         | Type        | Description                                                                                        |
| ------------ | ----------- | -------------------------------------------------------------------------------------------------- |
| `packedBids` | `uint256[]` | Array of bids (in a packed format). uint256(uint128(bidPrice),uint120(itemsToBuy),uint8(bidderId)) |
