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


