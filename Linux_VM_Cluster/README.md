# Linux VM Cluster on Azure

This project provides a Terraform configuration to deploy a cluster of Linux virtual machines on Microsoft Azure.

## Prerequisites

- An active Azure subscription
- Terraform installed on your local machine
- Azure CLI installed and configured

## Usage

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd tf_azure/Linux_VM_Cluster
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review the Terraform plan:
    ```sh
    terraform plan
    ```

4. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

5. Confirm the apply action with `yes`.

## Resources Created

- A resource group
- A virtual network
- Subnets
- Network security groups
- Public IP addresses
- Linux virtual machines

## Custom Script

The virtual machines are configured with a custom script that runs on initialization. This script performs the following actions:

- Installs and starts the `httpd` service
- Ensures the `sshd` service is installed, enabled, and started
- Creates a simple HTML file to verify the web server

The custom script is defined in the `custom_data` attribute of the `azurerm_linux_virtual_machine` resource:

```terraform
custom_data = <<-EOF
  #!/bin/bash
  # Install and enable httpd
  sudo dnf install -y httpd
  sudo systemctl enable httpd
  sudo systemctl start httpd

  # Ensure sshd is installed, enabled, and started
  sudo dnf install -y openssh-server
  sudo systemctl enable sshd
  sudo systemctl start sshd

  # Create a simple HTML file
  echo "<html><body><h1>Welcome to Rocky Linux 9.4</h1></body></html>" | sudo tee /var/www/html/index.html
EOF
```

## Cleanup

To destroy the resources created by this Terraform configuration, run:
```sh
terraform destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## License

This project is licensed under the MIT License.