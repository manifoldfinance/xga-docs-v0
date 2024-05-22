# Accountant
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/Accountant.sol)

**Inherits:**
[Ownable2Step](/src/auth/Ownable2Step.sol/abstract.Ownable2Step.md)

**Author:**
MEV Protocol

*Pays out validators, protocol fees and L2 infrastructure from auction and coinbase revenue*


## State Variables
### minGasLimit
min gas limit for L2 bridge tx


```solidity
uint32 public minGasLimit = 200_000;
```


### bridge
L2 => L1 bridge


```solidity
IL2Bridge public bridge;
```


### weth
L2 Weth


```solidity
WETH public immutable weth;
```


### auctioneer

```solidity
address public auctioneer;
```


### LEGACY_ERC20_ETH
Address of the LegacyERC20ETH predeploy


```solidity
address internal constant LEGACY_ERC20_ETH = 0xDeadDeAddeAddEAddeadDEaDDEAdDeaDDeAD0000;
```


### adminFeePerTenThousand
per 10,000 of revenue to allocate for protocol


```solidity
uint256 public constant adminFeePerTenThousand = 1;
```


### isValidatorRegistered
registered validator payout addresses


```solidity
mapping(address => bool) public isValidatorRegistered;
```


### activeValidators
List of active validators


```solidity
mapping(uint256 => address) public activeValidators;
```


### numValidatorsRegistered
number of validators registered to reward address


```solidity
mapping(address => uint256) public numValidatorsRegistered;
```


### validatorCount
Number of active validator reward addresses


```solidity
uint256 public validatorCount;
```


### totalValidatorCount
Cumulative total of registered validators


```solidity
uint256 public totalValidatorCount;
```


### payoutRecord

```solidity
mapping(address validator => uint256 cumulativeAmount) public payoutRecord;
```


### minPayout
threshold payout amount to make make L1 fees worthwhile


```solidity
uint256 public minPayout;
```


## Functions
### constructor

*Initializes the Accountant contract.*


```solidity
constructor(address _bridge, address _weth, uint256 _minPayout) Ownable2Step(msg.sender);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bridge`|`address`|Address of the L2 bridge contract.|
|`_weth`|`address`|Address of the WETH contract.|
|`_minPayout`|`uint256`||


### receive

*Fallback function to receive Ether.*


```solidity
receive() external payable;
```

### onlyAuctioneer

*Modifier to only allow Auctioneer contract as caller*


```solidity
modifier onlyAuctioneer();
```

### getValidatorList

*Get validator list*


```solidity
function getValidatorList() external view returns (address[] memory validators);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`validators`|`address[]`|list|


### getTotalPayout

*Get total payouts*


```solidity
function getTotalPayout() external view returns (uint256 total);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`total`|`uint256`|payout amount|


### getPayoutBalance

*gets current aggregated balance for validator payouts*


```solidity
function getPayoutBalance() external view returns (uint256 payoutBalance);
```

### payout

*Distributes funds to various addresses based on predefined shares.*


```solidity
function payout() external onlyAuctioneer;
```

### updateBridge

*Updates the address of the L2 bridge contract.*


```solidity
function updateBridge(address _bridge) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_bridge`|`address`|New address of the L2 bridge contract.|


### updateMinGasLimit

*Updates the minimum gas limit for L2 bridge transactions.*


```solidity
function updateMinGasLimit(uint32 _minGasLimit) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_minGasLimit`|`uint32`|New minimum gas limit.|


### updateMinPayout

*Updates the minimum threshold balance for L1 validator payouts.*


```solidity
function updateMinPayout(uint256 _minPayout) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_minPayout`|`uint256`|New minimum payout threshold.|


### registerValidator

*Registers a validator.*


```solidity
function registerValidator(address validator, uint256 numValidators) public onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validator`|`address`|Address of the validator to register.|
|`numValidators`|`uint256`|Number of validators registered for above address.|


### updateNumValidators

*Updates a number of registered a validators.*


```solidity
function updateNumValidators(address validator, uint256 numValidators) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validator`|`address`|Address of the validator.|
|`numValidators`|`uint256`|Number of validators registered for above address.|


### unregisterValidator

*Unregisters a validator.*


```solidity
function unregisterValidator(address validator) public onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validator`|`address`|Address of the validator to unregister.|


### registerBatchValidators

*Registers a batch of validators.*


```solidity
function registerBatchValidators(address[] calldata validators, uint256[] calldata numValidators) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validators`|`address[]`|Address list of the validators to register.|
|`numValidators`|`uint256[]`|Number of validators registered for each above address.|


### unregisterBatchValidators

*Unregisters a batch of validators.*


```solidity
function unregisterBatchValidators(address[] calldata validators) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validators`|`address[]`|Address list of the validators to unregister.|


### updateAuctioneer

*Updates auctioneer address*


```solidity
function updateAuctioneer(address _auctioneer) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_auctioneer`|`address`|address of Auctioneer contract|


### removeValidatorFromArray

*Removes a validator address from the activeValidators array.*


```solidity
function removeValidatorFromArray(address validator) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`validator`|`address`|Address of the validator to remove.|


## Events
### PaymentReceived

```solidity
event PaymentReceived(address indexed sender, uint256 amount);
```

### PaymentSplit

```solidity
event PaymentSplit(address indexed sender, uint256 adminFee, uint256 validatorsShare);
```

### AuctioneerUpdated

```solidity
event AuctioneerUpdated(address indexed _auctioneer);
```

## Errors
### ThresholdBalanceNotMet

```solidity
error ThresholdBalanceNotMet();
```

