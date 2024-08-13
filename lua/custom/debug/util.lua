local M = {}

function M.url_prompt()
  local co = coroutine.running()

  local function handle_url(url)
    if url == nil or url == '' then
      return
    else
      coroutine.resume(co, url)
    end
  end

  local function create_url_prompt_coroutine()
    vim.ui.input({ prompt = 'Enter URL: ', default = 'http://localhost:3000' }, handle_url)
  end

  return coroutine.create(create_url_prompt_coroutine)
end

return M
