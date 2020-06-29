.PHONY: all
all: deploy

.PHONY: help
help :
	@echo "deploy : Create argoCD CRD and configure ingress resource"
	@echo "destroy : Destroy argo CRD and ingress resource"

.PHONY: deploy
deploy :
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl apply -f ./argocd/argocd-ingress.yaml

.PHONY: destroy
destroy :
	kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl delete -f ./argocd/argocd-ingress.yaml
