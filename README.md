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

## Technical Implementation Examples

This repository includes standalone, sanitized examples
demonstrating AWS cloud security and DevSecOps engineering practices.

### Infrastructure as Code

**[AWS IAM — GitHub Actions OIDC Trust Role](examples/terraform/github-actions-oidc/main.tf)**

Terraform example demonstrating:
- IAM role trust policies for GitHub OIDC federation
- Repository and branch restrictions
- Short-lived credential authentication design
- Least-privilege permission separation

### CI/CD Automation

**[Terraform CI Validation Pipeline](examples/github-actions/terraform-security-pipeline.yml)**

GitHub Actions workflow example demonstrating:
- Terraform formatting checks
- Terraform initialization without a remote backend
- Terraform configuration validation
- Pull-request validation triggers
- Read-only repository permissions

### Implementation Notes

These examples are intentionally separated from the
private commercial infrastructure implementation.

The CI workflow is a reference example and does not
automatically execute from its current location.

The OIDC role example assumes an existing AWS OIDC provider
and does not attach AWS permissions or deploy infrastructure.


- **Cloud:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **CI/CD:** GitHub Actions
- **Authentication:** AWS IAM and OpenID Connect (OIDC)
- **Governance:** AWS Organizations and Service Control Policies
- **Security:** Least-privilege design, encrypted remote state, and infrastructure change review

## Engineering Case Study: Importing an Existing AWS Organization

### Featured Engineering Case Study

**[Read the full AWS Organizations Terraform Import Case Study](docs/case-studies/aws-organizations-import.md)**

A technical walkthrough covering:

- Adopting existing AWS infrastructure into Terraform state
- Troubleshooting AWS IAM access-denied errors
- Identifying potentially disruptive Terraform changes
- Securing GitHub Actions deployments with AWS OIDC
- Implementing plan verification and state-locking safeguards
- Confirming zero configuration drift after import

**Verified result:** Existing AWS Organization successfully imported
with no subsequent Terraform changes required.


### Challenge

An existing AWS Organization needed to be brought under Terraform management without recreating the organization, disrupting trusted AWS service
