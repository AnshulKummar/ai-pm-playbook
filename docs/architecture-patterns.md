# Architecture Patterns — Choosing the Right One

> [Back to AI PM Playbook](../README.md)

> This reference guide was moved from the main README to keep the playbook focused. Load this on demand: "Read docs/architecture-patterns.md for pattern selection guidance."

## Pattern Decision Table

| If your product needs... | Use this pattern | Key technologies |
|--------------------------|-----------------|-----------------|
| High read throughput (social feeds, dashboards) | CQRS + Read replicas + Cache-aside | Redis, Postgres read replicas, Materialized views |
| Complex business workflows (approvals, pipelines) | Saga pattern + Event Sourcing | Kafka/Redis Streams, Event store, Compensating transactions |
| Real-time collaboration (docs, chat) | CRDT + WebSocket broadcasting | Yjs, Socket.io, Redis Pub/Sub |
| Multi-tenant SaaS (B2B) | Silo model (per-tenant DB) or Pool model (RLS) | Postgres RLS, schema-per-tenant, PgBouncer |
| AI features at scale | Async inference + result caching + streaming | Claude API, Redis cache, SSE/WebSocket |
| Global deployment | Edge-first + data residency | Cloudflare Workers, Durable Objects, regional Postgres |
| Event-driven microservices | Choreography (events) or Orchestration (saga) | Kafka, Redis Streams, message schemas |

## Prompting for architecture advice

Always include scale targets when asking for architectural guidance:

```
"Design the data model for a multi-tenant SaaS analytics platform.
Scale targets: 10K B2B customers, 50M events/day, p99 query < 500ms.
Requirements: row-level security, custom dimensions, time-series aggregation.
Generate ADR-[N] with cost analysis at 4 scale tiers."
```
