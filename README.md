# argocd-deployment
Sample projet to show ArgoCD features

![Image of Yaktocat](https://github.com/ptran32/argocd-deployment/blob/master/img/argo-ui-schema.png)

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

# Configure ingress (for easier access to app and argocd)
From the root repository, use the command below to add the minikube IP to ingress resources.

The command works on mac, the “” at the beginning might not work on linux. If not, replace the {MINIKUBE_IP} placeholders in app/app-ingtess.yaml and argocd/argocd-ingress.yaml

```
sed -i "" "s/{MINIKUBE_IP}/$(minikube ip)/g" app/app-ingress.yaml argocd/argocd-ingress.yaml
```

# ArgoCD Install

Deploy the argoCD CRD and configure ingress in the cluster
```
make deploy
```

# argoCD UI

Access the UI with your web browser using the informations below

URL: argocd.{YOUR_MINIKUBE_IP}.xip.io

user: admin

password: {output of the command below}

```
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```
