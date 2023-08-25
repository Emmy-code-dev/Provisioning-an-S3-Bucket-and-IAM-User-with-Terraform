module "iam_read_only_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-read-only-policy"

  name        = "read_only"
  path        = "/"
  description = "My example read-only policy"

  allowed_services = ["bucket"]
}