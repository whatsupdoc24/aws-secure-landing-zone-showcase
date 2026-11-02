# AWS Secure Landing Zone — Threat Model

**Project:** AWS Secure Landing Zone  
**Scope:** AWS infrastructure governance, identity, networking, logging, and CI/CD  
**Status:** Initial threat model — evolving with implementation

## 1. Security Objectives

The AWS landing zone is designed to:

- Prevent unauthorized access to AWS resources.
- Reduce the risk of privilege escalation.
- Protect Terraform state and sensitive infrastructure configuration.
- Detect potentially malicious infrastructure changes.
- Establish centralized security visibility.
- Reduce accidental or unauthorized deployments.

## 2. Architecture and Trust Boundaries

The architecture includes several security boundaries:

1. **GitHub to AWS:** GitHub Actions workflows authenticate to AWS using OIDC.
2. **Terraform to AWS:** Terraform uses AWS permissions to manage infrastructure.
3. **AWS Organizations:** Organization-level governance is intended to constrain member accounts.
4. **Network boundaries:** Planned networking components will isolate workloads and control connectivity.
5. **Logging boundaries:** Planned centralized logging will collect security-relevant activity.

## 3. Threat Analysis

| Threat | Potential Impact | Security Control | Status |
|---|---|---|---|
| Compromised GitHub credentials | Unauthorized infrastructure changes | OIDC federation, restricted IAM trust, workflow permissions | OIDC used in private project; further hardening planned |
| Excessive IAM privileges | Privilege escalation or account compromise | Least-privilege IAM policies | Planned hardening |
| Terraform state exposure | Disclosure of infrastructure information or sensitive values | S3 remote state and restricted access | Remote state configured; access review pending |
| Unauthorized infrastructure changes | Service disruption or security misconfiguration | Terraform plans, controlled deployments | Plan validation implemented |
| Insecure Terraform configurations | Deployment of vulnerable infrastructure | Checkov scanning | Implemented in public showcase |
| Unapproved AWS Regions | Governance and compliance gaps | Service Control Policies | Planned; not enforced |
| Missing audit logs | Reduced incident investigation capability | Centralized CloudTrail and security logging | Planned |
| Lateral movement | Unauthorized access between workloads | Network segmentation and access controls | Planned |

## 4. CI/CD Security

The project uses GitHub Actions to support Terraform automation.

### Current Controls

- OIDC-based authentication in the private infrastructure project.
- Terraform formatting and validation checks.
- Automated Checkov scanning in the public portfolio repository.
- Controlled Terraform execution workflows.
- Remote state locking.

### Future Improvements

- Narrow AWS deployment role permissions.
- Add environment protection rules and deployment approvals.
- Pin GitHub Actions to reviewed commit SHAs.
- Expand security testing and policy enforcement.
- Introduce additional checks for infrastructure drift.

## 5. AWS Governance Security

The landing zone is designed to support organization-level governance.

Planned controls include:

- Organizational units separating platform and workload responsibilities.
- Service Control Policies restricting sensitive actions.
- Region restrictions where appropriate.
- Centralized identity and access management.
- Centralized audit logging.

These controls are not considered active until deployed and verified.

## 6. Residual Risks

Even with automated security controls, several risks remain:

- Compromised identities may still have excessive permissions.
- CI/CD workflows may contain unsafe dependencies or configurations.
- Terraform state access could expose sensitive infrastructure details.
- Security scans may not detect every misconfiguration.
- Logging coverage may be incomplete until centralized services are deployed.

## 7. Security Validation Roadmap

- [x] Terraform configuration validation
- [x] Automated Checkov scanning in the public showcase
- [x] Existing AWS Organization imported into Terraform state
- [ ] Least-privilege IAM review
- [ ] SCP deployment and enforcement validation
- [ ] Centralized logging deployment
- [ ] Network segmentation testing
- [ ] Infrastructure drift detection
- [ ] End-to-end security validation

## 8. Conclusion

This threat model documents the security risks, trust boundaries, and planned protections for the AWS Secure Landing Zone.

It distinguishes implemented controls from planned security capabilities and will be updated as the infrastructure progresses through deployment and testing.

---

*This document is an engineering design artifact, not a certification, penetration-test report, or assertion of production security readiness.*
