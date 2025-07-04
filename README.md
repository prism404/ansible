# Mise en Production avec Ansible

## Étape 1 – Configuration de l’environnement et de la machine cible

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

Lancer un container Docker basé sur cette image

```bash
docker run -it --rm -v ${PWD}:/ansible ansible-container bash
```
Connexion à la VM - IP : 10.0.2.15

```bash
ssh dangv@localhost -p 2222
```

Création de l'inventaire Ansible

```bash
nano inventory.ini
```

Ici, host.docker.internal permet au container Docker d’accéder au PC hôte qui redirige ensuite vers la VM Debian via le port 2222

```bash
[servers]
vm1 ansible_host=host.docker.internal ansible_port=2222 ansible_user=ton_utilisateur
```

Tests de connexion

```bash
ansible -i inventory.ini servers -m ping --ask-pass
```

Résultat attendu : un pong

Générer une clé publique 
```bash
ssh-keygen -t rsa -b 4096
```

Chiffrer mon vault

```bash
ansible-vault encrypt vault.yaml
```

Lancer le playbook

```bash
ansible-playbook -i inventory.ini setup.yml --ask-pass --ask-become-pass --ask-vault-pass
```

Tester la connexion SSH
```bash
ssh dangv@localhost -p 2222
```