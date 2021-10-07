openssl genrsa -out nia.key 2048
openssl req -new -key nia.key -out nia.csr -subj "/CN=nia/O=operations/O=managers/O=senior-engineers"


# Let's just get the key so that the kubernetes cluster can verify,
# or you can get a copy of the ca.cert. Use tr to remove the any new lines
# We will copy it to the signing-request.yaml
cat nia.csr | base64 | tr -d '\n'

kubectl create -f signing-request.yaml

# check to see if the user has requested access
kubectl get csr

kubectl certificate approve nia-csr

# check to see if the user has approval
kubectl get csr

# check the content of the csr
kubectl get csr nia-csr -o json

# get the authorized certificate
kubectl get csr nia-csr -o jsonpath='{.status.certificate}' | base64 -D > nia.crt

# now we add that to nia's kubeconfig
kubectl config --kubeconfig=./nia-config set-credentials nia --client-certificate=nia.crt --client-key=nia.key

# View the kubernetes config file
kubectl config --kubeconfig=./nia-config view
