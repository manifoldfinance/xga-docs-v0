# L1Holding

[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/L1Holding.sol)

**Inherits:**
[Ownable2Step](/src/auth/Ownable2Step.sol/abstract.Ownable2Step.md)

**Author:** MEV Protocol

_Pays out L1 builder payments to L2 Accountant_

## State Variables

### minGasLimit

min gas limit for L2 bridge tx

```solidity
uint32 public minGasLimit = 200_000;
```

### accountant

L2 accountant

```solidity
address public accountant;
```

### bridge

L1 => L2 bridge

```solidity
IL1Bridge public bridge;
```

## Functions

### constructor

_Initializes the L1Holding contract._

```solidity
constructor(address _accountant, address _bridge) Ownable2Step(msg.sender);
```

**Parameters**

| Name          | Type      | Description                        |
| ------------- | --------- | ---------------------------------- |
| `_accountant` | `address` | Address of the protocol treasury.  |
| `_bridge`     | `address` | Address of the L2 bridge contract. |

### receive

_Fallback function to receive Ether._

```solidity
receive() external payable;
```

### payAccounatnt

_Pays accountant._

```solidity
function payAccounatnt() external;
```

### updateAccountant

_Updates the L2 accountant address._

```solidity
function updateAccountant(address _accountant) external onlyOwner;
```

**Parameters**

| Name          | Type      | Description                      |
| ------------- | --------- | -------------------------------- |
| `_accountant` | `address` | New address of the L2 accountant |

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

## Events

### PaymentReceived

```solidity
event PaymentReceived(address indexed sender, uint256 amount);
```

### PaymentSent

```solidity
event PaymentSent(address indexed recipient, uint256 amount);
```
