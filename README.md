# argocd-deployment
Sample projet to show ArgoCD features on minikube

![Image of argo-ui-schema](https://github.com/ptran32/argocd-deployment/blob/master/img/argo-ui-schema.png)

# More details
You can found more details on my blog:

https://ptran32.github.io/2020-05-28-continuous-k8s-deployment-with-argocd/


# Kubernetes Install

Start kubernetes locally
```
minikube start
```

Deploy nginx ingress inside the cluster
```
minikube addons enable ingress
```

Get the cluster IP ( Note it somewhere, we will need it after for ingress configuration)
```
minikube ip 
```

# Clone this repo
Get this repo on your local machine.

# Install ArgoCD

Deploy the argoCD CRD and configure ingress in the cluster
```
kubectl create namespace argocd
make deploy
```

# Configure ArgoCD Ingress

Modify the file argocd/argocd-ingress.yaml

Change 192.168.64.54 with the output of "minikube ip" command

```
  - host: argocd.192.168.64.54.xip.io
```

This gonna give you access to argoCD UI without having to modify your /etc/hosts

# Access ArgoCD UI

Access it using your web browser with the informations below:

URL: argocd.{YOUR_MINIKUBE_IP}.xip.io

user: admin

password: {output of the command below}

```
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```

# Deploy the app

Click on "+ New app" and fill the informations needed. You can keep all default values for options not mentionned below:

- Application Name: app
- Project: default
- sync policy: Automatic
- source: https://github.com/ptran32/argocd-deployment
- path: app
- cluster: click on cluster and select the only choice possible
- namespace: default
- ingress.hosts[0].paths[0]: app.{YOUR_MINIKUBE_IP}.xip.io

If nothing appears, refresh the page. If you click on the box, you should see all app components (pod, services, deployment, secret, ingress).

You can access to your application by clicking on the small square the "ing" resource. 

You should see this on your web browser.

```
Hello, world!
Version: 1.0.0
Hostname: app-fbdc4fcc7-98mmt
```