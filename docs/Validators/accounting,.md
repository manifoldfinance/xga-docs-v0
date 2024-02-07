---
title: Accounting and Rewards
---

This section addresses the financial aspects, particularly focusing on remunerations for validators
and builders. It includes:

- Notices and Proposals: Proposes different accounting regimes and details their advantages and
  disadvantages.

- Validators and Builders Accounting: Discusses payment schemes and revenue distribution among
  validators and builders.

- Bid Adjustment: Explains a new feature for adjusting bids in the auction system. The accounting
  section is critical for understanding how financial transactions and distributions are managed
  within the auction system.

## Proposer Payments Value (PPV)

The `feeReceipent` address is configured in the consensus layer client and is provided by the NO at
the time of the block proposal. Because the eth1 address that is provided for the feeReceipent is
under the complete control of the NO, there is an opportunity for a NO to steal all the PPV for
themselves.
