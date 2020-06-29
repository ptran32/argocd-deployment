# argocd-deployment
Sample projet to show ArgoCD features

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

# ArgoCD Install

Deploy the argoCD CRD in the cluster
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

# argoCD UI

Access the UI with your web browser using the informations below

URL: argocd.{YOUR_MINIKUBE_IP}.xip.io

user: admin

password: {output of the command below}

```
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```
