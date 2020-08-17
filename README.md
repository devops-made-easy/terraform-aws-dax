# terraform-aws-dax

# Sample way of calling this module

```
module "dax" {
  source  = "git@github.com:devops-made-easy/terraform-aws-dax.git"
  version = "0.0.1"
  iam_role_arn = "iam_arn"
  name = "devops-made-easy-dax"
  node_count = 1
  node_type = "dax.t2.small"
  security_group_ids = [sg-xxxx]
  subnet_ids = [sub-xxxx]
}
```
