-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jacksonzamorano/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/home/jacksonzamorano/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/home/jacksonzamorano/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/home/jacksonzamorano/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jacksonzamorano/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vformat\fconform\frequire6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vformat\fconform\frequire›\4\1\0\5\0#\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\22\0005\1\25\0005\2\24\0=\2\26\1=\1\23\0006\0\27\0009\0\28\0009\0\29\0'\2\30\0'\3\31\0003\4 \0B\0\4\0016\0\27\0009\0\28\0009\0\29\0'\2!\0'\3\31\0003\4\"\0B\0\4\1K\0\1\0\0\6v\0\14<leader>.\6n\bset\vkeymap\bvim\17prepend_args\1\0\1\17prepend_args\0\1\2\0\0\18--tab-width=4\rprettier\15formatters\21formatters_by_ft\1\0\1\21formatters_by_ft\0\ago\1\2\0\0\ngofmt\tjson\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\trust\1\2\0\0\frustfmt\blua\1\0\b\15typescript\0\tjson\0\20javascriptreact\0\20typescriptreact\0\ago\0\15javascript\0\blua\0\trust\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nù\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\17\3=\3\19\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\6\14lualine_a\0\14lualine_z\0\14lualine_y\0\14lualine_x\0\14lualine_c\0\14lualine_b\0\1\2\0\0\tmode\1\0\3\18icons_enabled\2\rsections\0\ntheme\fsonokai\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvimN\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\2¿\1\0\1\20layout_strategy\rvertical\25lsp_document_symbols≤\3\1\2\n\0\26\0O6\2\0\0'\4\1\0B\2\2\0025\3\2\0=\1\3\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0003\b\t\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\n\0003\b\v\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\f\0003\b\r\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\14\0003\b\15\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\16\0003\b\17\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\18\0003\b\19\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\20\0003\b\21\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\22\0003\b\23\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\24\0003\b\25\0004\t\0\0B\4\5\0012\0\0ÄK\0\1\0\0\14<leader>r\0\ama\0\a[d\0\a]d\0\amd\0\amh\0\amr\0\agi\0\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\2\nremap\1\vbuffer\0\22telescope.builtin\frequireI\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\1¿\0¿\14on_attach\1\0\1\14on_attach\0\nsetup¸\1\0\1\n\0\14\0\0229\1\0\0009\1\1\0016\2\3\0009\2\4\2'\4\5\0009\5\0\0009\5\1\0059\5\2\0055\6\a\0005\a\6\0=\a\b\0065\a\t\0004\b\3\0006\t\3\0009\t\n\t9\t\v\t>\t\1\b=\b\f\a=\a\r\6B\2\4\2=\2\2\1K\0\1\0\14workspace\flibrary\15VIMRUNTIME\benv\1\0\2\20checkThirdParty\1\flibrary\0\fruntime\1\0\2\fruntime\0\14workspace\0\1\0\1\fversion\vLuaJIT\nforce\20tbl_deep_extend\bvim\bLua\rsettings\vconfigô\1\1\0\5\2\t\0\14-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0023\3\4\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\1¿\0¿\rsettings\bLua\1\0\1\bLua\0\fon_init\0\14on_attach\1\0\3\14on_attach\0\rsettings\0\fon_init\0\nsetup\vlua_ls‘\1\0\0\6\2\n\0\14-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\1¿\0¿\rsettings\15typescript\1\0\1\15typescript\0\21workspaceSymbols\1\0\1\21workspaceSymbols\0\1\0\1\26excludeLibrarySymbols\2\14on_attach\1\0\2\14on_attach\0\rsettings\0\nsetup\nts_ls“\1\1\0\a\0\14\0\0253\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0016\2\1\0'\4\5\0B\2\2\0029\2\4\0025\4\f\0005\5\b\0003\6\6\0>\6\1\0053\6\a\0=\6\t\0053\6\n\0=\6\v\5=\5\r\4B\2\2\0012\0\0ÄK\0\1\0\rhandlers\1\0\1\rhandlers\0\nts_ls\0\vlua_ls\1\0\2\nts_ls\0\vlua_ls\0\0\0\20mason-lspconfig\nsetup\nmason\14lspconfig\frequire\0\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n>\0\1\4\0\3\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0B\1\2\1K\0\1\0\15lsp_expand\fluasnip\frequire¨\2\0\2\4\0\2\0\0055\2\0\0009\3\1\0018\3\3\2=\3\1\1L\1\2\0\tkind\1\0\25\18TypeParameter\aTp\rOperator\aop\nEvent\aEv\vStruct\aSt\rConstant\6c\15EnumMember\6m\vFolder\aDi\14Reference\bref\tFile\aFi\nColor\aCo\fSnippet\a<>\fKeyword\aKe\tEnum\aEn\nValue\aVa\tUnit\6u\rProperty\6f\vModule\aMo\14Interface\aIf\nClass\aCl\rVariable\6v\nField\6f\16Constructor\aCo\rFunction\aFu\vMethod\aMe\tText\6\"Ö\4\1\0\b\0\27\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\0035\4\n\0=\4\v\0035\4\15\0009\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\16\0049\5\f\0009\5\17\5B\5\1\2=\5\18\0049\5\f\0009\5\19\5B\5\1\2=\5\20\0049\5\f\0009\5\21\5B\5\1\2=\5\22\4=\4\f\0035\4\24\0003\5\23\0=\5\25\4=\4\26\3B\1\2\1K\0\1\0\15formatting\vformat\1\0\1\vformat\0\0\v<Down>\21select_next_item\t<Up>\21select_prev_item\14<C-Space>\rcomplete\n<Tab>\1\0\4\n<Tab>\0\t<Up>\0\14<C-Space>\0\v<Down>\0\1\0\1\vselect\2\fconfirm\fmapping\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\fsources\1\0\1\tname\rnvim_lsp\fsnippet\1\0\6\fmapping\0\15completion\0\15formatting\0\14preselect\titem\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n∂\2\0\1\t\0\19\0+5\1\0\0=\0\1\0016\2\2\0'\4\3\0B\2\2\0026\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\b\0009\a\t\0029\a\n\a9\a\v\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\f\0009\a\r\0029\a\14\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\15\0009\a\r\0029\a\16\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\17\0009\a\r\0029\a\18\a\18\b\1\0B\3\5\1K\0\1\0\vremove\14<leader>d\vrename\14<leader>r\vcreate\afs\14<leader>a\tedit\topen\tnode\t<CR>\6n\bset\vkeymap\bvim\18nvim-tree.api\frequire\vbuffer\1\0\1\vbuffer\0‰\1\1\0\5\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0\26:NvimTreeFindFile<CR>\15<leader>fd\23:NvimTreeFocus<CR>\15<leader>fe\6n\bset\vkeymap\bvim\14on_attach\1\0\1\14on_attach\0\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\3\14highlight\0\17auto_install\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  sonokai = {
    config = { "\27LJ\2\nØ\1\0\0\3\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\24colorscheme sonokai\bcmd\26sonokai_enable_italic\31sonokai_better_performance\vshusia\18sonokai_style\6g\bvim\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\1\fkeymaps\0\1\0\1\22accept_suggestion\f<S-Tab>\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\15find_filesP\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\2\20layout_strategy\rvertical\18sort_lastused\2\fbuffersC\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\14live_grepW\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\"lsp_dynamic_workspace_symbolsÇ\6\1\0\t\0(\0J6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\21\0005\5\r\0005\6\v\0005\a\6\0009\b\5\0=\b\a\a9\b\5\0=\b\b\a9\b\t\0=\b\n\a=\a\f\6=\6\14\0055\6\15\0=\6\16\0055\6\18\0005\a\17\0=\a\19\6=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\5=\5\26\4B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2\27\2'\4\25\0B\2\2\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5 \0003\6!\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5\"\0003\6#\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5$\0003\6%\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5&\0003\6'\0004\a\0\0B\2\5\0012\0\0ÄK\0\1\0\0\15<leader>wr\0\15<leader>fg\0\6\\\0\15<leader>fa\6n\bset\vkeymap\bvim\19load_extension\15extensions\bfzf\1\0\1\bfzf\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\rdefaults\1\0\2\15extensions\0\rdefaults\0\19layout_configs\rvertical\1\0\1\rvertical\0\1\0\1\nwidth\4\0ÄÄÄˇ\3\fpreview\1\0\1\15treesitter\1\rmappings\1\0\3\19layout_configs\0\fpreview\0\rmappings\0\6i\1\0\1\6i\0\n<c-d>\18delete_buffer\n<c-q>\14<leader>q\1\0\3\n<c-q>\0\14<leader>q\0\n<c-d>\0\nclose\nsetup\14telescope\22telescope.builtin\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n]\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/jacksonzamorano/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\3\14highlight\0\17auto_install\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\bvim6\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\15references\bbuf\blsp\bvim2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vrename\bbuf\blsp\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\19signature_help\bbuf\blsp\bvim5\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\15open_float\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_next\15diagnostic\bvim4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\14goto_prev\15diagnostic\bvim7\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\16code_action\bbuf\blsp\bvimN\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\2¿\1\0\1\20layout_strategy\rvertical\25lsp_document_symbols≤\3\1\2\n\0\26\0O6\2\0\0'\4\1\0B\2\2\0025\3\2\0=\1\3\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0003\b\t\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\n\0003\b\v\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\f\0003\b\r\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\14\0003\b\15\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\16\0003\b\17\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\18\0003\b\19\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\20\0003\b\21\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\22\0003\b\23\0\18\t\3\0B\4\5\0016\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\24\0003\b\25\0004\t\0\0B\4\5\0012\0\0ÄK\0\1\0\0\14<leader>r\0\ama\0\a[d\0\a]d\0\amd\0\amh\0\amr\0\agi\0\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\2\nremap\1\vbuffer\0\22telescope.builtin\frequireI\0\1\5\2\3\0\b-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3B\1\2\1K\0\1\0\1¿\0¿\14on_attach\1\0\1\14on_attach\0\nsetup¸\1\0\1\n\0\14\0\0229\1\0\0009\1\1\0016\2\3\0009\2\4\2'\4\5\0009\5\0\0009\5\1\0059\5\2\0055\6\a\0005\a\6\0=\a\b\0065\a\t\0004\b\3\0006\t\3\0009\t\n\t9\t\v\t>\t\1\b=\b\f\a=\a\r\6B\2\4\2=\2\2\1K\0\1\0\14workspace\flibrary\15VIMRUNTIME\benv\1\0\2\20checkThirdParty\1\flibrary\0\fruntime\1\0\2\fruntime\0\14workspace\0\1\0\1\fversion\vLuaJIT\nforce\20tbl_deep_extend\bvim\bLua\rsettings\vconfigô\1\1\0\5\2\t\0\14-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0023\3\4\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\1¿\0¿\rsettings\bLua\1\0\1\bLua\0\fon_init\0\14on_attach\1\0\3\14on_attach\0\rsettings\0\fon_init\0\nsetup\vlua_ls‘\1\0\0\6\2\n\0\14-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\0025\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\1¿\0¿\rsettings\15typescript\1\0\1\15typescript\0\21workspaceSymbols\1\0\1\21workspaceSymbols\0\1\0\1\26excludeLibrarySymbols\2\14on_attach\1\0\2\14on_attach\0\rsettings\0\nsetup\nts_ls“\1\1\0\a\0\14\0\0253\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0016\2\1\0'\4\5\0B\2\2\0029\2\4\0025\4\f\0005\5\b\0003\6\6\0>\6\1\0053\6\a\0=\6\t\0053\6\n\0=\6\v\5=\5\r\4B\2\2\0012\0\0ÄK\0\1\0\rhandlers\1\0\1\rhandlers\0\nts_ls\0\vlua_ls\1\0\2\nts_ls\0\vlua_ls\0\0\0\20mason-lspconfig\nsetup\nmason\14lspconfig\frequire\0\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vformat\fconform\frequire6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vformat\fconform\frequire›\4\1\0\5\0#\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\22\0005\1\25\0005\2\24\0=\2\26\1=\1\23\0006\0\27\0009\0\28\0009\0\29\0'\2\30\0'\3\31\0003\4 \0B\0\4\0016\0\27\0009\0\28\0009\0\29\0'\2!\0'\3\31\0003\4\"\0B\0\4\1K\0\1\0\0\6v\0\14<leader>.\6n\bset\vkeymap\bvim\17prepend_args\1\0\1\17prepend_args\0\1\2\0\0\18--tab-width=4\rprettier\15formatters\21formatters_by_ft\1\0\1\21formatters_by_ft\0\ago\1\2\0\0\ngofmt\tjson\1\2\0\0\rprettier\20javascriptreact\1\2\0\0\rprettier\20typescriptreact\1\2\0\0\rprettier\15typescript\1\2\0\0\rprettier\15javascript\1\2\0\0\rprettier\trust\1\2\0\0\frustfmt\blua\1\0\b\15typescript\0\tjson\0\20javascriptreact\0\20typescriptreact\0\ago\0\15javascript\0\blua\0\trust\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: sonokai
time([[Config for sonokai]], true)
try_loadstring("\27LJ\2\nØ\1\0\0\3\0\b\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\24colorscheme sonokai\bcmd\26sonokai_enable_italic\31sonokai_better_performance\vshusia\18sonokai_style\6g\bvim\0", "config", "sonokai")
time([[Config for sonokai]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\15find_filesP\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\2\20layout_strategy\rvertical\18sort_lastused\2\fbuffersC\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\14live_grepW\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\20layout_strategy\rvertical\"lsp_dynamic_workspace_symbolsÇ\6\1\0\t\0(\0J6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\21\0005\5\r\0005\6\v\0005\a\6\0009\b\5\0=\b\a\a9\b\5\0=\b\b\a9\b\t\0=\b\n\a=\a\f\6=\6\14\0055\6\15\0=\6\16\0055\6\18\0005\a\17\0=\a\19\6=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\5=\5\26\4B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2\27\2'\4\25\0B\2\2\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5 \0003\6!\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5\"\0003\6#\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5$\0003\6%\0004\a\0\0B\2\5\0016\2\28\0009\2\29\0029\2\30\2'\4\31\0'\5&\0003\6'\0004\a\0\0B\2\5\0012\0\0ÄK\0\1\0\0\15<leader>wr\0\15<leader>fg\0\6\\\0\15<leader>fa\6n\bset\vkeymap\bvim\19load_extension\15extensions\bfzf\1\0\1\bfzf\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\rdefaults\1\0\2\15extensions\0\rdefaults\0\19layout_configs\rvertical\1\0\1\rvertical\0\1\0\1\nwidth\4\0ÄÄÄˇ\3\fpreview\1\0\1\15treesitter\1\rmappings\1\0\3\19layout_configs\0\fpreview\0\rmappings\0\6i\1\0\1\6i\0\n<c-d>\18delete_buffer\n<c-q>\14<leader>q\1\0\3\n<c-q>\0\14<leader>q\0\n<c-d>\0\nclose\nsetup\14telescope\22telescope.builtin\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n]\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nù\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\17\3=\3\19\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\6\14lualine_a\0\14lualine_z\0\14lualine_y\0\14lualine_x\0\14lualine_c\0\14lualine_b\0\1\2\0\0\tmode\1\0\3\18icons_enabled\2\rsections\0\ntheme\fsonokai\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n∂\2\0\1\t\0\19\0+5\1\0\0=\0\1\0016\2\2\0'\4\3\0B\2\2\0026\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\b\0009\a\t\0029\a\n\a9\a\v\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\f\0009\a\r\0029\a\14\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\15\0009\a\r\0029\a\16\a\18\b\1\0B\3\5\0016\3\4\0009\3\5\0039\3\6\3'\5\a\0'\6\17\0009\a\r\0029\a\18\a\18\b\1\0B\3\5\1K\0\1\0\vremove\14<leader>d\vrename\14<leader>r\vcreate\afs\14<leader>a\tedit\topen\tnode\t<CR>\6n\bset\vkeymap\bvim\18nvim-tree.api\frequire\vbuffer\1\0\1\vbuffer\0‰\1\1\0\5\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0\26:NvimTreeFindFile<CR>\15<leader>fd\23:NvimTreeFocus<CR>\15<leader>fe\6n\bset\vkeymap\bvim\14on_attach\1\0\1\14on_attach\0\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\1\fkeymaps\0\1\0\1\22accept_suggestion\f<S-Tab>\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n>\0\1\4\0\3\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0B\1\2\1K\0\1\0\15lsp_expand\fluasnip\frequire¨\2\0\2\4\0\2\0\0055\2\0\0009\3\1\0018\3\3\2=\3\1\1L\1\2\0\tkind\1\0\25\18TypeParameter\aTp\rOperator\aop\nEvent\aEv\vStruct\aSt\rConstant\6c\15EnumMember\6m\vFolder\aDi\14Reference\bref\tFile\aFi\nColor\aCo\fSnippet\a<>\fKeyword\aKe\tEnum\aEn\nValue\aVa\tUnit\6u\rProperty\6f\vModule\aMo\14Interface\aIf\nClass\aCl\rVariable\6v\nField\6f\16Constructor\aCo\rFunction\aFu\vMethod\aMe\tText\6\"Ö\4\1\0\b\0\27\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\0035\4\n\0=\4\v\0035\4\15\0009\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\16\0049\5\f\0009\5\17\5B\5\1\2=\5\18\0049\5\f\0009\5\19\5B\5\1\2=\5\20\0049\5\f\0009\5\21\5B\5\1\2=\5\22\4=\4\f\0035\4\24\0003\5\23\0=\5\25\4=\4\26\3B\1\2\1K\0\1\0\15formatting\vformat\1\0\1\vformat\0\0\v<Down>\21select_next_item\t<Up>\21select_prev_item\14<C-Space>\rcomplete\n<Tab>\1\0\4\n<Tab>\0\t<Up>\0\14<C-Space>\0\v<Down>\0\1\0\1\vselect\2\fconfirm\fmapping\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\fsources\1\0\1\tname\rnvim_lsp\fsnippet\1\0\6\fmapping\0\15completion\0\15formatting\0\14preselect\titem\fsnippet\0\fsources\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
