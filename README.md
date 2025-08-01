🚀 Overview

This repository is a local platform engineering showcase that demonstrates GitOps-based application deployment to Kubernetes using Helm and ArgoCD. It emphasizes reusable Helm charts, declarative application configuration, and automated deployment via Git.

```
platform-infra-boilerplate/
├── README.md
├── Makefile                      # Local automation commands
├── apps/                         # App-specific Helm values
│   └── nginx/                    # Example app values for nginx
│       └── values.yaml
├── charts/                       # Reusable Helm charts
│   └── base-app/                 # Generic application chart
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── ingress.yaml
│           ├── configmap.yaml
│           └── _helpers.tpl
├── environments/                # GitOps environments
│   └── dev/                     # Dev environment apps
│       └── nginx-app.yaml       # ArgoCD Application manifest for nginx
└── argo/                         # ArgoCD bootstrap manifest
    └── bootstrap.yaml           # ArgoCD install + App of Apps
```


🧱 Concepts & Best Practices

Reusable Helm Chart: The base-app chart is generic and configurable, following the Golden Path model.

App Onboarding: Adding a new app is as simple as defining a values.yaml and referencing it in ArgoCD.

GitOps: All app deployments are managed via Git and ArgoCD, avoiding drift and enabling automation.


🔧 Prerequisites

Helm ≥ 3.x

kubectl

minikube or kind or colima

GitHub repo (this repo should be pushed before ArgoCD sync)

🚀 Getting Started (Local Setup)

1. Clone the Repo

```shell 
git clone https://github.com/erikkvale/platform-infra-boilerplate.git
cd platform-infra-boilerplate
```

2. Start a Kubernetes Cluster

```shell
make start-cluster
```

3. Install ArgoCD

```shell
make install-argocd
```

4. Bootstrap Apps via GitOps

```shell
make bootstrap-apps
```

5. Access ArgoCD UI

```shell
make port-forward-argocd
```

6. Then visit: https://localhost:8080

7. Retrieve the admin password to login to ArgoCD UI:

```shell
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d && echo
```

➕ Adding a New Application

1. Create a new directory under apps/ and add a values.yaml.

2. Copy nginx-app.yaml from environments/dev/ and update it for the new app.

3. Commit and push changes to Git.

4. ArgoCD will sync and deploy automatically.

5. 🔍 Helm Preview (Optional Manual Render)

6. Preview Helm output without deploying:

7. helm template nginx ./charts/base-app -f apps/nginx/values.yaml

🧠 Why This Matters

This repository demonstrates real-world platform engineering patterns:

- Paved roads via Helm abstraction

- Declarative GitOps workflows

- ArgoCD as a deployment controller

- Separation of application config and infrastructure logic

🔚 Future Enhancements (Ideas)

- Add more example apps (e.g. mock APIs, Redis, http-echo)

- Implement External Secrets or SOPS

- Integrate monitoring stack (Prometheus + Grafana)

- Add ArgoCD notifications and sync hooks

- Use Kustomize overlays to manage per-env customization

