resource "aws_iam_role" "pod_role" {
  name = "pod_role"
  assume_role_policy = "${file("pod-role-trust-policy.json")}"
}