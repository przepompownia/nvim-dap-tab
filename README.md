# nvim-dap-tab keep [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) in a separate tab

This simple extension can be useful if you need to keep existing tabs untouched by debugging steps.

After run
```lua
require(dap-tab).setup()
```
dap-ui interface will be opened in a special tab (the new if it did not exist before) after each stop on a breakpoint.

There is no defined keymap but you can use the following functions in own maps:
- `dapTab.verboseGoToDebugWin()`
- `dapTab.closeDebugWin()`
