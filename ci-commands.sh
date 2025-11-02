# cd into project
cd /workspaces/java-app

# 1) Commit & push changes
git add .
git commit -m "Add Dockerfile and CI workflow for build/scan/push" || echo "No changes to commit"

# If a remote 'origin' already exists:
git push origin main || {

  # If no remote, create repo and push (requires gh auth login)
  echo "No remote detected — creating repo with gh and pushing"
  gh auth status || { echo "Please run 'gh auth login' to authenticate"; exit 1; }
  gh repo create bsalunke/java-app --public --source=. --remote=origin --push
}

# 2) Ensure secrets (only if you need to set them via CLI)
# gh secret set DOCKERHUB_USERNAME --body "bsalunke"
# gh secret set DOCKERHUB_TOKEN --body "<your-dockerhub-token>"

# 3) Trigger workflow manually (optional, workflow file: .github/workflows/docker-image.yml)
# This will queue the workflow on the main ref without a new push.
gh workflow run docker-image.yml --ref main

# 4) Watch workflow runs / logs
gh run list --workflow=docker-image.yml
# pick run id from the list and watch logs:
# gh run watch <run-id>
