# GraphQL URL Access Token Design

## Goal

Allow an unauthenticated Web request to authenticate its GraphQL calls with an `accessToken` URL parameter.

## Scope

- Change only `projects/webapp/src/utils/request.ts`.
- Read `accessToken` from the current browser URL for each `requestGql()` call.
- When the value is non-empty, POST to `/nky/service/graphql?accessToken=<encoded-token>`.
- When absent, retain the existing `/nky/service/graphql` request exactly.

## Data flow

`URL accessToken` -> `requestGql()` -> `/nky/service/graphql?accessToken=...` -> existing POST body and response handling.

The token is encoded before being appended. No token is added to non-GraphQL requests, and existing cookie-authenticated requests retain their behavior.

## Verification

Add a focused request helper test that proves token forwarding and the no-token fallback, then run it together with `git diff --check`.
