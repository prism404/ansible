# 🚀 Projet Mise en Production et Supervision avec Ansible

## ✅ Étape 1 – Configuration de l’environnement et de la machine cible

## 📝 **1. Préparation de l’environnement Ansible**

### 🔧 **1.1. Création du projet et Dockerfile**

```bash
mkdir ansible-project
cd ansible-project
```

Création du fichier Dockerfile

```bash
touch Dockerfile
```

Construction de l'image Docker

```bash
docker build -t ansible-container .
```

Lancer Docker
```bash
docker run -it --rm -v ${PWD}:/ansible ansible-container bash
```

VM IP : 10.0.2.15

