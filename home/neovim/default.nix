{ pkgs, ... }: {
  imports = [
    ./lsp.nix
    ./options.nix
    ./plugins.nix
    ./theme.nix
  ];
  programs.nixvim = {
    enable = true;
    extraConfigLua = "vim.cmd('set cmdheight=0')";
    colorschemes.gruvbox.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = suda-vim;
      }
      {
        plugin = autoclose-nvim;
        config = ''lua require("autoclose").setup()'';
      }
    ];
    plugins = {
      nix = {
        enable = true;
      };
      oil = {
        enable = true;
      };
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
      nvim-colorizer = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
        autoReloadOnWrite = true;
        hijackCursor = true;
        openOnSetup = true;
      };
      gitsigns = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item";
        };
      };
      lsp = {
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            K = "hover";
          };
        };
        enable = true;
        servers = {
          pyright = {
            enable = true;
          };
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          rnix-lsp = {
            enable = true;
          };
          nil_ls = {
            enable = true;
          };
        };
      };
      treesitter = {
        enable = true;
      };
    };
  };
}
