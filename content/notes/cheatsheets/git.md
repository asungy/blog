+++
draft = false
title = 'Git'
readingTime = false
+++

## Displaying last touched branches

I tend to create a lot of prototyping branches for features I'm working on, especially ones that require more complex implementations. Over the course of a few months, I can generate a dozen or so branches, most of which are stale. I asked ChatGPT to come up with a command to list all of the branches that I last touched so that I can look into deleting them. This is what it came up with (for checking remote branches):

```bash
for branch in $(git for-each-ref --format='%(refname:short)' refs/remotes/); do
  email=$(git log -1 --pretty=format:'%ae' "$branch")
  if [ "$email" = "$(git config user.email)" ]; then
    echo "$branch"
  fi
done
```

And this does the same except for local branches:
```bash
for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  email=$(git log -1 --pretty=format:'%ae' "$branch")
  if [ "$email" = "$(git config user.email)" ]; then
    echo "$branch"
  fi
done
```
