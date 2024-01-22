if status is-interactive
  fish_config theme choose Dracula
  fish_config prompt choose astronaut

  function fish_title
    set -q argv[1];
    echo (fish_prompt_pwd_dir_length=0 prompt_pwd) : $argv;
  end
end

