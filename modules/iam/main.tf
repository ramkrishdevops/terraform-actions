# IAM Role
resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = var.assume_services
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

# IAM Policy
resource "aws_iam_policy" "this" {
  name   = "${var.role_name}-policy"
  policy = jsonencode(var.policy_document)
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

