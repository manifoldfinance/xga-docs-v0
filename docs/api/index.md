---
title: API Reference
---

API paths to resources are generally broken into multiple segments,

`{scheme}://{host}/{version}/{category}/[{pathSegment}][?{query}]`:

- `version`: can be v1.0 or beta.
- `category`: is a logical grouping of APIs into top-level categories.
- `pathSegment`: is one or many navigation segments that can address an entity, collection of entities, property, or operation available for an entity.
- `query`: string must follow the OData standard for query representations

## Beta Block

Beta Block API

## MEV Relay

MEV Boost Relay backwards compatible Relay API

## Bundle Submission

Submitting Bundles using Fowards API

## Signature Scheme

Auth. Request Scheme for accessing JSON-RPC Methods

## API Rate Limiting

If you receive a rate limit error, you should stop making requests temporarily according to these guidelines:

- If the `retry-after` response header is present, you should not retry your request until after that many seconds has elapsed.
- If the `x-ratelimit-remaining` header is `0`, you should not make another request until after the time specified by the `x-ratelimit-reset` header. The `x-ratelimit-reset` header is in UTC epoch seconds.
- Otherwise, wait for at least one minute before retrying. If your request continues to fail due to a secondary rate limit, wait for an exponentially increasing amount of time between retries, and throw an error after a specific number of retries.

## Checking the status of your rate limit

You can use the headers that are sent with each response to determine the current status of your primary rate limit.

| Header name             | Description                                                                  |
| ----------------------- | ---------------------------------------------------------------------------- |
| `x-ratelimit-limit`     | The maximum number of requests that you can make per hour                    |
| `x-ratelimit-remaining` | The number of requests remaining in the current rate limit window            |
| `x-ratelimit-used`      | The number of requests you have made in the current rate limit window        |
| `x-ratelimit-reset`     | The time at which the current rate limit window resets, in UTC epoch seconds |
| `x-ratelimit-resource`  | The rate limit resource that the request counted against.                    |

You can also call the `GET /rate_limit` endpoint to check your rate limit. Calling this endpoint does not count against your primary rate limit, but it can count against your secondary rate limit. For more information, see "[REST API endpoints for rate limits](https://docs.github.com/en/rest/rate-limit/rate-limit)." When possible, you should use the rate limit response headers instead of calling the API to check your rate limit.

There is not a way to check the status of your secondary rate limit.

## [Exceeding the rate limit](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api?apiVersion=2022-11-28#exceeding-the-rate-limit)

If you exceed your primary rate limit, you will receive a `403` or `429` response, and the `x-ratelimit-remaining` header will be `0`. You should not retry your request until after the time specified by the `x-ratelimit-reset` header.

If you exceed a secondary rate limit, you will receive a `403` or `429` response and an error message that indicates that you exceeded a secondary rate limit. If the `retry-after` response header is present, you should not retry your request until after that many seconds has elapsed. If the `x-ratelimit-remaining` header is `0`, you should not retry your request until after the time, in UTC epoch seconds, specified by the `x-ratelimit-reset` header. Otherwise, wait for at least one minute before retrying. If your request continues to fail due to a secondary rate limit, wait for an exponentially increasing amount of time between retries, and throw an error after a specific number of retries.

Continuing to make requests while you are rate limited may result in the banning of you, your family, and possibly your entire country.
