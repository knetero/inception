# Multi-Container Web Infrastructure with Docker

A production-grade web stack implementation using Docker Compose, featuring WordPress, NGINX, and MariaDB with secure container orchestration and persistent storage.

[![Docker](https://img.shields.io/badge/Docker-24.0-blue)](https://www.docker.com)
[![WordPress](https://img.shields.io/badge/WordPress-6.3-21759B)](https://wordpress.org)

## Architecture Overview

**Core Components**  
- 🚀 NGINX reverse proxy with TLS termination
- 📝 WordPress CMS with custom configuration
- 🗄️ MariaDB relational database
- 🔒 Isolated container network architecture

## Key Features

### Infrastructure Management
- Multi-service orchestration via Docker Compose
- Environment-specific configuration profiles
- Automated container health checks
- Resource constraints (CPU/Memory limits)

### Data Persistence
- Named volumes for:
  - MySQL database storage
  - WordPress content files
  - NGINX SSL certificates
- Regular volume backups to host system

## Tech Stack

**Core Technologies**  
- Docker 24.0+
- Docker Compose 2.20+
- NGINX 1.25+
- WordPress 6.3+
- MariaDB 11.0+
