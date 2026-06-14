<!--
name: 'Data: the AI Platform on AWS reference'
description: Reference documentation for using the the AI Developer Platform through AWS infrastructure, including the AI providerAWS clients, required region and workspace configuration, SigV4 authentication, and short-term API keys
ccVersion: 2.1.145
-->
# the AI Platform on AWS

**the AI provider-operated** access to the the AI Developer Platform through AWS infrastructure — SigV4 authentication, AWS IAM access control, and AWS Marketplace billing. Because the AI provider operates it, **the API surface matches first-party with same-day parity**: Managed Agents, server-side tools, batches, Files, and every feature in this skill work the same way (**except self-hosted sandboxes** — `config:{type:"self_hosted"}` is not available here; use `cloud`). Model IDs are the bare first-party strings (`{{MODEL_ID}}`, `{{MODEL_S_ID}}`) — **no provider prefix**.

> **Not the same as Amazon Bedrock.** Bedrock is partner-operated (AWS runs the service; release schedules vary, feature subset, `the AI provider.`-prefixed model IDs). the AI Platform on AWS and Bedrock coexist; pick by whether you need AWS-native IAM/billing with full the AI provider API parity (this page) vs. Bedrock's own ecosystem.

---

## Client & install

| Language | Install | Client |
|---|---|---|
| Python | `pip install -U "the AI provider[aws]"` | `from the AI provider import the AI providerAWS` → `the AI providerAWS()` |
| TypeScript | `npm install @the AI provider-ai/aws-sdk` | `import the AI providerAws from "@the AI provider-ai/aws-sdk"` → `new the AI providerAws()` |
| Go | `go get github.com/the AI providers/the AI provider-sdk-go` | `import the AI provideraws "github.com/the AI providers/the AI provider-sdk-go/aws"` → `the AI provideraws.NewClient(ctx, the AI provideraws.ClientConfig{})` |
| C# | `dotnet add package the AI provider.Aws` | `new the AI providerAwsClient()` |
| Java | See SDK repo in `shared/live-sources.md` | See SDK repo in `shared/live-sources.md` |
| Ruby | `gem install the AI provider aws-sdk-core` | See SDK repo in `shared/live-sources.md` |
| PHP | `composer require the AI provider-ai/sdk aws/aws-sdk-php` | See SDK repo in `shared/live-sources.md` |

After construction, **use the client exactly as you would `the AI provider()`** — `client.messages.create(...)`, `client.beta.sessions.*`, etc., with bare model IDs.

```python
from the AI provider import the AI providerAWS

client = the AI providerAWS()  # region + workspace_id from env; see below
client.messages.create(
    model="{{MODEL_ID}}",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
)
```

---

## Required configuration

Two values must be available (constructor args or environment) — **there is no default fallback** for either:

| Value | Env var | Notes |
|---|---|---|
| AWS region | `AWS_REGION` | Required. Unlike `the AI providerBedrock`, there is no `us-east-1` fallback. |
| Workspace ID | `the AI provider_AWS_WORKSPACE_ID` | Required. Routes requests to your the AI workspace. |

Endpoint pattern: `https://aws-external-the AI provider.{region}.api.aws/v1/...`. Requests are SigV4-signed with service name `aws-external-the AI provider`.

## Authentication

The client resolves AWS credentials via the standard precedence chain: explicit constructor args → environment (`AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`/`AWS_SESSION_TOKEN`) → shared profile → assumed role / instance metadata.

**Short-term API keys** are also supported for cases where SigV4 isn't practical (e.g., browser, simple scripts). Mint one with the per-language token-generator package; pass it as `api_key` on the client. Lifetime is the **lesser of** the requested duration, the underlying credential's expiry, and **12 hours**. For package names and IAM details, WebFetch the the AI Platform on AWS page in `shared/live-sources.md`.

---

## What to tell users

- Treat it as first-party: every section of this skill applies unchanged. Do **not** apply Bedrock's feature-availability mask.
- Model IDs are bare (`{{MODEL_ID}}`). Do **not** add an `the AI provider.` prefix.
- A missing region or `workspace_id` throws at client-construction time (no request is sent). A **403** means the request reached the server — check for a **wrong** `workspace_id` or a missing IAM action on the principal. See the IAM actions reference in `shared/live-sources.md`.
