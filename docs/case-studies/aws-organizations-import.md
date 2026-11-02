# Case Study: Safely Importing an Existing AWS Organization into Terraform

**Technologies:** AWS Organizations, Terraform, AWS IAM, GitHub Actions, Amazon S3, OIDC

**Status:** Completed and verified

## 1. Engineering Challenge

An existing AWS Organization needed to be adopted into Terraform management without recreating it or disrupting its configuration.

The initial Terraform plan proposed creating a new organization, even though one already existed.

After configuring Terraform's import mechanism, the plan also proposed potentially disruptive changes to trusted-service access and Service Control Policy (SCP) settings.

The objective was to bring the existing organization under Terraform management while preserving its live configuration.

## 2. Technical Approach

### Existing Infrastructure Discovery

Inspected the existing AWS Organization, including its root, feature set, trusted-service integrations, and enabled policy types.

Configured a Terraform import block using the existing organization identifier.

### IAM Permission Troubleshooting

The Terraform planning process initially encountered AWS Organizations access-denied errors.

Investigated the missing discovery permissions and updated the GitHub Actions deployment role to allow the required read operations.

Verified access through subsequent successful Terraform plans.

### Preventing Unintended Infrastructure Changes

Reviewed the Terraform execution plan and identified proposed changes to:

- IAM Identity Center trusted-service access.
- IAM Access Analyzer trusted-service access.
- SCP enablement.
- Organizational unit and policy creation.

Updated the Terraform configuration to preserve the existing trusted-service integrations and SCP settings.

Introduced feature switches to separate importing existing infrastructure from creating new resources.

### Controlled Import Execution

Implemented a dedicated GitHub Actions workflow with:

- Manual workflow triggering.
- AWS OIDC authentication.
- Remote Terraform state in Amazon S3.
- State locking and workflow concurrency controls.
- Machine-readable Terraform plan verification.
- A guard requiring exactly one intended import and no other resource changes.

The import was executed only after the plan satisfied the verification checks.

## 3. Verified Results

The final pre-import plan showed:

```text
Plan: 1 to import, 0 to add, 0 to change, 0 to destroy.
```

Following the import, Terraform state inspection confirmed the existing AWS Organization was recorded.

The subsequent Terraform plan reported:

```text
No changes. Your infrastructure matches the configuration.
```

The one-time import workflow was then disabled to prevent unintended re-execution.

## 4. Security and Engineering Lessons

**Terraform plans must be reviewed for unintended side effects.** A successful validation does not guarantee that a deployment is safe.

**Existing infrastructure should be adopted carefully.** Importing a resource into Terraform state is different from creating it.

**IAM permissions should be investigated systematically.** Missing permissions can be identified through AWS errors and validated before making further changes.

**Deployment workflows need explicit safeguards.** State locking, concurrency controls, and plan verification help reduce operational risk.

**Infrastructure changes should be separated into manageable stages.** Importing an existing organization was completed independently of creating new organizational units or governance policies.

## 5. Outcome

Successfully adopted an existing AWS Organization into Terraform state while preserving its existing configuration.

Verified that the post-import Terraform plan reported "No changes," confirming that Terraform detected no differences between the configuration and observed AWS Organization resources at the time of verification.

This case study demonstrates practical experience with infrastructure adoption, AWS identity and access management, Terraform change control, and secure CI/CD workflow design.

---

*Identifiers and deployment-specific configuration have been intentionally omitted from this public case study.*
