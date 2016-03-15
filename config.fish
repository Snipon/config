### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set composer ~/.composer/vendor/bin
set -gx PATH $homebrew $composer $default_path

### LS colors ###
set -Ux LSCOLORS dxfxcxdxbxegedabagacad

### Startup ###
archey

### Fish git prompt ###
set __fish_git_prompt_showstagedstate 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_color_branch yellow

### Git prompt status Chars ###

set __fish_git_prompt_char_stagedstate '☻ '
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_char_dirtystate '☻ '
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_char_untrackedfiles '☻ '
set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_char_stashstate '↩ '

### Fish prompt ###
function fish_prompt

  set last_status $status
  if not set -q $__fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname)
  end
  set_color -o blue
  echo -n -s (whoami) @ (hostname) ': '
  set_color -o cyan
  echo -n (basename (prompt_pwd))
  set_color normal
  printf '%s ' (__fish_git_prompt)
  echo -n ' $ '
end


### Package manager update ###
function update
  echo "Updating global composer.."
  composer selfupdate
  echo "Updating homebrew.."
  brew update
  brew upgrade
  brew cleanup
  echo "Updating global node packages.."
  npm -g update
end

### Aliases ###
alias git "hub"
alias lla "ls -lah"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
