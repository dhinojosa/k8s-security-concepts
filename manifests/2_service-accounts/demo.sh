# Create a namespace for secured-customers
kubectl create ns secured-customers

# Create a custom service account
kubectl create sa pod-analysis -n secured-customers

# Show all the service accounts
kubectl get serviceaccounts

# Show all the service accounts in secured-customers
kubectl get serviceaccounts -n secured-customers

# Show the secrets of the service account
kubectl get secrets -n secured-customers

# Run a pod
kubectl run --tty -i --rm busybox-curl --image=odise/busybox-curl -n secured-customers

# Show that there is a kubernetes service endpoint in the default namespace
kubectl get svc

# Run the following to bindings in the busybox

# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read this Pod's namespace
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

# Explore the API with TOKEN and CACERT so you can access securely
curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api
