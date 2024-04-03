---
title: Relay
---

## Comparision

| **Name**                           | **MEV Auction Platform ** | **Paradigm Merkle.io**                              | **Kolibrio** | **BloXroute** | **MEV-Blocker** | **MEV-Share** |
| ---------------------------------- | ------------------------- | --------------------------------------------------- | ------------ | ------------- | --------------- | ------------- |
| Revenue                            |                           | 90% of MEV,guaranteed at least$0.02 per transaction | 90% of MEV   | 90% of MEV    | $0              | $0            |
| Future Inclusion                   | ✔︎                       | ✕                                                   |              |               |                 |               |
| MEV Boost Compatible               | ✔︎                       | ✔︎                                                 |              |               |                 |               |
| New Trust Assumptions              |                           | ✔︎                                                 | ✔︎          | ✔︎           | ✔︎             | ✔︎           |
| Exclude Reverting Transactions     |                           | ✔︎                                                 |              |               |                 |               |
| Multi Block Support                |                           | ✔︎                                                 |              |               |                 |               |
| Latency based                      | ✕                         | ✔︎                                                 |              |               |                 |               |
| Requires RPC Connection            | ✕                         | ✔︎                                                 | ✔︎          | ✔︎           | ✔︎             | ✔︎           |
| Requires Block Builder integration | ✕                         | ✔︎                                                 |              |               |                 |               |
| Dashboard                          |                           | theta                                               | ox           | ox            | ox              | ox            |
| Compliant                          |                           | theta                                               | ox           | ox            | ox              | ox            |
| Programmable privacy               |                           | Theta                                               | ox           | ox            | ox              | Theta         |
| Status API                         |                           | theta                                               | ox           | ox            | ox              | theta         |
| Advanced API                       |                           | Theta                                               | ox           |               |                 | ox            |
| Dedicated RPC                      |                           | theta                                               |              |               | Theta           | theta         |
| Fast inclusion                     |                           | theta                                               | ox           | Theta         | Theta           |               |
| MEV Protection                     |                           | theta                                               | Theta        | Theta         | Theta           | theta         |
| Chains                             |                           |                                                     |              |               |                 |               |
| Ethereum                           |                           | Theta                                               | Theta        | Theta         | Theta           | Theta         |
| Polygon                            | ✕                         | theta                                               | Theta        | Theta         | ox              | ox            |
| Binance Smart Chain                | ✕                         | ( )                                                 | Theta        | Theta         | ox              | ox            |
| Total                              |                           |                                                     |              |               |                 |               |

## Strategies

## Latency Based

Latency strategies within relay operations carry significant implications for relay competitiveness. The practical upshot is that some relays can only consistently compete through an artificial delay. An extreme case of this would be a relay which is technically consistently non-competitive, but captures exclusive order flow – in this case, a rational node operator will always query it with an artificial latency parameter.

This competition among relays hints at a potential shift in the game, where relays might strategically delay responses to enhance their chances of providing the best bid. This adaptation could be likely incentivized by the benefits of optimized delay, particularly for vertically-integrated builders who may be inclined to pay a premium for more reliable bid inclusion.
