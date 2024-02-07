---
title: Registry
---

## dmap Validator Registry

The main thing about dmap is that it has a native concept of immutability, while still allowing
user-defined registry logic.

`dpath` is a path format used for traversing the dmap registries. This path format also has a
concept of 'verify immutable', and the syntax is design to be discerned easily at a glance.

```
:pack:rico.latest
          ^  warning, the value of this path is mutable, starting here

:pack:rico:v2
          ^  here you can see it is locked
```

One of the core design motives for dmap was to make it as simple as possible to write lightweight /
embeddable state proof verifiers.

By keeping all state in one contract object and making user registries call into this one object,
merkle proofs for traversals of subregistries are compact and do not require spinning up an EVM.

Write your own `dmap` client that talks directly to your ETH node.

- - Make sure your client verifies state trie proofs.
- Remove dependency on DNS for resolution and SSL for authentication
