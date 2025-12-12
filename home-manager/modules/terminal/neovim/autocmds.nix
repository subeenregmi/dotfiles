{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufWinEnter" ];
      callback = {
        __raw = ''
          function(args)
            if vim.bo[args.buf].buftype == "nofile" then
              vim.bo[args.buf].filetype = ""  -- disable ftplugin/syntax/indent load
            end
          end
        '';
      };
    }
    {
      event = [ "RecordingEnter" "RecordingLeave"];
      desc = "Notify when recording a macro";
      callback = {
        __raw = ''
          function(ev)
            local msg
            if ev.event == 'RecordingEnter' then
              msg = 'Recording to register @'
            else
              msg = 'Recorded to register @'
            end
            vim.notify(msg .. vim.fn.reg_recording(), vim.log.levels.INFO, { title = 'Macro', timeout = 5000, hide_from_history = false })
          end
        '';
      };
    }
  ];
}
