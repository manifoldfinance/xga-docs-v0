---
title: Preface
description: The Gang Designs the Ultimate MEV Auction
---

## Enhanced Auction Dynamics

### Introducing Elastic Supply Schedule and Novel Tie-Breaking

In the realm of auctions, the traditional uniform price format has been a mainstay. However, we're on the cusp of an exciting evolution, introducing two groundbreaking features that promise to transform the auction landscape:

**Elastic Supply Schedule**: Breaking away from the rigidness of a fixed supply, we're introducing elasticity. When prices dip low, we'll strategically limit the availability of options. This dynamic approach ensures a balance between supply and demand, maintaining value and interest.

**Revamped Tie-Breaking Rule**: In the world of auctions, ties are inevitable. But our approach is different. We're moving away from the conventional method that prioritizes higher marginal bids. Instead, we're implementing a novel rule that intensifies competition, particularly for those crucial marginal quantities.

## Why These Changes Matter

### Shortcomings of the standard uniform price auction

Traditionally, with a fixed supply, there's a looming risk of plummeting prices. This phenomenon, identified by Wilson in 1979, highlights a bidder's tendency to underbid. In multi-unit auctions, this is a critical challenge. In a uniform price auction, underbidding on the marginal unit doesn't just lower the price for that unit; it slashes the overall price you pay.

The real danger of severe under-pricing hinges on demand factors, which are often unpredictable and not easily deduced from existing data. The debate over whether discriminatory or uniform price auctions yield higher revenue remains unresolved, both theoretically (as discussed by *Ausubel* et al.  2011) and empirically.

### Tie Breaking Rule

The traditional tie-breaking rule, which prioritizes higher marginal bids, is inherently flawed. It doesn't account for the strategic value of the marginal unit. This is particularly problematic in multi-unit auctions, where the marginal unit is often the most valuable. The current rule fails to capture the true value of the marginal unit, leading to suboptimal outcomes. This is due to the discrete nature of bids, it can happen that there is market-clearing price (where demand=supply). The typical rule applied in many auctions favors high marginal bids first. We will consider an alternative that introduces more pressure at the quantity at the margin.

#### Elastic Supply Curve Details
Maximum capacity is fixed, but the supply curve 

$$
S:P→Q
$$

varies with price, offering different quantities of options.
The supply function is designed to be initially concave, then constant at maximum capacity.
This approach, theoretically supported by Licalzi (2005), aims to mitigate dramatic underpricing.