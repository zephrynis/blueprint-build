# Blueprint Export Action
This GitHub Action can be used to export the source code of a blueprint addon to a .blueprint file

## How to Use
The action has one output, FILE. This can be used in a workflow with the following variable: `${{ steps.blueprint_build.outputs.FILE }}`

An example of this in use can be found [here](https://github.com/zephrynis/ptero-sidebar/blob/main/.github/workflows/export_ext.yml).
