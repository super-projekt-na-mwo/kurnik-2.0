# ✨ Kurnik 2.0
Preliminary design of an application that looks like “kurnik.pl” website. Created for the project class of the course "Model-driven software development".

## 💡Description
Kurnik 2.0 is a web application akin to a social media platform. Its primary goal is to create a secure and welcoming environment where users can engage with others through gameplay, information exchange, and interactive reactions. The platform fosters a sense of community by enabling seamless interaction, ensuring both entertainment and meaningful social connections in a safe digital space.

## 🚀 Key Features
* Real-time multiplayer gaming with other users
* Social interactions: posting, commenting, and reactions
* Creating and managing friend groups

## 🌿 Git Branching Strategy
main – stable production version

develop – main branch for development

feature/* – branches for new features, merged into develop when complete

release/* – used for preparing production releases, allowing testing before merging into main

hotfix/* – for urgent fixes in production, merged into both main and develop

## 🛠️ Technology Stack
* Backend: Python
* Frontend: Angular
* Authentication & Authorization: Firebase Auth
* Database: (To be decided)
* Storage: (To be decided)
* Database Migration Tool: Alembic
* Message Broker?: RabbitMQ
* CI/CD: GitHub Actions
* Infrastructure: Google Firebase
* Monitoring & Logging: Prometheus, Grafana

## 📂 Project structure
```
/frontend   - frontend application code  
/backend    - backend application code  
/database   - database-related code  
/devops     - CI/CD configurations, Docker, Terraform
```
