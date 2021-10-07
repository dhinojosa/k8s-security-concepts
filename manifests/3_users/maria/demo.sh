openssl genrsa -out maria.key 2048
openssl req -new -key maria.key -out maria.csr -subj "/CN=maria/O=data-science/O=managers/O=senior-engineers"

# Let's just get the key so that the kubernetes cluster can verify,
# or you can get a copy of the ca.cert. Use tr to remove the any new lines
# We will copy it to the signing-request.yaml
cat maria.csr | base64 | tr -d '\n'

kubectl create -f maria-signing-request.yaml

# check to see if the user has requested access
kubectl get csr

kubectl certificate approve maria-csr

# check to see if the user has approval
kubectl get csr

# check the content of the csr
kubectl get csr maria-csr -o json

# get the authorized certificate
kubectl get csr maria-csr -o jsonpath='{.status.certificate}' | base64 -D > maria.crt

# now we add that to maria's kubeconfig
kubectl config --kubeconfig=./maria-config set-credentials maria --client-certificate=maria.crt --client-key=maria.key

# View the kubernetes config file
kubectl config --kubeconfig=./maria-config view

