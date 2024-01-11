PROMPT='
┌─[%F{blue}⏵ %~%f] [%F{red}ᯤ $(get_ip_address)%f] %F{yellow}$(git_prompt_info)%f
└─► '

RPROMPT='[%F{red}$(date +%H:%M:%S)%f]'

get_ip_address() {
  if [[ -n "$(ifconfig en0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig en0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig wlan0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig wlan0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

