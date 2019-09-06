# Usage

Execute

```
path/to/git-submodule-update-checker.el
```

under a git repo with submodules.

# Implementation

1. Scans the ".gitmodules" file
2. For each submodules:
   1. `cd` to the submodule directory
   2. `git fetch origin master`
   3. Print `git log --oneline HEAD..origin/master` output

