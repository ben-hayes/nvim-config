-- Old ChatGPT plugin config
WELCOME_MESSAGE = [[
 
        "Are you sure of your perceptions?"

]]
return {
	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTEditWithInstruction", "ChatGPTRun" },
		-- event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "op read op://Personal/OpenAI/credential --no-newline",
				yank_register = "+",
				edit_with_instructions = {
					diff = false,
					keymaps = {
						close = "<C-c>",
						accept = "<C-y>",
						toggle_diff = "<C-d>",
						toggle_settings = "<C-o>",
						toggle_help = "<C-h>",
						cycle_windows = "<Tab>",
						use_output_as_input = "<C-i>",
					},
				},
				chat = {
					welcome_message = WELCOME_MESSAGE,
					loading_text = "Loading, please wait ...",
					question_sign = "", -- 🙂
					answer_sign = "ﮧ", -- 🤖
					border_left_sign = "",
					border_right_sign = "",
					max_line_length = 120,
					sessions_window = {
						active_sign = "  ",
						inactive_sign = "  ",
						current_line_sign = "",
						border = {
							style = "rounded",
							text = {
								top = " Sessions ",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						},
					},
					keymaps = {
						close = "<C-c>",
						yank_last = "<C-y>",
						yank_last_code = "<C-k>",
						scroll_up = "<C-u>",
						scroll_down = "<C-d>",
						new_session = "<M-n>",
						cycle_windows = "<Tab>",
						cycle_modes = "<C-f>",
						next_message = "<M-j>",
						prev_message = "<M-k>",
						select_session = "<Space>",
						rename_session = "r",
						delete_session = "d",
						draft_message = "<C-r>",
						edit_message = "e",
						delete_message = "d",
						toggle_settings = "<M-o>",
						toggle_sessions = "<M-p>",
						toggle_help = "<C-h>",
						toggle_message_role = "<C-r>",
						toggle_system_role_open = "<C-s>",
						stop_generating = "<C-x>",
					},
				},
				popup_layout = {
					default = "center",
					center = {
						width = "80%",
						height = "80%",
					},
					right = {
						width = "30%",
						width_settings_open = "50%",
					},
				},
				popup_window = {
					border = {
						highlight = "FloatBorder",
						style = "rounded",
						text = {
							top = " ChatGPT ",
						},
					},
					win_options = {
						wrap = true,
						linebreak = true,
						foldcolumn = "1",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
					buf_options = {
						filetype = "markdown",
					},
				},
				system_window = {
					border = {
						highlight = "FloatBorder",
						style = "rounded",
						text = {
							top = " SYSTEM ",
						},
					},
					win_options = {
						wrap = true,
						linebreak = true,
						foldcolumn = "2",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				popup_input = {
					prompt = "  ",
					border = {
						highlight = "FloatBorder",
						style = "rounded",
						text = {
							top_align = "center",
							top = " Prompt ",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
					submit = "<C-Enter>",
					submit_n = "<Enter>",
					max_visible_lines = 20,
				},
				settings_window = {
					setting_sign = "  ",
					border = {
						style = "rounded",
						text = {
							top = " Settings ",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				help_window = {
					setting_sign = "  ",
					border = {
						style = "rounded",
						text = {
							top = " Help ",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				openai_params = {
					model = "gpt-4-turbo-preview",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 300,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				openai_edit_params = {
					model = "gpt-4-turbo-preview",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				use_openai_functions_for_edits = false,
				actions_paths = {},
				show_quickfixes_cmd = "Trouble quickfix",
				predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
				highlights = {
					help_key = "@symbol",
					help_description = "@comment",
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}

-- local chatgpt_config = function()
-- 	require("gp").setup({
-- 		openai_api_key = { "op", "read", "op://Personal/OpenAI/credential", "--no-newline" },
-- 		agents = {
-- 			{
-- 				name = "ChatGPT4",
-- 				chat = true,
-- 				command = false,
-- 				-- string with model name or table with model name and parameters
-- 				model = { model = "gpt-4-0125-preview", temperature = 1.1, top_p = 1 },
-- 				-- system prompt (use this to specify the persona/role of the AI)
-- 				system_prompt = "You are an AI assistant to a computer scientist.\n\n"
--           .. "The user will get very upset if you patronize them or insult their intelligence.\n\n"
-- 					.. "The user provided additional information about how they would like you to respond:\n\n"
-- 					.. "- If you're unsure don't guess and say you don't know instead.\n"
-- 					.. "- Ask a question if you need clarification to provide better answer.\n"
-- 					.. "- Think deeply and carefully from first principles.\n"
-- 					.. "- Zoom out first to see the big picture and then zoom in to details.\n"
-- 					.. "- Use the Socratic method to improve your thinking and coding skills.\n"
-- 					.. "- Don't elide any code from your output if the answer requires coding.\n"
--           .. "- Factual answers should be focused and to the point. Don't pontificate.\n"
-- 					.. "- Take a deep breath; You've got this!\n",
-- 			},
-- 			{
-- 				name = "CodeGPT4",
-- 				chat = false,
-- 				command = true,
-- 				-- string with model name or table with model name and parameters
-- 				model = { model = "gpt-4-0125-preview", temperature = 0.8, top_p = 1 },
-- 				-- system prompt (use this to specify the persona/role of the AI)
-- 				system_prompt = "You are an AI working as a code editor.\n\n"
-- 					.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
-- 					.. "START AND END YOUR ANSWER WITH:\n\n```",
-- 			},
-- 			{
-- 				name = "ChatGPT3-5",
-- 				chat = false, -- just name would suffice
-- 				command = false, -- just name would suffice
-- 			},
-- 			{
-- 				name = "CodeGPT3-5",
-- 				chat = false, -- just name would suffice
-- 				command = false, -- just name would suffice
-- 			},
-- 		},
-- 	})
-- end
--
-- return {
-- 	{
-- 		"robitx/gp.nvim",
-- 		config = chatgpt_config,
--     lazy = true,
--     cmd = {
--       "GpChatToggle", "GpChatNew", "GpChatFinder", "GpChatDelete",
--     }
-- 	},
-- }
