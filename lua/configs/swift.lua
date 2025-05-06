-- Xcodebuild keymaps
vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
vim.keymap.set("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })

vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })

vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run Current Test Class" })
vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "Repeat Last Test Run" })

vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })

vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildPreviewGenerateAndShow<cr>", { desc = "Generate Preview" })
vim.keymap.set("n", "<leader>x<cr>", "<cmd>XcodebuildPreviewToggle<cr>", { desc = "Toggle Preview" })

vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

vim.api.nvim_create_autocmd("User", {
  pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
  callback = function(event)
    if event.data.cancelled then
      return
    end

    if event.data.success then
      require("trouble").close()
    elseif not event.data.failedCount or event.data.failedCount > 0 then
      if next(vim.fn.getqflist()) then
        require("trouble").open("quickfix")
      else
        require("trouble").close()
      end

      require("trouble").refresh()
    end
  end,
})

local function xcodebuild_device()
  if vim.g.xcodebuild_platform == "macOS" then
    return " macOS"
  end

  local deviceIcon = ""
  if vim.g.xcodebuild_platform:match("watch") then
    deviceIcon = "􀟤"
  elseif vim.g.xcodebuild_platform:match("tv") then
    deviceIcon = "􀡴 "
  elseif vim.g.xcodebuild_platform:match("vision") then
    deviceIcon = "􁎖 "
  end

  if vim.g.xcodebuild_os then
    return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
  end

  return deviceIcon .. " " .. vim.g.xcodebuild_device_name
end

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
--   group = "bufcheck",
--   pattern = "*.swift",
--   callback = function(ev)
--     local lines = #vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
--
--     if lines > 1 then
--       return
--     end
--
--     local filename = string.match(ev.file, "([^/]*)%.swift")
--     local name = filename
--
--     -- TODO: make sure this path leads to your folder with templates!!
--     local basepath = os.getenv("HOME") .. "/.config/nvim/templates/swift/"
--     local templates = { "View", "ViewModel", "Builder", "Router", "Tests", "Spec" }
--
--     local template
--     local cursor
--
--     for _, templateSuffix in ipairs(templates) do
--       if vim.endswith(filename, templateSuffix) then
--         template = vim.fn.readfile(basepath .. string.lower(templateSuffix) .. ".txt")
--         name = string.gsub(name, templateSuffix, "")
--         break
--       end
--     end
--
--     template = template or vim.fn.readfile(basepath .. "empty.txt")
--
--     for i = 1, #template do
--       template[i] = string.gsub(template[i], "{date}", os.date("%d/%m/%Y"))
--       template[i] = string.gsub(template[i], "{filename}", filename)
--       template[i] = string.gsub(template[i], "{name}", name)
--
--       if cursor == nil and string.find(template[i], "{cursor}") then
--         cursor = { i, tonumber(string.find(template[i], "{cursor}")) + 1 }
--       end
--       template[i] = string.gsub(template[i], "{cursor}", " ")
--     end
--
--     vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, template)
--
--     if cursor then
--       vim.api.nvim_win_set_cursor(0, cursor)
--     end
--
--     vim.cmd("w")
--   end,
-- })

vim.opt.autoread = true

-- refresh files if changed outside
vim.fn.timer_start(2000, function()
  vim.cmd("silent! checktime")
end, { ["repeat"] = -1 })
