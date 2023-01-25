# nvim-dap-tab
Keep [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) in a separate tab

This simple extension can be useful if you need to keep existing tabs untouched by debugging steps.

After introducing `switchbuf` strategies in [nvim-dap](https://github.com/mfussenegger/nvim-dap) we need to set it to `uselast`
to allow nvim-dap-tab to work correctly. See `:help dap.defaults`.

After run
```lua
require(dap-tab).setup()
```
dap-ui interface will be opened in a special tab (the new if it did not exist before) after each stop on a breakpoint.

There is no defined keymap but you can use the following functions in own maps:
- `require(dap-tab).verboseGoToDebugWin()`
- `require(dap-tab).closeDebugWin()`
