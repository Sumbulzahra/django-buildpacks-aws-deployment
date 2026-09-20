# 📚 Learning Resources & Prerequisites

This guide is designed to help beginners and intermediate learners understand the tools, concepts, and troubleshooting steps used in this project.

---

## 📖 Recommended Learning Path

### 1. Cloud Native Buildpacks (CNCF)
* **Official Website:** [buildpacks.io](https://buildpacks.io/)
* **Pack CLI Installation Guide:** [buildpacks.io/docs/tools/pack](https://buildpacks.io/docs/tools/pack/)
* **Key Concept:** Learn how Buildpacks replace traditional `Dockerfiles` by automatically detecting application code and bundling runtimes into standard OCI images.

### 2. AWS EC2 & Networking Fundamentals
* **AWS EC2 Basics:** [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
* **Security Groups:** Ensure inbound traffic is enabled for:
  * **Port 22 (SSH):** For remote terminal access.
  * **Port 8080 (Custom TCP):** For accessing the containerized web application.

### 3. Docker Essentials
* **Get Started with Docker:** [Docker Docs](https://docs.docker.com/get-started/)
* **Key Commands Used:**
  * `docker run -d -p 8080:8080 --name django-app <image-name>`
  * `docker system prune -a` (for clearing unused build caches)

---

## 🛠 Prerequisites Checklist for Beginners

Before running this project, ensure you have:
1. An active **AWS Account** (Free Tier EC2 `t2.micro` or `t3.micro` is sufficient).
2. **SSH Client** (Terminal, MobaXterm, or VS Code Remote SSH) to connect to your EC2 instance.
3. Basic understanding of **Linux command line navigation** (`cd`, `ls`, `chmod`, `sudo`).

---

## ❓ Common Pitfalls & Solutions

| Issue | Cause | Solution |
| :--- | :--- | :--- |
| `Command 'pack' not found` | Pack CLI is not in system `PATH` | Run `sudo mv /tmp/pack /usr/local/bin/pack` as shown in `scripts/setup-ec2.sh`. |
| `Permission denied` on Docker | User not added to `docker` group | Execute `sudo usermod -aG docker $USER`, then log out and log back in via SSH. |
| `No space left on device` | Builder images and layers filled EBS volume | Resize your partition using `growpart` and `resize2fs`, or clean caches using `docker system prune -a`. |
