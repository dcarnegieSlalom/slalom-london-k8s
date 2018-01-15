resource "aws_iam_role_policy" "pod_role_policy" {
  name = "pod_role_policy"
  role = "${aws_iam_role.pod_role.id}"
  policy ="${file("role-rights.json")}"
}
