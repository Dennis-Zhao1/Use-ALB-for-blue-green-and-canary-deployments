# Learn Terraform Advanced Deployment Strategies

Use Terraform and AWS's Application Load Balancers for canary tests and blue/green deployments. 

Implemented near-zero-downtime blue/green and canary deployments on AWS using Terraform. Provisioned VPC, ALB, and dual EC2 environments and used ALB listener target-group weighting plus feature toggles to ramp traffic from 10% canary to 50/50 and finally 100% green with instant rollback capability.


Blue/Green & Canary Deployments on AWS (Terraform, ALB) — Built dual-env (blue/green) IaC and ALB weighted routing to ramp traffic 10% → 50% → 100% with health checks and instant rollback; achieved near-zero downtime in staged releases.

- Provisioned VPC, subnets (multi-AZ), SGs, ALB + listeners/target groups, and dual EC2 stacks (blue/green) with Terraform; parameterized releases via variables/locals and dynamic blocks.

- Implemented ALB weighted forwarding and health checks to run canary (10%) → 50/50 → 100% green, with stickiness off to preserve sampling accuracy and automatic rollback on health failure.

- Ensured high availability by evenly distributing instances across subnets/AZs and using name-safe target group identifiers; codified traffic presets (e.g., all-blue, canary10, even) via lookup/try.

- Results: cut release risk and avoided downtime in staged rollouts; recovery < {1–2} min on forced failure during drills.