
# Portfolio example: GitHub Actions OIDC authentication for AWS
# Uses placeholder values and does not deploy any infrastructure.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "github_owner" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of an existing GitHub Actions OIDC provider"
  type        = string
}

data "aws_iam_policy_document" "github_oidc_trust" {
  statement {
    sid     = "AllowGitHubActionsOIDC"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        "repo:${var.github_owner}/${var.github_repository}:ref:refs/heads/main"
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "GitHubActionsTerraformExample"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust.json

  tags = {
    Purpose = "PortfolioExample"
    Managed = "Terraform"
  }
}

# Intentionally no permissions policies attached.
# Grant only the permissions required by a specific workflow.
