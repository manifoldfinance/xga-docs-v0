# IL2Bridge

[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/interfaces/IL2Bridge.sol)

## Functions

### withdrawTo

Initiates a withdrawal from L2 to L1 to a target account on L1. Note that if ETH
is sent to a contract on L1 and the call fails, then that ETH will be locked in
the L1StandardBridge. ETH may be recoverable if the call can be successfully
replayed by increasing the amount of gas supplied to the call. If the call will
fail for any amount of gas, then the ETH will be locked permanently. This
function only works with OptimismMintableERC20 tokens or ether. Use the
`bridgeERC20To` function to bridge native L2 tokens to L1.

```solidity
function withdrawTo(address _l2Token, address _to, uint256 _amount, uint32 _minGasLimit, bytes calldata _extraData)
    external
    payable;
```

**Parameters**

| Name           | Type      | Description                                   |
| -------------- | --------- | --------------------------------------------- |
| `_l2Token`     | `address` | Address of the L2 token to withdraw.          |
| `_to`          | `address` | Recipient account on L1.                      |
| `_amount`      | `uint256` | Amount of the L2 token to withdraw.           |
| `_minGasLimit` | `uint32`  | Minimum gas limit to use for the transaction. |
| `_extraData`   | `bytes`   | Extra data attached to the withdrawal.        |
