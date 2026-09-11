<div align="center">

# NEO

**Neovim for TypeScript, Svelte, Astro and Go.**
Plain Lua on lazy.nvim, no distro, leader is <kbd>,</kbd>.

[![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat-square&logo=lua&logoColor=white)](https://www.lua.org)
[![lazy.nvim](https://img.shields.io/badge/plugins-lazy.nvim-blue?style=flat-square)](https://github.com/folke/lazy.nvim)
[![Catppuccin](https://img.shields.io/badge/theme-catppuccin%20macchiato-f5a97f?style=flat-square)](https://github.com/catppuccin/nvim)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

## ✨ Features

- **Fast start.** Everything lazy-loads on a key, command or event. Cold start is ~30 ms.
- **Web stack ready.** LSP, formatting and debugging for TS, Svelte, Astro, Tailwind, CSS and Go, installed by Mason on first run.
- **Format on save.** ESLint autofix, then Prettier / stylua / shfmt / gofmt via conform.nvim.
- **Modern treesitter.** nvim-treesitter `main` with textobjects, sticky context and auto-closing tags.
- **Copilot on demand.** Off by default, one key turns on inline suggestions and the blink.cmp source.
- **Small.** About 1.1k lines of Lua, one file per plugin area, no framework.

## 📦 Requirements

| Tool                                                                                           | Used by                           |
| ---------------------------------------------------------------------------------------------- | --------------------------------- |
| [Neovim](https://neovim.io) 0.12+                                                              | everything                        |
| git, make                                                                                      | lazy.nvim, fzf-native, LuaSnip    |
| node, go                                                                                       | language servers, prettier, gofmt |
| [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd)          | Telescope                         |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) (`brew install tree-sitter-cli`) | building parsers                  |
| [lazygit](https://github.com/jesseduffield/lazygit)                                            | `,g`                              |
| a [Nerd Font](https://www.nerdfonts.com)                                                       | icons                             |

## 🚀 Install

```sh
git clone git@github.com:ecelustka/neo.git ~/.config/nvim
nvim
```

lazy.nvim bootstraps itself, then Mason installs language servers, formatters
and the JS debug adapter. `:Lazy` and `:Mason` show progress.

## 🗂️ Layout

```
init.lua                    leader, requires config/*
lua/config/options.lua      vim options
lua/config/lazy.lua         lazy.nvim bootstrap, imports lua/plugins/*
lua/config/keymaps.lua      plugin-independent keymaps
lua/config/autocmds.lua     yank highlight, eslint fix + format on save
lua/plugins/*.lua           one plugin spec file per area
lua/blink_copilot_safe.lua  guard around the copilot completion source
```

Keymaps that belong to a plugin live in that plugin's spec under `keys`.

## 🔌 Plugins

| Area       | Plugins                                                                                                                                                                                                                                                                                                                    |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Colors     | [catppuccin](https://github.com/catppuccin/nvim)                                                                                                                                                                                                                                                                           |
| Completion | [blink.cmp](https://github.com/saghen/blink.cmp), [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [friendly-snippets](https://github.com/rafamadriz/friendly-snippets), [blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot)                                                                           |
| LSP        | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason](https://github.com/mason-org/mason.nvim), [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim), [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim), [lazydev](https://github.com/folke/lazydev.nvim) |
| Syntax     | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) `main`, [textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects), [context](https://github.com/nvim-treesitter/nvim-treesitter-context), [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                           |
| Formatting | [conform.nvim](https://github.com/stevearc/conform.nvim)                                                                                                                                                                                                                                                                   |
| Files      | [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim), [Telescope](https://github.com/nvim-telescope/telescope.nvim) + [fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim), [harpoon](https://github.com/ThePrimeagen/harpoon)                                                                  |
| Git        | [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim), [octo.nvim](https://github.com/pwntester/octo.nvim)                                                                                                                                                      |
| Debug      | [nvim-dap](https://github.com/mfussenegger/nvim-dap), [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui), [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)                                                                                                                                  |
| UI         | [lualine](https://github.com/nvim-lualine/lualine.nvim), [which-key](https://github.com/folke/which-key.nvim), [toggleterm](https://github.com/akinsho/toggleterm.nvim), [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                                                                        |
| Other      | [copilot.lua](https://github.com/zbirenbaum/copilot.lua), [swagger-preview](https://github.com/vinnymeller/swagger-preview.nvim)                                                                                                                                                                                           |

**Language servers:** astro · cssls · eslint · gopls · html · jsonls · lua_ls · marksman · stylelint_lsp · svelte · tailwindcss · ts_ls · yamlls

**Formatters:** prettier · stylua · shfmt · gofmt · terraform fmt

## ⌨️ Keymaps

Leader is <kbd>,</kbd>. Press it and wait for which-key.

<details open>
<summary><b>Editing</b></summary>

| Key                           | Action                                  |
| ----------------------------- | --------------------------------------- |
| `d` `x`                       | delete without touching the register    |
| `p` (visual)                  | paste without overwriting the register  |
| `,j` `,k`                     | move line or selection down / up        |
| `,n`                          | new vertical split                      |
| `<C-h/j/k/l>`                 | move between windows                    |
| `af` `if` `ac` `ic` `aa` `ia` | function / class / argument textobjects |

</details>

<details>
<summary><b>Find and navigate</b></summary>

| Key               | Action                                    |
| ----------------- | ----------------------------------------- |
| `,p`              | find files                                |
| `,f`              | live grep                                 |
| `,e`              | toggle neo-tree                           |
| `,ha` `,he` `,hD` | harpoon add / menu / clear                |
| `,h1` – `,h4`     | harpoon slot                              |
| `<C-t>`           | toggle terminal (`2<C-t>` for terminal 2) |

</details>

<details>
<summary><b>LSP and diagnostics</b></summary>

| Key         | Action                            |
| ----------- | --------------------------------- |
| `gd` `gD`   | definition (same window / vsplit) |
| `gr` `gi`   | references / implementations      |
| `ge`        | diagnostics list                  |
| `K` `D`     | hover / diagnostic float          |
| `,rn` `,ca` | rename / code action              |

</details>

<details>
<summary><b>Git</b></summary>

| Key               | Action                                  |
| ----------------- | --------------------------------------- |
| `,g`              | lazygit                                 |
| `]c` `[c`         | next / previous hunk                    |
| `,Gs` `,Gr`       | stage / reset hunk (also in visual)     |
| `,Gp` `,Gb` `,Gd` | preview hunk / blame line / diff buffer |

</details>

<details>
<summary><b>Debug</b></summary>

| Key                           | Action                              |
| ----------------------------- | ----------------------------------- |
| `<F5>` `<F6>` `<F11>` `<F12>` | continue / step over / into / out   |
| `,b` `,B`                     | breakpoint / conditional breakpoint |
| `,ui`                         | toggle DAP UI                       |

</details>

<details>
<summary><b>Copilot</b></summary>

| Key                     | Action                                               |
| ----------------------- | ---------------------------------------------------- |
| `,ct`                   | toggle Copilot (inline suggestions and blink source) |
| `,,`                    | accept suggestion                                    |
| `<M-]>` `<M-[>` `<C-]>` | next / previous / dismiss                            |

</details>

<details>
<summary><b>Completion</b> (blink.cmp <code>default</code> preset)</summary>

| Key               | Action             |
| ----------------- | ------------------ |
| `<C-space>`       | open / toggle docs |
| `<C-n>` `<C-p>`   | next / previous    |
| `<C-y>`           | accept             |
| `<C-e>`           | cancel             |
| `<Tab>` `<S-Tab>` | snippet jump       |

</details>

## 💾 Format on save

`BufWritePre` runs `LspEslintFixAll` on JS/TS/Svelte/Vue/Astro buffers, then
conform formats the buffer with the filetype's formatter, falling back to the
LSP where none is configured.

## 📄 License

[MIT](LICENSE)
