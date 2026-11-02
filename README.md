# AWS Secure Landing Zone | Cloud Security & DevSecOps Portfolio

**Terraform • AWS Organizations • IAM • GitHub Actions • Infrastructure as Code**

[![Terraform Validation](https://github.com/whatsupdoc24/aws-secure-landing-zone-showcase/actions/workflows/terraform-validation.yml/badge.svg)](https://github.com/whatsupdoc24/aws-secure-landing-zone-showcase/actions/workflows/terraform-validation.yml)

[![Terraform Security Scan](https://github.com/whatsupdoc24/aws-secure-landing-zone-showcase/actions/workflows/terraform-security-scan.yml/badge.svg)](https://github.com/whatsupdoc24/aws-secure-landing-zone-showcase/actions/workflows/terraform-security-scan.yml)

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
- **Security Scanning:** Checkov
- **Identity and Access:** AWS IAM, OIDC
- **Governance:** AWS Organizations, Service Control Policies (planned)
- **State Management:** Amazon S3, Terraform state locking

## Security Architecture & Threat Modeling

### Security Controls & Verification

**[View the AWS Security Controls Matrix](docs/security/security-controls-matrix.md)**

This matrix maps cloud security risks to AWS and DevSecOps controls,
documents implementation status, and identifies verification methods.

It covers:

- AWS IAM and OIDC authentication
- Least-privilege access controls
- Terraform state security
- Infrastructure change management
- Automated Terraform validation
- Checkov security scanning
- AWS Organizations governance and SCPs
- Centralized logging and network security

**Validation approach:** Security controls are tracked as planned,
implemented, or verified based on available engineering evidence.


**[View the AWS Landing Zone Threat Model](docs/security/threat-model.md)**

The threat model documents the security architecture,
trust boundaries, potential attack scenarios, and
mitigation strategies for the AWS landing zone.

### Security Areas Covered

- GitHub Actions OIDC authentication and IAM trust
- IAM privilege escalation and least-privilege design
- Terraform state security
- Infrastructure change control
- Automated Infrastructure as Code security scanning
- AWS Organizations governance and SCPs
- Centralized security logging
- Network segmentation and lateral movement

### Security Engineering Approach

The project follows a risk-based security design process:

1. Identify infrastructure assets and trust boundaries.
2. Evaluate potential threats and attack paths.
3. Design preventive and detective security controls.
4. Implement automated security checks.
5. Validate deployed controls and document residual risks.

**Implementation status:** Terraform validation and Checkov
security scanning are operational in the public showcase.
Additional AWS security controls remain under development.


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
