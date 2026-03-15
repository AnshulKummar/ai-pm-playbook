# Beyond Vibe Coding — Architecture for Scale

> This reference guide was moved from the main README to keep the playbook focused. Load this on demand: "Read docs/architecture-for-scale.md for scale architecture guidance."

Vibe coding gets you to MVP. Real architecture gets you to 100M users without a rewrite.

## The Scale Decision Framework

| Decision | Vibe Code Answer | Scale Architecture Answer |
|---------|-----------------|--------------------------|
| Data storage | Single Postgres DB | Read replicas + write DB + Redis cache + CDN |
| Auth | Sessions in DB | JWT + refresh tokens + distributed session store |
| File uploads | Save to local disk | S3/GCS + CloudFront CDN + presigned URLs |
| Background jobs | setTimeout or cron | Redis queues (BullMQ) + worker pools + dead letter queue |
| Real-time features | Polling every 5s | WebSockets or SSE + Redis Pub/Sub |
| Multi-tenancy (B2B) | Shared tables + tenant_id | Row-level security (RLS) or isolated schemas + tenant routing |
| Search | SQL LIKE queries | Elasticsearch / Typesense + inverted index |
| Rate limiting | None | Redis sliding window + API gateway policies |
| Observability | console.log | OpenTelemetry traces + structured logs + Prometheus |
| CI/CD | Manual deploys | GitHub Actions + blue-green deploy + feature flags |

## B2C Requirements (100M users)

- **Stateless services** — horizontal scaling is mandatory; no server-side session state
- **CDN-first** — serve 80% of requests from edge (Cloudflare/Fastly/CloudFront)
- **Database sharding strategy** — plan data partitioning before you hit 10M rows
- **Async everything** — user actions should be non-blocking; use event queues
- **Mobile-first API design** — GraphQL or REST with field selection to reduce payload size
- **Abuse prevention** — rate limiting, CAPTCHAs, bot detection at edge

## B2B Requirements (10K customers)

- **Tenant isolation** — row-level security (RLS) in Postgres or dedicated schemas per tenant
- **SLA-aware infrastructure** — different pricing tiers get different compute/storage allocations
- **API versioning from day one** — enterprise clients cannot break on your updates
- **Webhook delivery system** — reliable, retryable, with dead letter queue and replay capability
- **Audit logs** — every action logged and queryable per tenant (GDPR/compliance requirement)
- **SSO integration** — SAML/OIDC support for enterprise identity providers
- **Usage-based billing hooks** — track API calls, storage, seats per tenant

## Recommended Technology Stack

| Layer | Recommended Tech | Why |
|-------|-----------------|-----|
| Frontend | Next.js + TypeScript + Tailwind | SSR/SSG hybrid, edge rendering, type safety |
| API Gateway | Kong / AWS API GW / Cloudflare Workers | Rate limiting, auth, routing at edge |
| Backend Services | Node.js (Fastify) or Go | High throughput, low latency, async-first |
| Primary DB | PostgreSQL + PgBouncer | ACID compliance, RLS for multi-tenancy |
| Cache Layer | Redis Cluster | Session store, rate limiting, pub/sub |
| Search | Typesense (B2C) / Elasticsearch (B2B) | Full-text + faceted search |
| Message Queue | Redis BullMQ or Apache Kafka | Async jobs, event streaming |
| File Storage | S3 + CloudFront | Scalable object storage with CDN |
| Observability | OpenTelemetry + Grafana + Loki | Traces, metrics, logs unified |
| Infrastructure | Kubernetes (EKS/GKE) + Terraform | Container orchestration + IaC |
