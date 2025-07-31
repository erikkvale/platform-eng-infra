CLUSTER_NAME=colima
ARGO_NAMESPACE=argocd

.PHONY: all start-cluster install-argocd bootstrap-apps port-forward-argocd destroy

all: start-cluster install-argocd bootstrap-apps

start-cluster:
	minikube start --profile=$(CLUSTER_NAME)

install-argocd:
	kubectl create namespace $(ARGO_NAMESPACE) || true
	kubectl apply -n $(ARGO_NAMESPACE) -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

bootstrap-apps:
	kubectl apply -f argo/bootstrap.yaml

port-forward-argocd:
	kubectl port-forward svc/argocd-server -n $(ARGO_NAMESPACE) 8080:443

destroy:
	minikube delete --profile=$(CLUSTER_NAME)
