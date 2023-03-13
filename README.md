# Mutable and Immutable Infrastructure with Terraform

 Import existing mutable infrastructure into Terraform and discuss the different
 approaches to migrate to immutable infrastructure using provisioners, user
 data, and immutable images.

 In this talk we'll:

1. Deploy an example web application to an AWS EC2 instance using a mutable
   deployments.
1. Import the EC2 instance, its SSH key pair, and its security group into
   Terraform.
1. Discuss the drawbacks of mutable deployments and migrate to immutable
   deployments using Terraform provisioners.
1. Discuss the drawbacks of Terraform provisioners and migrate to immutable
   deployments using user data.
1. Discuss the drawbacks of user data and migrate to immutable deployments using
   immutable images.
