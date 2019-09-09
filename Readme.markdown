DEPRECATED

What you may looking for is:

```
git submodule foreach "git fetch origin master &> /dev/null; git --no-pager log --oneline HEAD..origin/master"
```
