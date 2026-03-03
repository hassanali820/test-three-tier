# 🚀 Three-Tier Dockerized Application with Jenkins CI/CD

## 📌 Project Overview

This project is a full-stack three-tier application consisting of:

* **Frontend:** React
* **Backend:** Node.js (Express)
* **Database:** PostgreSQL
* **Containerization:** Docker & Docker Compose
* **CI/CD:** Jenkins (Declarative Pipeline)
* **Registry:** Docker Hub
* **Deployment:** AWS EC2 (Production)

The application is automatically built and deployed to production when code is pushed to the `main` branch.

---

## 🏗️ Architecture

GitHub → Jenkins → Docker Build → Docker Hub → Production Deployment

All services run as separate Docker containers using Docker Compose.

---

## 📂 Project Structure

```
.
├── frontend/
├── backend/
├── docker-compose.yml
├── Jenkinsfile
└── README.md
```

---

## ⚙️ Prerequisites

Make sure you have installed:

* Docker
* Docker Compose
* Git

---

## 🐳 Run Project Locally (Without Jenkins)

### 1️⃣ Clone Repository

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### 2️⃣ Build and Start Containers

```bash
docker compose up -d --build
```

### 3️⃣ Access Application

Frontend:

```
http://localhost:3000
```

Backend API:

```
http://localhost:5000
```

---

## 🛑 Stop Containers

```bash
docker compose down
```

---

## 🔁 CI/CD Pipeline (Jenkins)

The project uses Jenkins Declarative Pipeline.

### Trigger

* Push to `main` branch
* GitHub Webhook triggers Jenkins automatically

### Pipeline Stages

1. Checkout Code
2. Build Docker Images
3. Push Images to Docker Hub
4. Deploy Containers to Production

---

## 🐙 Docker Hub Images

Frontend:

```
yourdockerhub/react-app:latest
```

Backend:

```
yourdockerhub/node-app:latest
```

---

## 🌍 Production Deployment

Production runs on AWS EC2.

Deployment is fully automated using Jenkins.
Whenever new code is pushed to `main`, production updates automatically.

---

## 🧠 What This Project Demonstrates

* Docker containerization
* Multi-service architecture
* CI/CD automation
* GitHub Webhook integration
* Production deployment strategy
* DevOps workflow implementation

---

## 👨‍💻 Author

Hassan Mehmood
DevOps & Cloud Enthusiast

---
