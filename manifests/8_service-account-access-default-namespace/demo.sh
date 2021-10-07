# Try again
kubectl run --tty -i --rm busybox-curl --image=odise/busybox-curl

# In the busybox pod that is deployed
cd /var/run/secrets/kubernetes.io/serviceaccount

# Map cert, token, namespace
CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

# Run with token, which will say no response
curl --cacert $CA_CERT -H "Authorization: Bearer $TOKEN" "https://kubernetes/api/v1/namespaces/default/pods"

# Add a role-binding that allows viewing of the api to allow the clusterrole view, which is pre-created
kubectl create rolebinding default-sa-role-binding \
  --clusterrole=view \
  --serviceaccount=default:default \
  --namespace=default

# Try again
kubectl run --tty -i --rm busybox-curl --image=odise/busybox-curl

# Map cert, token, namespace
CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

# Run with token, which will say no response
curl --cacert $CA_CERT -H "Authorization: Bearer $TOKEN" "https://kubernetes/api/v1/namespaces/default/pods"
