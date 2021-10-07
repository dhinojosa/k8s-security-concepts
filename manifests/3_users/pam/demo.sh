openssl genrsa -out pam.key 2048
openssl req -new -key pam.key -out pam.csr -subj "/CN=pam/O=data-engineering/O=managers/O=senior-engineers"

# Let's just get the key so that the kubernetes cluster can verify,
# or you can get a copy of the ca.cert. Use tr to remove the any new lines
# We will copy it to the signing-request.yaml
cat pam.csr | base64 | tr -d '\n'

kubectl create -f signing-request.yaml

# check to see if the user has requested access
kubectl get csr

kubectl certificate approve pam-csr

# check to see if the user has approval
kubectl get csr

# check the content of the csr
kubectl get csr pam-csr -o json

# get the authorized certificate
kubectl get csr pam-csr -o jsonpath='{.status.certificate}' | base64 -D > pam.crt

# now we add that to pam's kubeconfig
kubectl config --kubeconfig=./pam-config set-credentials pam --client-certificate=pam.crt --client-key=pam.key

# View the kubernetes config file
kubectl config --kubeconfig=~/.kube/pam-config view
