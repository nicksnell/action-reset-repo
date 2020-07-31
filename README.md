# Reset Git Branch

Reset a specific branch to another. Useful if you need a specific branch to be reset to say master at given intervals. NOTE: this action performs a _reset_ on the repository and is **destructive** - you will lose any changes made to the branch being reset. Be sure this is what you want to do before running.

## Usage

Example Workflow using a schedule.

```yaml
name: Rest Dev Branch to Master at 1am each day
on:
  schedule:
    - cron: "0 1 * * *"
jobs:
  reset:
    name: Runner
    runs-on: ubuntu-latest
    steps:
      - name: Reset dev branch to master
        uses: nicksnell/action-reset-repo@master
        with:
          reset_branch: dev
```

## Inputs

| name | value | default | description |
| ---- | ----- | ------- | ----------- |
| github_token | string | | Token for the repo. Can be passed in using `${{ secrets.GITHUB_TOKEN }}`. |
| base_branch | string | 'master' | Branch to be used to reset too |
| reset_branch | string | - | Determines the branch to be reset |

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
