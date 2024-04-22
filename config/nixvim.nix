{config, pkgs, ...}:
let 
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim"; 
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes.tokyonight = {
      enable = true;
      transparent = true;
      terminalColors = true;
    };

    plugins = {
      lightline.enable = true;
      telescope = {
	enable = true;
      };

      oil = {
	enable = true;	
      };

      treesitter = {
	enable = true;
      };

      luasnip = {
	enable = true;
      };

      cmp = {
	enable = true;
	autoEnableSources = true;
      	settings = {
	  sources = [
	    {name = "nvim_lsp";}
	    {name = "path";}
	    {name = "buffer";}
	    {name = "luasnip";}
	  ]; 
	};
      };

      lsp = {
	enable = true;
	servers = {
	  lua-ls.enable = true;
	  rust-analyzer = {
	    enable = true;
	    installRustc = true;
	    installCargo = true;
	  };
	};
      };
      rust-tools = {
        enable = true;
        server.completion.autoimport.enable = true;
        server.completion.autoself.enable = true;
      };

      packer = {
        enable = true;
        plugins = [
          "andweeb/presence.nvim"
          "nvim-neotest/neotest"
        ];
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      {
	  plugin = rustaceanvim;
      }
    ];
  };
}
