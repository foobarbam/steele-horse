# Cloud Resume Challenge

This repository contains all the code I use to deploy my website.  This site
is hosted on [AWS](https://aws.amazon.com), uses [terraform](https://terraform.io)
to manage the infrastructure, and [Hugo](https://gohugo.io) as the website content
mangement system.

I'm in the market for a new job and rather than follow the basic route of applying
to everything I see I read my friend's blog post at https://landadevopsjob.com/blog/terraform-certification-the-last-resort/
This inspired me to give the [Cloud Resume Challenge](https://cloudresumechallenge.dev/)
a go.  This repository is the result of that.  I opted for the [AWS]https://cloudresumechallenge.dev/docs/the-challenge/aws/
with [terraform](https://cloudresumechallenge.dev/docs/extensions/terraform-getting-started/)
challenge because I have expereince with these tools.  I many try the [Kubernetes challenge](https://cloudresumechallenge.dev/docs/extensions/kubernetes-challenge/)
soon.

## Setup

* The domain and route53 zone must be registered manually in AWS
* Create a file at `terraform/terraform.tfvars` and set the `aws_primary_region`
  and `domain_name` variables
* AWS cli setup on your PC

## Deployment

The Build and deployment is managed by the `make` utility.  Run `make apply` to deploy your site

Other make options are:

* `make build`:  Build the hugo site
* `make clean`: Cleanup generated html
* `make serve`: Generate all html and run a local development server.  Access at https://localhost:1313
* `make plan`:  Run `terraform plan` dry run deployment.
* `make apply`: Run `terraform apply` and deploy the site

## To Dos

* Add a real time visitor counter: https://cloudresumechallenge.dev/docs/extensions/realtime-counter/
* Write some tests for any Python code.
* CI/CD with GitHub Actions.  I am quite familiar with Jenkins but have never used GitHub Actions.
* Secure the Software supply chain: https://cloudresumechallenge.dev/docs/extensions/supply-chain/
* Create a Blog post and publish it.  See https://cloudresumechallenge.dev/docs/the-challenge/aws/#16-blog-post for details

## Addition Resources

* https://medium.com/@walid.karray/mastering-static-website-hosting-on-aws-with-terraform-a-step-by-step-tutorial-5401ccd2f4fb