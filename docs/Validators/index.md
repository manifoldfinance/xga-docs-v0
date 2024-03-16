---
title: Validators
---

## Validator Registration

https://api-docs.rated.network/rated-api/api-reference/ethereum/self-report

You can self report on Ethereum Mainnet, Goerli and Holesky.
Do not pass your operator name as pool name. If you're not getting delegations via a pool or pool share, please leave the "poolTag" empty.
Each request has a strict limit of 1,000 validator public keys. Please submit multiple requests if you need to report more than 1,000 validators.
We cannot assign a key to your entity if it has already been reported by another operator. In case of false attribution, please contact us at hello@rated.network, and we will address the issue.
As this API is self-reported, it relies on the honest behaviour of all participants reporting their validators. Any instances of misconduct may lead to the exclusion of the entity from our platform.
It typically takes about 24 hours for the reported keys to appear on rated.network/explorer. Please note that your keys need to be activated (ie not in the activation queue) for them to show up on the Explorer.

## Validator reporting
