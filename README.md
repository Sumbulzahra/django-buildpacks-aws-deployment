# 🚀 Dockerfile-Less Container Deployment on AWS using Cloud Native Buildpacks

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![AWS EC2](https://img.shields.io/badge/AWS-EC2%20Ubuntu%2022.04-orange.svg)](https://aws.amazon.com/)
[![Docker](https://img.shields.io/badge/Docker-Container%20Engine-blue.svg)](https://www.docker.com/)
[![CNCF Buildpacks](https://img.shields.io/badge/CNCF-Buildpacks%20Pack%20CLI-green.svg)](https://buildpacks.io/)

Project Maintainer: **Sumbul Zahra**

---

## 📌 Architecture Overview

![AWS DevOps Buildpacks Architecture](docs/architecture.png.jfif)

This repository demonstrates how to build and deploy a production-ready Python/Django container on **AWS EC2** using **Cloud Native Buildpacks (CNCF Pack CLI)** without writing or maintaining `Dockerfiles`.

---
> 🎓 **New to Cloud Native Buildpacks or AWS?**  
> Check out the [RESOURCES.md](RESOURCES.md) file for prerequisites, learning links, and beginner-friendly troubleshooting steps.
---

## 🎯 Technical Highlights

* **100% Dockerfile-Free:** Automatically detects runtime dependencies using `gcr.io/buildpacks/builder:v1`.
* **Standardized OCI Images:** Creates secure, minimal, OCI-compliant container layers.
* **AWS EC2 Infrastructure:** Configured Security Group ingress rules (Ports `22` and `8080`).
* **Real-World System Troubleshooting:** Managed storage allocation using `growpart` and `resize2fs` on EC2, and optimized Docker storage via `docker system prune`.

---

## 🧰 Repository Structure

```text
django-buildpacks-aws-deployment/
├── app/                    # Django application source code
│   ├── Procfile            # Gunicorn process declaration for Buildpacks
│   └── requirements.txt    # Application dependencies
├── docs/
│   └── architecture.png    # High-level architecture diagram
├── scripts/
│   └── setup-ec2.sh        # Bash script to automate host dependencies & Pack CLI setup
├── .gitignore
├── LICENSE
└── README.md
```

🚀 Quick Start Guide
1. Provision & Setup EC2 Instance
Launch an Ubuntu 22.04 LTS EC2 instance on AWS.

2. Allow Ingress Traffic: SSH (22) and Custom TCP (8080).

3. SSH into your server and run the setup script:

```Bash
git clone [https://github.com/Sumbulzahra/django-buildpacks-aws-deployment.git](https://github.com/Sumbulzahra/django-buildpacks-aws-deployment.git)
cd django-buildpacks-aws-deployment
chmod +x scripts/setup-ec2.sh
./scripts/setup-ec2.sh
```

2. Build Container Image with Pack CLI
Build the OCI container image directly from source code:

```Bash
cd app
pack build django-buildpack-app --builder gcr.io/buildpacks/builder:v1
```

3. Run the Container
Run your application container on port 8080:

```Bash
docker run -d -p 8080:8080 --name django-app django-buildpack-app
```

Access your web service at http://<YOUR-EC2-PUBLIC-IP>:8080.

🛠 Real-World Troubleshooting & Optimization
. Storage Space Bottlenecks: Resolved disk quota exceeded during multi-layer image builds by expanding host EBS volume partitions (growpart /dev/nvme0n1 1 and resize2fs /dev/nvme0n1p1).

. Cache Management: Pruned dangling build caches using docker system prune -a and pack cache clean.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
