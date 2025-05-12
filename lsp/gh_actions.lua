return {
  cmd = { 'gh-actions-language-server', '--stdio' },
  -- the `root_markers` with `workspace_required` prevent attaching to every yaml file
  filetypes = { 'yaml' },
  root_markers = {
    '.github/workflows',
    '.forgejo/workflows',
    '.gitea/workflows',
  },
  workspace_required = true,
  capabilities = {
    workspace = {
      didChangeWorkspaceFolders = {
        dynamicRegistration = true,
      },
    },
  },
}
