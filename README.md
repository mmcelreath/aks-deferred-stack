# Example Stack for Kubernetes - AKS
This example demonstates an HCP Terraform Stack that creates an AKS cluster together with Kubernetes resources. 
It leverages deferred actions to enable users to create all the resources in the correct order using a single deployment.

## Prerequisites

* Valid Azure credentials configured in the local environment (eg. via `az login ...`).

## How to use:

1. Apply the `_setup` module from your local environment. This does two things:
    * Creates the ODIC IDP configuration in Azure which enables HCP Terraform workload identity authentication from Stacks.
    * Creates the Stack itself in HCP Terraform. It doesn't configure it for the custom agent pool mentioned above due to limitations in the TFE provider.
    
2. Copy the value of the `oidc_client_id` output from the `_setup` module to the `deployment` block into the `azure_client_id` attribute.

3. Fetch configuration in the Stack UI to trigger the plan / apply cycle.
