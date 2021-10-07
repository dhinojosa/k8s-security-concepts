kubectl run --tty -i --rm busybox-curl --image=odise/busybox-curl --serviceaccount pod-analysis -n secured-customers

# Map cert, token, namespace
CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

# Run with token, which will say no response
curl --cacert $CA_CERT -H "Authorization: Bearer $TOKEN" "https://kubernetes.default.svc.cluster.l
ocal/api/v1/namespaces/default/pods"

# Applying a custom-role
kubectl create rolebinding secured-customers-sa-role-binding \
  --clusterrole=view \
  --serviceaccount=secured-customers:pod-analysis \
  --namespace=default

# Running a pod with the Service Account
kubectl run --tty -i --rm busybox-curl --image=odise/busybox-curl --serviceaccount pod-analysis -n secured-customers

# Map cert, token, namespace
CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

# Run with token, which will say no response
curl --cacert $CA_CERT -H "Authorization: Bearer $TOKEN" "https://kubernetes.default.svc.cluster.local/api/v1/namespaces/default/pods"
