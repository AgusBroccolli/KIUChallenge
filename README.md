Initial Considerations:
- The VPC and its respective subnets, with corresponding route tables, are already created.
- I choose the us-east-1 region because I consider that all the networking is there, understanding that it is the most economical and the first region to receive AWS updates.
- If users are distributed worldwide, we could evaluate a multi-region solution.
- I also assume that there are already groups with the corresponding users attached to them, their respective roles with policies that comply with the principle of least privilege possible.
- As I assume that several things are created, I assign hardcoded values to the variables. But they could be reused from the outputs of the modules when they are created. In this case, we should also add a depends_on to ensure that they are created in the correct order.
- For the scope of the challenge, no associated frontend was created, but it should exist and be added to the ingress to establish the connection with the corresponding backend and should be the one actually exposed for use by the end client.

Secrets:
- For handling secrets, the Secret Store CSI Driver should be installed with Helm (this can be done from an existing repository: secrets-store-csi-driver) and configure its corresponding parameters such as region, cluster name, and access policy.

External-DNS:
- For the public DNS configuration, I assume that a domain already exists (kiu.com) in which external-dns will be responsible for adding the corresponding subdomain when adding or modifying it in the ingress.

Resource Choices:
- An S3 bucket is created to obtain a remote backend where the tfstate is stored. This allows multiple team members to work on the same infrastructure concurrently, avoids consistency issues that can occur when state is shared manually or through version control systems, protects the infrastructure state by securely storing it in a cloud service, provides backup and recovery capabilities for the infrastructure state, allowing it to be restored in case of loss or corruption.

- RDS is chosen because it is a managed database by AWS that facilitates configuration, operation, and scalability. Additionally, it ensures high availability, such as multi-zone replication in the case of production environments and automated backup, which guarantee data availability and disaster recovery. It also provides integrated security features, such as encryption of data at rest and in transit, role-based access management, and integration with AWS IAM, which help protect sensitive data. Finally, it is compatible with various database engines, such as MySQL, PostgreSQL, Oracle, SQL Server, and Amazon Aurora, which provides freedom of choice depending on the case.

- EKS is chosen because it simplifies the management of Kubernetes clusters by taking care of tasks such as provisioning, updates, patches, and scaling of the Kubernetes control plane. It also offers a highly scalable architecture that can adapt to workload needs. In terms of security, it provides advanced features such as identity and access management with IAM, data encryption, and implementation of network-based security policies. Additionally, EKS receives automatic security patches and is compatible with Kubernetes best security practices. Finally, it is compatible with Kubernetes standards, which means that applications deployed on EKS are portable and can run on any Kubernetes cluster, both in the cloud and in on-premises environments.

- WAF / SSL:
To add security to our application, we should add a WAF to the public service accessed by our customers (a frontend, which is not available in the scope of this repository) with the necessary rules to ensure evasion of any common types of attacks, such as SQL injections, Denial of Service (DDoS) attacks, and known security vulnerabilities. We must use HTTPS for secure connections, correctly configure SSL/TLS certificates in the LoadBalancer or Ingress service (in this case, letsencrypt was used for this).

- Monitoring:
Once the application is up and running, we should regularly monitor its performance and security. Use monitoring tools and services to record relevant events and metrics, as well as perform regular security updates to mitigate potential vulnerabilities.

- Finally, to deploy the database (as well as all the infrastructure), we must run the basic Terraform commands within the "infra" directory:
   - terraform init: which initializes the directory and downloads the necessary modules, downloads specified providers, and initializes the backend.
   - terraform plan: which generates an execution plan that shows the changes that Terraform plans to make to the infrastructure based on the provided configuration files.
   - terraform apply: which applies the proposed changes in the execution plan to the actual infrastructure.