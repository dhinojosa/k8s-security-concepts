# Creating a namespace
kubectl create namespace data-engineering
kubectl create namespace data-science
kubectl create namespace operations

kubectl apply secret-reader-cluster-role-binding.yaml

CLUSTER_NAME=gke_my-gloud-playground_us-central1-c_cluster-1
kubectl config --kubeconfig=../3_users/pam/pam-config set-context data-engineering \
--cluster=$CLUSTER_NAME
--namespace=data-engineering
--user=pam

# Verify access
kubectl auth can-i list secrets --namespace data-engineering
kubectl auth can-i list secrets --namespace data-engineering --as pam
