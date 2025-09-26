# GitHub Pages Setup Instructions

Follow these steps to enable GitHub Pages for the LeakIX Dark Theme example
site.

## Prerequisites

- Repository must be public (GitHub Pages is free for public repos)
- You must have admin access to the repository
- The CI workflow must be properly configured (already done in this repo)

## Step-by-Step Setup

### 1. Access Repository Settings

1. Go to your GitHub repository: `https://github.com/LeakIX/leakix-dark-theme`
2. Click on the **Settings** tab (located at the top of the repository page)
3. Scroll down to find the **Pages** section in the left sidebar

### 2. Configure GitHub Pages Source

1. In the **Pages** settings section
2. Under **Source**, select **"GitHub Actions"** from the dropdown
   - Do NOT select "Deploy from a branch"
   - The "GitHub Actions" option enables deployment via CI/CD

### 3. Verify Workflow Permissions

1. Still in **Settings**, go to **Actions** > **General** in the left sidebar
2. Scroll down to **Workflow permissions**
3. Ensure the following settings:
   - **Workflow permissions**: Select "Read and write permissions"
   - **Allow GitHub Actions to create and approve pull requests**: ✅ Checked

### 4. Enable Pages in Actions

1. Go to **Settings** > **Pages** again
2. Make sure **Source** is set to **"GitHub Actions"**
3. No additional configuration is needed - the workflow is already set up

### 5. Trigger the First Deployment

The site will be automatically deployed when:

- You push to the `main` branch
- The CI workflow completes successfully

To trigger the first deployment:

1. Make any small change (like updating README.md)
2. Commit and push to `main` branch:
   ```bash
   git add .
   git commit -m "docs: trigger initial GitHub Pages deployment"
   git push origin main
   ```

### 6. Monitor Deployment

1. Go to the **Actions** tab in your repository
2. You should see a workflow run for "CI"
3. Wait for it to complete (usually 2-3 minutes)
4. Once complete, the site will be available at:
   **https://leakix.github.io/leakix-dark-theme/**

### 7. Verify Deployment

1. After the workflow completes, go back to **Settings** > **Pages**
2. You should see: "Your site is published at
   https://leakix.github.io/leakix-dark-theme/"
3. Click the link to view your live site

## Troubleshooting

### Workflow Fails

If the GitHub Actions workflow fails:

1. Check the **Actions** tab for error details
2. Common issues:
   - Insufficient permissions (fix in step 3 above)
   - Hugo build errors (check the build logs)
   - Missing dependencies (should be handled automatically)

### Site Not Updating

If changes don't appear on the live site:

1. Verify the workflow completed successfully
2. Clear your browser cache
3. Check if you pushed to the correct branch (`main`)

### 404 Errors

If you get 404 errors:

1. Ensure GitHub Pages is enabled (step 2)
2. Verify the base URL in the workflow matches your GitHub Pages URL
3. Wait a few minutes for DNS propagation

## Custom Domain (Optional)

To use a custom domain:

1. In **Settings** > **Pages**
2. Under **Custom domain**, enter your domain (e.g., `theme.leakix.net`)
3. Check **Enforce HTTPS**
4. Update your domain's DNS records to point to GitHub Pages:
   ```
   CNAME record: your-domain.com -> leakix.github.io
   ```

## Security Notes

- The workflow uses GitHub's built-in `GITHUB_TOKEN`
- No additional secrets are required
- All permissions are minimal and scoped appropriately

## Expected Results

Once configured, you'll have:

- ✅ Automatic deployment on every push to `main`
- ✅ Live demo site at `https://leakix.github.io/leakix-dark-theme/`
- ✅ PR preview deployments (configured separately)
- ✅ Formatted code and fixed whitespace on every deployment

The example site will showcase:

- LeakIX Dark Theme with authentic colors
- All theme features and components
- AI integration documentation
- Complete usage examples

## Need Help?

If you encounter issues:

1. Check the [GitHub Pages documentation](https://docs.github.com/en/pages)
2. Review the workflow logs in the Actions tab
3. Ensure all prerequisites are met
4. Try the troubleshooting steps above

The site will be automatically updated whenever changes are pushed to the main
branch.
