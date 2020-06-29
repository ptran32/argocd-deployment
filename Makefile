.PHONY: all
all: deploy

.PHONY: help
help :
	@echo "deploy : Create argoCD CRD and configure ingress resources"
	@echo "destroy : Destroy argo CRD and ingress resources"

.PHONY: deploy
deploy :
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl apply -f ./argocd/argocd-ingress.yaml
	kubectl apply -f ./app/ingress/app-ingress.yaml

.PHONY: destroy
destroy :
	kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl delete -f ./argocd/argocd-ingress.yaml
	kubectl delete -f ./app/ingress/app-ingress.yaml
