# Owned
[Git Source](https://github.com/manifoldfinance/auctioneer/blob/94186b27ea5ddae3ff2f27674c7d42c6d498df0f/src/auth/solady.auth.sol)

**Author:**
Solmate (https://github.com/transmissions11/solmate/blob/main/src/auth/Owned.sol)

Simple single owner authorization mixin.


## State Variables
### owner

```solidity
address public owner;
```


## Functions
### onlyOwner


```solidity
modifier onlyOwner() virtual;
```

### constructor


```solidity
constructor(address _owner);
```

### transferOwnership


```solidity
function transferOwnership(address newOwner) public virtual onlyOwner;
```

## Events
### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed user, address indexed newOwner);
```

