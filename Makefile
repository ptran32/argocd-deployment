.PHONY: all
all: deploy

.PHONY: help
help :
	@echo "deploy : Create argoCD CRD"
	@echo "destroy : Destroy argo CRD"

.PHONY: deploy
deploy :
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

.PHONY: destroy
destroy :
	kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
