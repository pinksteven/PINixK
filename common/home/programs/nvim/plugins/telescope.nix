{ config, lib, pkgs, ... }:

{
    home.packages = [ pkgs.ripgrep ];

    programs.nixvim.keymaps = [
        {
        mode = "n";
        key = "<leader>fc";
        action.__raw = ''
            function()
            require("telescope.builtin").find_files {
                prompt_title = "Config Files",
                cwd = vim.fn.stdpath "config",
                follow = true,
            }
            end
        '';
        options = {
            desc = "Find config files";
            silent = true;
        };
        }
        {
        mode = "n";
        key = "<leader>fF";
        action.__raw = ''
            function()
            require("telescope.builtin").find_files({ hidden = true, no_ignore = true})
            end
        '';
        options = {
            desc = "Find all files";
            silent = true;
        };
        }
        {
        mode = "n";
        key = "<leader>fW";
        action.__raw = ''
            function()
            require("telescope.builtin").live_grep {
                additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
            }
            end
        '';
        options = {
            desc = "Find words in all files";
            silent = true;
        };
        }
        {
        mode = "n";
        key = "<leader>f?";
        action.__raw = ''
            function()
            require("telescope.builtin").live_grep { grep_open_files=true }
            end
        '';
        options = {
            desc = "Find words in all open buffers";
            silent = true;
        };
        }
        {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>Telescope file_browser<CR>";
        options = {
            desc = "File Explorer";
        };
        }
        {
        mode = "n";
        key = "<leader>fO";
        action = "<cmd>Telescope frecency<CR>";
        options = {
            desc = "Find Frequent Files";
        };
        }
        {
        mode = "n";
        key = "<leader>fu";
        action = "<cmd>Telescope undo<CR>";
        options = {
            desc = "List undo history";
        };
        }
        {
        mode = "n";
        key = "<leader>fM";
        action = "<cmd>Telescope manix<CR>";
        options = {
            desc = "Search manix";
        };
        }
        {
        mode = "n";
        key = "<leader>fw";
        action = "<cmd>Telescope live_grep_args<CR>";
        options = {
            desc = "Live grep (args)";
        };
        }
    ];

    programs.nixvim.plugins.telescope = {
        enable = true;

        extensions = {
            file-browser = {
                enable = true;
                settings = {
                hidden = true;
                };
            };
            frecency = {
                enable = true;
                settings = {
                auto_validate = false;
                };
            };
            live-grep-args.enable = true;
            manix.enable = true;
            ui-select = {
                enable = true;
                settings = {
                    __unkeyed.__raw = ''require("telescope.themes").get_dropdown{}'';
                };
            };
            undo = {
                enable = true;
                settings = {
                    side_by_side = true;
                    layout_strategy = "vertical";
                    layout_config = {
                        preview_height = 0.8;
                    };
                };
            };
        };

        keymaps = {
            "<leader>f'" = {
                action = "marks";
                options.desc = "View marks";
            };
            "<leader>f/" = {
                action = "current_buffer_fuzzy_find";
                options.desc = "Fuzzy find in current buffer";
            };
            "<leader>f<CR>" = {
                action = "resume";
                options.desc = "Resume action";
            };
            "<leader>fa" = {
                action = "autocommands";
                options.desc = "View autocommands";
            };
            "<leader>fC" = {
                action = "commands";
                options.desc = "View commands";
            };
            "<leader>fb" = {
                action = "buffers";
                options.desc = "View buffers";
            };
            "<leader>fc" = {
                action = "grep_string";
                options.desc = "Grep string";
            };
            "<leader>fd" = {
                action = "diagnostics";
                options.desc = "View diagnostics";
            };
            "<leader>ff" = {
                action = "find_files";
                options.desc = "Find files";
            };
            "<leader>fh" = {
                action = "help_tags";
                options.desc = "View help tags";
            };
            "<leader>fk" = {
                action = "keymaps";
                options.desc = "View keymaps";
            };
            "<leader>fm" = {
                action = "man_pages";
                options.desc = "View man pages";
            };
            "<leader>fo" = {
                action = "oldfiles";
                options.desc = "View old files";
            };
            "<leader>fr" = {
                action = "registers";
                options.desc = "View registers";
            };
            "<leader>fs" = {
                action = "lsp_document_symbols";
                options.desc = "Search symbols";
            };
            "<leader>fq" = {
                action = "quickfix";
                options.desc = "Search quickfix";
            };
            "<leader>fw" = {
                action = "live_grep";
                options.desc = "Live grep";
            };
            "<leader>gB" = {
                action = "git_branches";
                options.desc = "View git branches";
            };
            "<leader>gC" = {
                action = "git_commits";
                options.desc = "View git commits";
            };
            "<leader>gs" = {
                action = "git_status";
                options.desc = "View git status";
            };
            "<leader>gS" = {
                action = "git_stash";
                options.desc = "View git stashes";
            };
        };

        settings = {
            defaults = {
                file_ignore_patterns = [
                "^.git/"
                "^.mypy_cache/"
                "^__pycache__/"
                "^output/"
                "^data/"
                "%.ipynb"
                ];
                set_env.COLORTERM = "truecolor";
            };
        };
    };
}