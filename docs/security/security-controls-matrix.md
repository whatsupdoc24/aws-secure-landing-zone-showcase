# AWS Secure Landing Zone — Security Controls Matrix

**Project:** AWS Secure Landing Zone  
**Focus:** Cloud Security Engineering, Infrastructure as Code, DevSecOps  
**Status:** Living document — updated as security controls are implemented

## Purpose

This matrix maps security threats to AWS and DevSecOps controls, describes how those controls can be verified, and tracks their implementation status.

A control is marked as verified only when supporting evidence is available.

## Security Controls

| ID | Security Risk | Security Control | Status |
|---|---|---|---|
| SEC-001 | Long-lived AWS credentials | GitHub Actions OIDC authentication | Implemented in private project |
| SEC-002 | Excessive IAM permissions | Least-privilege IAM role policies | Hardening planned |
| SEC-003 | Unauthorized Terraform changes | Terraform plan review and controlled execution | Implemented for organization import |
| SEC-004 | Terraform configuration errors | Automated Terraform validation | Verified in public CI |
| SEC-005 | Insecure Infrastructure as Code | Automated Checkov scanning | Verified in public CI |
| SEC-006 | Terraform state corruption | S3 remote state and locking | Configured in private project |
| SEC-007 | Unauthorized AWS Region usage | AWS Organizations SCP restrictions | Planned |
| SEC-008 | Missing security audit trails | Centralized CloudTrail logging | Planned |
| SEC-009 | Unauthorized network access | VPC segmentation and security groups | Planned |
| SEC-010 | Excessive production access | Centralized identity and role-based access | Planned |

## Verification Methods

| Control | Verification Approach | Evidence |
|---|---|---|
| OIDC authentication | Confirm GitHub Actions can assume the intended AWS role without static access keys | Successful private CI execution |
| IAM least privilege | Review effective role permissions and test denied actions | Pending |
| Terraform change control | Review plan output and workflow execution guards | Completed organization import |
| Terraform validation | Execute `terraform fmt -check` and `terraform validate` | Passing public GitHub Actions workflow |
| Checkov security scanning | Run Checkov against Terraform examples and review results | Passing public GitHub Actions workflow |
| Terraform state locking | Verify remote backend configuration and test concurrent execution behavior | Backend configured; concurrency test pending |
| SCP enforcement | Test prohibited operations in an isolated member account | Pending |
| CloudTrail logging | Verify trail configuration, log delivery, and retention | Pending |
| Network segmentation | Test allowed and denied connectivity between workloads | Pending |
| Identity access controls | Validate role assignments, permission boundaries, and access restrictions | Pending |

## Security Validation Principles

1. **Evidence-based verification:** A control is not considered verified simply because Terraform code exists.
2. **Least privilege:** Permissions should be scoped to the actions and resources required.
3. **Defense in depth:** Multiple independent controls should protect critical infrastructure.
4. **Automated testing:** Repeatable security checks should run during infrastructure development.
5. **Continuous improvement:** Security controls should be reassessed as architecture and threats evolve.

## Current Security Validation Summary

### Verified

- Terraform formatting and configuration validation in public CI.
- Checkov security scanning against public Terraform examples.
- Successful Terraform import of an existing AWS Organization with a clean subsequent plan.

### Implemented or Configured — Further Validation Needed

- GitHub Actions OIDC authentication in the private infrastructure project.
- S3 remote Terraform state and locking.
- Terraform workflow execution controls.

### Planned

- Least-privilege IAM hardening.
- Service Control Policy enforcement.
- Centralized security logging.
- Network segmentation validation.
- Production identity access testing.

## Limitations

The public CI pipelines scan the portfolio's Terraform examples, not the complete private commercial infrastructure implementation.

A passing security scan does not establish that all AWS infrastructure is secure or that the landing zone is production-ready.

This document will be updated as additional controls are deployed and independently verified.

---

*This matrix is an engineering tracking artifact, not an external compliance assessment or security certification.*
