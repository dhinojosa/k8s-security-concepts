# Todo
0. Architecture Review
1. Describe how to establish users in Kubernetes. In Kubernetes in Action, "We won’t go into any details of how to manage users".For more information on how to configure the cluster for authentication of human users, cluster administrators should refer to the Kubernetes Cluster Administrator guide at http://kubernetes.io/docs/admin.
2. Lab/Demo: Create mTLS
3. Lab/Demo: TLS Termination from Outside with Ingress
4. Lab/Demo: Istio mTLS
5. Lab/Demo: Service Account
6. Lab/Demo: Users/Roles (From RoleBinding, Cluster Binding)
7. Lab/Demo: Ensuring Pods Not Running as Root
8. Lab/Demo: Network Policies
9. List API Groups
10. Attach a Principal to the application
11. Vault and Kubernetes
12. Discuss Service Meshes: Istio
13. Call mTLS from the outside
14. Call mTLS betweeen Microservices
15. CIDR
16. SSO (Maybe?)
17. Cluster/Users in Kubeconfig
18. Include TLS-Termination with Let's Encrypt
19. Disallow another user into your namespace

Perhaps Lab: Should be
1. Ingress (Turn on in GCP)
2. Service Account
   a. namespace = data-analysis
   b. service-account = data-processor
3. Users
   a. namespace = data-engineering
   b. user = lindsay
4. Roles
   a. Creating a Role
5. Role Binding
   a. Add Service Account to Role
   b. Add User to Role
   c. Make Users a Part of the Group and add to Role
6. Cluster Role Binding
   
7. Network Policies
8. mTLS Between Microservices the Hard Way
9. mTLS in Istio


## Sources

1. https://www.youtube.com/watch?v=tGg_IjPLB20
2. https://stackoverflow.com/questions/42292444/how-do-i-add-a-ca-root-certificate-inside-a-docker-image
3. https://www.jeffgeerling.com/blog/2019/mounting-kubernetes-secret-single-file-inside-pod
4. https://stackoverflow.com/questions/62729037/how-to-do-tls-between-microservices-in-kubernetes
5. https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/
6. https://awkwardferny.medium.com/configuring-certificate-based-mutual-authentication-with-kubernetes-ingress-nginx-20e7e38fdfca
7. https://stackoverflow.com/questions/62729037/how-to-do-tls-between-microservices-in-kubernetes
8. https://cert-manager.io/docs/concepts/
9. https://stackoverflow.com/questions/63025817/mtls-setup-using-self-signed-cert-in-kubernetes-and-nginx
10. https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets
11. https://stackoverflow.com/questions/42292444/how-do-i-add-a-ca-root-certificate-inside-a-docker-image
12. https://kubernetes.io/docs/concepts/services-networking/network-policies/
