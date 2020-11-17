# Securing Kubernetes

## API Server

1. API server can be configured with one or more authentication plugins
2. When a request is made it iterates list of authentication plugins to determine who is sending request
3. The first plugin that can extract that information from the request returns the username, user ID, and the groups the client belongs to back to the API server core.
4. The API server stops invoking the remaining authentication plugins and continues onto the authorization phase.

## Authentication Plugins

1. From the client certificate
2. From an authentication token passed in an HTTP header
3. Basic HTTP authentication
4. Others

## Authentication Plugin Responsibility

1. Authentication plugin returns the username and group(s) of the authenticated user.
2. It uses it to verify whether the user is authorized to perform an action or not.

## Kubernetes Recognition

1. Kubernetes recognizes two types of clients
   a. Humans (users)
   b. Pods (applications)
2. Users are meant to be recognized by a single sign on system
3. Pods are meant to be recognized by a service account

## Groups

1. Humans and Service Accounts can belong to one or more groups
2. Groups are used to grant permissions to several users at once, instead of having to grant them to individual users

## Groups in Details

Groups returned by the plugin are nothing but strings, representing arbitrary group names, but built-in groups have special meaning:

* The `system:unauthenticated` group is used for requests where none of the authentication plugins could authenticate the client.
* The `system:authenticated` group is automatically assigned to a user who was authenticated successfully.
* The `system:serviceaccounts` group encompasses all ServiceAccounts in the system.
* The `system:serviceaccounts:<namespace>` includes all ServiceAccounts in a specific namespace.

### Service Accounts

1. You’ve already learned that the API server requires clients to authenticate themselves before they’re allowed to perform operations on the server
2. Pods can authenticate by sending the contents of the file `/var/run/secrets/kubernetes.io/serviceaccount/token`, which is mounted into each container’s filesystem through a secret volume.
3. Every pod is associated with a Service-Account, which represents the identity of the app running in the pod
4. The token file holds the ServiceAccount’s authentication token
5. When an app uses this token to connect to the API server, the authentication plugin authenticates the ServiceAccount and passes the ServiceAccount’s username back to the API server core.
6. Service-Account usernames are formatted like this:

```
system:serviceaccount:<namespace>:<service account name>
```

### After Authenticated

1. The API server passes this username to the configured authorization plugins, which determine whether the action the app is trying to perform is allowed to be performed by the ServiceAccount.
2. ServiceAccounts are nothing more than a way for an application running inside a pod to authenticate itself with the API server. 
3. Applications do that by passing the ServiceAccount’s token in the request.

### Scoping Service Accounts

1. ServiceAccounts are resources just like Pods, Secrets, ConfigMaps, and so on.
2. ServiceAccounts are scoped to individual namespaces.
3. A default ServiceAccount is automatically created for each namespace by default.

![Sample Image](./images/KubernetesArchitecture.png)
