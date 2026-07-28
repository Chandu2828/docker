terraform {
    required_providers { # required_providers: Specifies the external plugins needed to manage your resources
        aws = { # tells terraform to download the aws plugin 
            source = "hashicorp/aws" # fetches the official plugin from the hashicorp registry 
            version = "6.48.0"
        }
    }
    # Configure terraform to store its state file remotely in Amazon S3 
    backend "s3" { 
        bucket          = "remote-state-90s-practice-dev"
        key             = "docker.tfstate"
        region          = "us-east-1"
        encrypt         = true # secures the state file at rest using S3 server-side encryption 
        use_lockfile    = true # Enable S3 native state locking to prevent concurrent updates and state corruption 
    }
}
# This block initializes and configures the specifif cloud provider platform 
provider "aws" {
    region = "us-east-1"
}
# Sets the default geographic AWS data center location where your infrastructure will be created


