# SettlementHouse
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/SettlementHouse.sol)

*A contract for managing bundles of transactions for a futures token.*


## State Variables
### futuresToken

```solidity
IERC6909 public immutable futuresToken;
```


### bundleCounter

```solidity
mapping(uint256 => uint256) internal bundleCounter;
```


### bundles

```solidity
mapping(uint256 => mapping(uint256 => Bundle)) internal bundles;
```


## Functions
### constructor

*Constructor to initialize the contract with the futures token contract address.*


```solidity
constructor(IERC6909 _futuresToken);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_futuresToken`|`IERC6909`|Address of the futures token contract.|


### submitBundle


```solidity
function submitBundle(uint256 slot, uint256 amountOfGas, bytes32[] calldata bundleHashes) external;
```

### queryBundles


```solidity
function queryBundles(uint256 slot) external view returns (Bundle[] memory slotBundles);
```

## Events
### BundleSubmitted

```solidity
event BundleSubmitted(address indexed sender, uint256 indexed slot, uint256 indexed index, uint256 amountOfGas);
```

## Errors
### Unauthorized

```solidity
error Unauthorized();
```

## Structs
### Bundle

```solidity
struct Bundle {
    address submitter;
    uint256 amountOfGas;
    bytes32[] bundleHashes;
}
```

