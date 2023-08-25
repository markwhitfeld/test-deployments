# Deployments Repository Documentation

Welcome to the `deployments` repository! This repository serves as the central hub for managing preview deployments of interconnected services within our modern multi-service applications. This README provides a guide to understanding the repository structure, workflows, and how to effectively manage preview deployments.

## Table of Contents

- [Background and Challenges](#background-and-challenges)
- [Solution Overview](#solution-overview)
- [Repository Structure](#repository-structure)
- [Workflow](#workflow)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Contact](#contact)

## Background and Challenges

In modern multi-service applications, efficiently managing preview deployments across interconnected services is crucial. Challenges such as accurate references, automation, and maintaining consistency have led to the creation of the `deployments` repository. This solution aims to streamline development processes and improve preview deployment efficiency.

## Solution Overview

The `deployments` repository acts as a central point for managing deployment metadata and automating preview deployments. It enables accurate reference management, synchronization, and efficient workflows across interconnected services.

## Repository Structure

The repository contains the following key components:

- **`metadata/repositories.json`**: This file holds references to service branches and commit hashes. It's dynamically updated to maintain accurate deployment information.

- **Workflows**:
  - **Service Workflows**: Service repositories trigger workflows to provide deployment information to the `deployments` repository.
  - **`deployments` Workflow**: This workflow updates the `repositories.json` file, commits changes, and creates corresponding PRs for deployment.

## Workflow

1. Make necessary changes to your service repository (e.g., updating Docker images).
2. Your service's GitHub Actions workflow notifies the `deployments` repository with deployment information.
3. The `deployments` repository workflow updates the `repositories.json` file with the provided data, commits changes to a dedicated branch, and creates a PR.
4. The PR triggers deployment to the specified environment based on checkboxes in the PR description.
5. The deployment process is automated based on checkboxes and updated PR heads.

## Getting Started

To contribute to the `deployments` repository or initiate preview deployments:

1. Clone the `deployments` repository to your local environment.
2. Set up the necessary environment variables for accurate references.
3. Make changes to the `repositories.json` file based on service deployment updates.
4. Push your changes to the appropriate branch.
5. Create a pull request in the `deployments` repository to initiate deployments and environment updates.

## Contributing

We welcome contributions to improve the preview deployment process. Feel free to fork this repository, make changes, and create pull requests. Ensure that your changes adhere to the established workflows and standards.

## Contact

If you have questions or need assistance, please contact our team using the #devops slack channel. We're here to help you with your preview deployments and ensure smooth development processes.

Thank you for your contributions to maintaining efficient preview deployments in our multi-service applications!


## Note
_Very rough AI generated first draft using the RFC as an input and requesting with the following prompt:_
> Please write a readme documentation file for the `deployments` repository that, would be useful to a developer or devops engineer in order to understand how the process works. Almost like a form of user documentation.
Write this documentation given the following as the RFC describing the intended structure, behaviour and workflows: