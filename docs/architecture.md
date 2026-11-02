
# AWS Secure Landing Zone — Architecture

## Infrastructure Architecture

```mermaid
flowchart TB
    GH["GitHub Actions<br/>Terraform CI/CD"]
    ORG["AWS Organizations<br/>Imported and Verified"]

    CORE["Core-Platform OU<br/>Planned"]
    WORK["Workloads OU<br/>Planned"]

    NET["Transit Networking<br/>In Development"]
    IAM["Identity Federation<br/>In Development"]
    LOG["Central Logging<br/>In Development"]
    PROD["Production Workloads<br/>In Development"]

    GH --> ORG
    ORG -.-> CORE
    ORG -.-> WORK

    CORE -.-> NET
    CORE -.-> IAM
    CORE -.-> LOG
    WORK -.-> PROD
```

## Implementation Status

**Verified**
- Existing AWS Organization imported into Terraform state
- Remote state backend and state locking configured
- GitHub Actions Terraform validation and planning
- Post-import plan confirms no configuration drift

**Planned / In Development**
- Organizational unit deployment
- Service Control Policies
- Transit networking
- Identity federation
- Centralized security logging
- Production workload infrastructure

## Design Principles

- Infrastructure as Code
- Least-privilege access
- Customer-owned AWS environments
- Explicit change review
- Secure-by-default configurations
- Reusable and configurable Terraform modules

> Dashed connections represent intended architecture,
> not deployed infrastructure.
