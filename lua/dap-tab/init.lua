local dap = require 'dap'
local dapui = require 'dapui'
local vim = vim
local api = vim.api

local debugWinId = nil

local dapTab = {}

function dapTab.goToDebugWin()
  if nil ~= debugWinId and api.nvim_win_is_valid(debugWinId) then
    api.nvim_set_current_win(debugWinId)

    return true
  end
end

function dapTab.verboseGoToDebugWin()
  if dapTab.goToDebugWin() then
    return
  end

  vim.notify('Debug window is not defined yet.')
end

function dapTab.closeDebugWin()
  if nil == debugWinId then
    return
  end

  if not api.nvim_win_is_valid(debugWinId) then
    debugWinId = nil
    return
  end

  local tabNr = api.nvim_tabpage_get_number(api.nvim_win_get_tabpage(debugWinId))
  dapui.close({})
  vim.cmd.tabclose(tabNr)
end

local function openTabForThread()
  if dapTab.goToDebugWin() then
    return
  end

  vim.cmd.tabedit '%'
  vim.wo.scrolloff = 10

  debugWinId = vim.fn.win_getid()
  dapui.open({})
end

function dapTab.setup()
  dap.listeners.before['event_stopped']['arctgx-dap-tab'] = openTabForThread
end

return dapTab
