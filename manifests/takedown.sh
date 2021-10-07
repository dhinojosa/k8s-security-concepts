kubectl delete namespace operations
kubectl delete namespace data-science
kubectl delete namespace data-engineering
kubectl delete namespace secured-customers

kubectl delete -f 4_roles/pod-reader-role.yaml
kubectl delete -f 4_role-bindings/pod-reader-role-binding.yaml
