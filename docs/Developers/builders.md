---
title: Builder overview
description: Block Builder related information.
---

## Block Properties

Builders need the following data:

| Field          | Where it comes from                     | Notes                                            |
| -------------- | --------------------------------------- | ------------------------------------------------ |
| `feeRecipient` | validator (`builder_registerValidator`) |                                                  |
| `gasLimit`     | validator (`builder_registerValidator`) |                                                  |
| `timestamp`    | relay (BN)                              | value for the timestamp field of the new payload |
| `prevRandao`   | relay (BN)                              | from previous slot                               |
| `extraData`    | builder                                 | graffiti from builder, not proposer              |
