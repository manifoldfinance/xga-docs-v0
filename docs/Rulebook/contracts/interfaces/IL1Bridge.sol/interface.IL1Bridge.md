# IL1Bridge
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/interfaces/IL1Bridge.sol)


## Functions
### depositETHTo

Deposits some amount of ETH into a target account on L2.
Note that if ETH is sent to a contract on L2 and the call fails, then that ETH will
be locked in the L2StandardBridge. ETH may be recoverable if the call can be
successfully replayed by increasing the amount of gas supplied to the call. If the
call will fail for any amount of gas, then the ETH will be locked permanently.


```solidity
function depositETHTo(address _to, uint32 _minGasLimit, bytes calldata _extraData) external payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_to`|`address`|         Address of the recipient on L2.|
|`_minGasLimit`|`uint32`|Minimum gas limit for the deposit message on L2.|
|`_extraData`|`bytes`|  Optional data to forward to L2. Data supplied here will not be used to execute any code on L2 and is only emitted as extra data for the convenience of off-chain tooling.|


