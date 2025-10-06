function DefangVisual()
  -- Get start & end positions of the selection
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"

  local start_line = start_pos[2]
  local start_col = start_pos[3]
  local end_line = end_pos[2]
  local end_col = end_pos[3]

  -- If selection is within one line
  if start_line == end_line then
    local line = vim.fn.getline(start_line)

    -- Extract before, selection, after
    local before = line:sub(1, start_col - 1)
    local selection = line:sub(start_col, end_col)
    local after = line:sub(end_col + 1)

    -- Do replacements only on selection
    selection = selection:gsub('https', 'hxxps')
    selection = selection:gsub('%.', '{.}')

    -- Put line back together
    vim.fn.setline(start_line, before .. selection .. after)
  else
    -- Multiline selection → loop through
    for lnum = start_line, end_line do
      local line = vim.fn.getline(lnum)

      -- First line: start_col → end
      if lnum == start_line then
        local before = line:sub(1, start_col - 1)
        local selection = line:sub(start_col)
        selection = selection:gsub('https', 'hxxps')
        selection = selection:gsub('%.', '{.}')
        vim.fn.setline(lnum, before .. selection)

      -- Last line: start → end_col
      elseif lnum == end_line then
        local selection = line:sub(1, end_col)
        local after = line:sub(end_col + 1)
        selection = selection:gsub('https', 'hxxps')
        selection = selection:gsub('%.', '{.}')
        vim.fn.setline(lnum, selection .. after)

      -- Full lines in between
      else
        line = line:gsub('https', 'hxxps')
        line = line:gsub('%.', '{.}')
        vim.fn.setline(lnum, line)
      end
    end
  end
end

vim.api.nvim_create_user_command('Defang', DefangVisual, { range = true })

