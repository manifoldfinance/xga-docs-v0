# Ownable2Step
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/auth/Ownable2Step.sol)

**Inherits:**
[Owned](/src/auth/solady.auth.sol/abstract.Owned.md)

*An abstract contract that extends the Owned contract and provides a two-step ownership
transfer mechanism.
The contract allows the current owner to initiate a transfer of ownership to a new account. The
new owner must then
explicitly accept the ownership transfer to complete the process.
This contract emits an `OwnershipTransferStarted` event when the ownership transfer is initiated,
and an
`OwnershipTransferred` event when the transfer is completed.*


## State Variables
### pendingOwner

```solidity
address public pendingOwner;
```


## Functions
### constructor


```solidity
constructor(address _owner) Owned(_owner);
```

### onlyPendingOwner


```solidity
modifier onlyPendingOwner() virtual;
```

### transferOwnership

*Starts the ownership transfer of the contract to a new account. Replaces the pending
transfer if there is one.
Can only be called by the current owner.*


```solidity
function transferOwnership(address newOwner) public virtual override onlyOwner;
```

### _transferOwnership

*Transfers ownership of the contract to a new account (`newOwner`) and deletes any pending
owner.
Internal function without access restriction.*


```solidity
function _transferOwnership(address newOwner) internal virtual;
```

### acceptOwnership

*The new owner accepts the ownership transfer.*


```solidity
function acceptOwnership() public virtual onlyPendingOwner;
```

## Events
### OwnershipTransferStarted

```solidity
event OwnershipTransferStarted(address indexed previousOwner, address indexed newOwner);
```

