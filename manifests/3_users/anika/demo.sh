openssl genrsa -out anika.key 2048
openssl req -new -key anika.key -out anika.csr -subj "/CN=anika/O=operations/O=junior-engineers"

# Let's just get the key so that the kubernetes cluster can verify,
# or you can get a copy of the ca.cert. Use tr to remove the any new lines
# We will copy it to the signing-request.yaml
cat anika.csr | base64 | tr -d '\n'

kubectl create -f signing-request.yaml

# check to see if the user has requested access
kubectl get csr

kubectl certificate approve anika-csr

# check to see if the user has approval
kubectl get csr

# check the content of the csr
kubectl get csr anika-csr -o json

# get the authorized certificate
kubectl get csr anika-csr -o jsonpath='{.status.certificate}' | base64 -D > anika.crt

# now we add that to anika's kubeconfig
kubectl config --kubeconfig=./anika-config set-credentials anika --client-certificate=anika.crt --client-key=anika.key

# View the kubernetes config file
kubectl config --kubeconfig=./anika-config view
