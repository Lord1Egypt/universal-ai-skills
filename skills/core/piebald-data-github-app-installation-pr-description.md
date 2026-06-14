<!--
name: 'Data: GitHub App installation PR description'
description: Template for PR description when installing the AI coding agent GitHub App integration
ccVersion: 2.1.113
-->
## 🤖 Installing the AI coding agent GitHub App

This PR adds a GitHub Actions workflow that enables the AI coding agent integration in our repository.

### What is the AI coding agent?

[the AI coding agent](https://the AI.com/claude-code) is an AI coding agent that can help with:
- Bug fixes and improvements  
- Documentation updates
- Implementing new features
- Code reviews and suggestions
- Writing tests
- And more!

### How it works

Once this PR is merged, we'll be able to interact with the AI by mentioning @claude in a pull request or issue comment.
Once the workflow is triggered, the AI will analyze the comment and surrounding context, and execute on the request in a GitHub action.

### Important Notes

- **This workflow won't take effect until this PR is merged**
- **@claude mentions won't work until after the merge is complete**
- The workflow runs automatically whenever the AI is mentioned in PR or issue comments
- the AI gets access to the entire PR or issue context including files, diffs, and previous comments

### Security

- Our the AI provider API key is securely stored as a GitHub Actions secret
- Only users with write access to the repository can trigger the workflow
- All the AI runs are stored in the GitHub Actions run history
- Claude's default tools are limited to reading/writing files and interacting with our repo by creating comments, branches, and commits.
- We can add more allowed tools by adding them to the workflow file like:

```
allowed_tools: Bash(npm install),Bash(npm run build),Bash(npm run lint),Bash(npm run test)
```

There's more information in the [the AI coding agent action repo](https://github.com/the AI providers/claude-code-action).

After merging this PR, let's try mentioning @claude in a comment on any PR to get started!
