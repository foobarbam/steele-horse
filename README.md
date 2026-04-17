# Cloud Resume Challenge

This repository contains the code and content for my website.  It
is hosted on [AWS](https://aws.amazon.com), uses [terraform](https://terraform.io)
to deploy the virtual infrastructure, and [Hugo](https://gohugo.io) as the
website content mangement system.

While in the market for a new job my [friend's blog](https://landadevopsjob.com/blog/terraform-certification-the-last-resort/)
suggests [The Cloud Resume Challenge](https://cloudresumechallenge.dev/) and
this repository is the result of that.  I opted for the [AWS](https://cloudresumechallenge.dev/docs/the-challenge/aws/)
with [terraform](https://cloudresumechallenge.dev/docs/extensions/terraform-getting-started/)
challenge and here we are.

## Requirements

* The domain and route53 zone must be registered manually in AWS
* Create a file at `terraform/terraform.tfvars` and set the `aws_primary_region`
  and `domain_name` variables
* AWS cli setup on your PC

## Deployment

The Build and deployment is managed by the `make` utility.  Run `make apply` to deploy the site

Other make options are:

* `make build`:  Build the hugo site
* `make clean`: Cleanup generated html
* `make serve`: Generate all html and run a local development server.  Access at https://localhost:1313
* `make plan`:  Run `terraform plan` dry run deployment.
* `make apply`: Run `terraform apply` and deploy the site

## To Dos

* [ ] Move terraform state to S3
* [ ] Add a real time visitor counter like in https://cloudresumechallenge.dev/docs/extensions/realtime-counter/
* [ ] CI/CD with GitHub Actions.  I am quite familiar with Jenkins but have never used GitHub Actions.
* [ ] Secure the Software supply chain: https://cloudresumechallenge.dev/docs/extensions/supply-chain/
* [X] Create a Blog post and publish it.  See https://cloudresumechallenge.dev/docs/the-challenge/aws/#16-blog-post for details

## Addition Resources

* https://medium.com/@walid.karray/mastering-static-website-hosting-on-aws-with-terraform-a-step-by-step-tutorial-5401ccd2f4fb
