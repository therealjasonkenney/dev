local M = {}

M.config = {
  {
    type = "ruby",
    name = "debug current file",
    request = "attach",
    localfs = true,
    command = "ruby",
    script = "${file}",
  },
  {
    type = "ruby",
    name = "run current spec file",
    request = "attach",
    localfs = true,
    command = "rspec",
    script = "${file}",
  },
}

function M.adapter(callback, config)
  callback({
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "bundle",
      args = {
        "exec",
        "rdbg",
        "-n",
        "--open",
        "--port",
        "${port}",
        "-c",
        "--",
        "bundle",
        "exec",
        config.command,
        config.script,
      },
    },
  })
end

return M
