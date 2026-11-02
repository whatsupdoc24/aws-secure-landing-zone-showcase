# AWS Secure Landing Zone | Cloud Security & DevSecOps Portfolio

**Terraform • AWS Organizations • IAM • GitHub Actions • Infrastructure as Code**

## Project Overview

This project documents the architecture, engineering decisions, and implementation progress of an AWS landing zone designed around secure infrastructure provisioning, governance, and DevSecOps practices.

The underlying infrastructure is developed in a separate repository. This public showcase provides selected technical examples, architecture documentation, and verified implementation results.

**Project status:** Active development. AWS Organizations integration and Terraform state adoption have been completed and verified. Additional infrastructure components are being developed and validated.

## Architecture

### AWS Landing Zone Architecture

[View the AWS Infrastructure Architecture Diagram](docs/architecture.md)

The architecture documents the relationship between AWS Organizations,
Terraform automation, governance, networking, identity, centralized
logging, and production workloads.

**Current status:** AWS Organizations successfully imported and verified.
Remaining infrastructure components are under development.


The platform is designed around five infrastructure domains:

| Domain | Purpose | Status |
|---|---|---|
| Organization Management | AWS Organizations governance and organizational structure | Existing organization imported |
| Transit Networking | Network segmentation and connectivity | Terraform development |
| Identity Federation | Centralized identity and access management | Terraform development |
| Central Logging | Audit logging, encryption, and security visibility | Terraform development |
| Production Workloads | Secure application infrastructure | Terraform development |

## Technologies

- **Cloud:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **CI/CD:** GitHub Actions
- **Authentication:** AWS IAM and OpenID Connect (OIDC)
- **Governance:** AWS Organizations and Service Control Policies
- **Security:** Least-privilege design, encrypted remote state, and infrastructure change review

## Engineering Case Study: Importing an Existing AWS Organization

### Challenge

An existing AWS Organization needed to be brought under Terraform management without recreating the organization, disrupting trusted AWS service
