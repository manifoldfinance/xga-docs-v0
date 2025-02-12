# IERC6909
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/interfaces/IERC6909.sol)

**Author:**
jtriley.eth


## Functions
### balanceOf

Owner balance of an id.


```solidity
function balanceOf(address owner, uint256 id) external view returns (uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The address of the owner.|
|`id`|`uint256`|The id of the token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`|The balance of the token.|


### allowance

Spender allowance of an id.


```solidity
function allowance(address owner, address spender, uint256 id) external view returns (uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The address of the owner.|
|`spender`|`address`|The address of the spender.|
|`id`|`uint256`|The id of the token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`|The allowance of the token.|


### isOperator

Checks if a spender is approved by an owner as an operator


```solidity
function isOperator(address owner, address spender) external view returns (bool approved);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The address of the owner.|
|`spender`|`address`|The address of the spender.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`approved`|`bool`|The approval status.|


### transfer

Transfers an amount of an id from the caller to a receiver.


```solidity
function transfer(address receiver, uint256 id, uint256 amount) external returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`receiver`|`address`|The address of the receiver.|
|`id`|`uint256`|The id of the token.|
|`amount`|`uint256`|The amount of the token.|


### transferFrom

Transfers an amount of an id from a sender to a receiver.


```solidity
function transferFrom(address sender, address receiver, uint256 id, uint256 amount) external returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sender`|`address`|The address of the sender.|
|`receiver`|`address`|The address of the receiver.|
|`id`|`uint256`|The id of the token.|
|`amount`|`uint256`|The amount of the token.|


### approve

Approves an amount of an id to a spender.


```solidity
function approve(address spender, uint256 id, uint256 amount) external returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`spender`|`address`|The address of the spender.|
|`id`|`uint256`|The id of the token.|
|`amount`|`uint256`|The amount of the token.|


### setOperator

Sets or removes a spender as an operator for the caller.


```solidity
function setOperator(address spender, bool approved) external returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`spender`|`address`|The address of the spender.|
|`approved`|`bool`|The approval status.|


## Events
### Transfer
The event emitted when a transfer occurs.


```solidity
event Transfer(address caller, address indexed sender, address indexed receiver, uint256 indexed id, uint256 amount);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`caller`|`address`|The caller of the transfer.|
|`sender`|`address`|The address of the sender.|
|`receiver`|`address`|The address of the receiver.|
|`id`|`uint256`|The id of the token.|
|`amount`|`uint256`|The amount of the token.|

### OperatorSet
The event emitted when an operator is set.


```solidity
event OperatorSet(address indexed owner, address indexed spender, bool approved);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The address of the owner.|
|`spender`|`address`|The address of the spender.|
|`approved`|`bool`|The approval status.|

### Approval
The event emitted when an approval occurs.


```solidity
event Approval(address indexed owner, address indexed spender, uint256 indexed id, uint256 amount);
```

**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`owner`|`address`|The address of the owner.|
|`spender`|`address`|The address of the spender.|
|`id`|`uint256`|The id of the token.|
|`amount`|`uint256`|The amount of the token.|

