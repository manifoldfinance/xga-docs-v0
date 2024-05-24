# Accountant

[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/Accountant.sol)

**Inherits:**
[Ownable2Step](/src/auth/Ownable2Step.sol/abstract.Ownable2Step.md)

**Author:** MEV Protocol

_Pays out validators, protocol fees and L2 infrastructure from auction and
coinbase revenue_

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

_Initializes the Accountant contract._

```solidity
constructor(address _bridge, address _weth, uint256 _minPayout) Ownable2Step(msg.sender);
```

**Parameters**

| Name         | Type      | Description                        |
| ------------ | --------- | ---------------------------------- |
| `_bridge`    | `address` | Address of the L2 bridge contract. |
| `_weth`      | `address` | Address of the WETH contract.      |
| `_minPayout` | `uint256` |                                    |

### receive

_Fallback function to receive Ether._

```solidity
receive() external payable;
```

### onlyAuctioneer

_Modifier to only allow Auctioneer contract as caller_

```solidity
modifier onlyAuctioneer();
```

### getValidatorList

_Get validator list_

```solidity
function getValidatorList() external view returns (address[] memory validators);
```

**Returns**

| Name         | Type        | Description |
| ------------ | ----------- | ----------- |
| `validators` | `address[]` | list        |

### getTotalPayout

_Get total payouts_

```solidity
function getTotalPayout() external view returns (uint256 total);
```

**Returns**

| Name    | Type      | Description   |
| ------- | --------- | ------------- |
| `total` | `uint256` | payout amount |

### getPayoutBalance

_gets current aggregated balance for validator payouts_

```solidity
function getPayoutBalance() external view returns (uint256 payoutBalance);
```

### payout

_Distributes funds to various addresses based on predefined shares._

```solidity
function payout() external onlyAuctioneer;
```

### updateBridge

_Updates the address of the L2 bridge contract._

```solidity
function updateBridge(address _bridge) external onlyOwner;
```

**Parameters**

| Name      | Type      | Description                            |
| --------- | --------- | -------------------------------------- |
| `_bridge` | `address` | New address of the L2 bridge contract. |

### updateMinGasLimit

_Updates the minimum gas limit for L2 bridge transactions._

```solidity
function updateMinGasLimit(uint32 _minGasLimit) external onlyOwner;
```

**Parameters**

| Name           | Type     | Description            |
| -------------- | -------- | ---------------------- |
| `_minGasLimit` | `uint32` | New minimum gas limit. |

### updateMinPayout

_Updates the minimum threshold balance for L1 validator payouts._

```solidity
function updateMinPayout(uint256 _minPayout) external onlyOwner;
```

**Parameters**

| Name         | Type      | Description                   |
| ------------ | --------- | ----------------------------- |
| `_minPayout` | `uint256` | New minimum payout threshold. |

### registerValidator

_Registers a validator._

```solidity
function registerValidator(address validator, uint256 numValidators) public onlyOwner;
```

**Parameters**

| Name            | Type      | Description                                        |
| --------------- | --------- | -------------------------------------------------- |
| `validator`     | `address` | Address of the validator to register.              |
| `numValidators` | `uint256` | Number of validators registered for above address. |

### updateNumValidators

_Updates a number of registered a validators._

```solidity
function updateNumValidators(address validator, uint256 numValidators) external onlyOwner;
```

**Parameters**

| Name            | Type      | Description                                        |
| --------------- | --------- | -------------------------------------------------- |
| `validator`     | `address` | Address of the validator.                          |
| `numValidators` | `uint256` | Number of validators registered for above address. |

### unregisterValidator

_Unregisters a validator._

```solidity
function unregisterValidator(address validator) public onlyOwner;
```

**Parameters**

| Name        | Type      | Description                             |
| ----------- | --------- | --------------------------------------- |
| `validator` | `address` | Address of the validator to unregister. |

### registerBatchValidators

_Registers a batch of validators._

```solidity
function registerBatchValidators(address[] calldata validators, uint256[] calldata numValidators) external onlyOwner;
```

**Parameters**

| Name            | Type        | Description                                             |
| --------------- | ----------- | ------------------------------------------------------- |
| `validators`    | `address[]` | Address list of the validators to register.             |
| `numValidators` | `uint256[]` | Number of validators registered for each above address. |

### unregisterBatchValidators

_Unregisters a batch of validators._

```solidity
function unregisterBatchValidators(address[] calldata validators) external onlyOwner;
```

**Parameters**

| Name         | Type        | Description                                   |
| ------------ | ----------- | --------------------------------------------- |
| `validators` | `address[]` | Address list of the validators to unregister. |

### updateAuctioneer

_Updates auctioneer address_

```solidity
function updateAuctioneer(address _auctioneer) external onlyOwner;
```

**Parameters**

| Name          | Type      | Description                    |
| ------------- | --------- | ------------------------------ |
| `_auctioneer` | `address` | address of Auctioneer contract |

### removeValidatorFromArray

_Removes a validator address from the activeValidators array._

```solidity
function removeValidatorFromArray(address validator) internal;
```

**Parameters**

| Name        | Type      | Description                         |
| ----------- | --------- | ----------------------------------- |
| `validator` | `address` | Address of the validator to remove. |

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
