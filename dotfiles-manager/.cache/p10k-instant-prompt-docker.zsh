[[ -t 0 && -t 1 && -t 2 && -o interactive && -o zle && -o no_xtrace ]] &&
  ! (( ${+__p9k_instant_prompt_disabled} || ZSH_SUBSHELL || ${+ZSH_SCRIPT} || ${+ZSH_EXECUTION_STRING} )) || return 0
() {
  emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'
  typeset -gi __p9k_instant_prompt_disabled=1
  [[ $ZSH_VERSION == 5.8 && $ZSH_PATCHLEVEL == ubuntu/5.8-5 &&
     -z ${(M)TERM:#(screen*|tmux*)} &&
     ${#${(M)VTE_VERSION:#(<1-4602>|4801)}} == 0 &&
     $POWERLEVEL9K_DISABLE_INSTANT_PROMPT != 'true' &&
     $POWERLEVEL9K_INSTANT_PROMPT != 'off' ]] || return
  typeset -g __p9k_instant_prompt_param_sig=$'v122\C-A5.8\C-Aubuntu/5.8-5\C-A182\C-Adocker%\C-A\C-A\C-A\C-A\C-A\C-A\C-A1\C-A0\C-A0\C-A\C-A%B%S%#%s%b\C-A1\C-AUTF-8\C-A\C-A\C-A0\C-A1\C-A/home/docker/.oh-my-zsh/custom/themes/powerlevel10k\C-A\C-A\C-A\C-A\C-A1\C-A256\C-A0\C-A37\C-A\C-A\C-Afalse\C-A70\C-A208\C-A32\C-A240\C-A37\C-Afalse\C-A${P9K_VISUAL_IDENTIFIER// }\C-A70\C-A70\C-A178\C-Ared3\C-A20\C-A\C-Afalse\C-A248\C-Ad h m s\C-A0\C-A3\C-A\C-A\C-A180\C-A178\C-A%B%n@%m\C-A\C-A\C-A%n@%m\C-Atrue\C-Awhite\C-Ared3\C-Awhite\C-Afalse\C-A80\C-A40\C-A50\C-A103\C-Atrue\C-A134\C-Atrue\C-A\C-A208\C-A${P9K_VISUAL_IDENTIFIER}\C-A37\C-Atrue\C-A\C-A*\C-BDEFAULT\C-Adodgerblue2\C-A${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}\C-Awhite\C-Adir\C-Bvcs\C-Bkubecontext\C-Bterraform\C-Bnewline\C-Bprompt_char\C-A\C-A\\uE0B0\C-A\\uE0B0\C-A%250F\\uE0B1\C-A166\C-A66\C-A178\C-A5\C-Anerdfont-complete\C-A\C-A \C-A\C-A\C-A\C-A\C-A\C-A\C-A70\C-A\C-A\C-Afalse\C-A70\C-Afalse\C-A70\C-Atrue\C-A\C-A\C-A\C-A\C-A\C-A\C-A39\C-A70\C-A%B${P9K_CONTENT// }\C-A255\C-Afalse\C-A\C-A❮\C-A196\C-A❯\C-A196\C-A▶\C-AⅤ\C-A196\C-A\C-A\C-A\C-A\C-A❮\C-Ared3\C-A❯\C-Ared3\C-A▶\C-AⅤ\C-Ared3\C-Atrue\C-A68\C-Adodgerblue2\C-Awhite\C-A37\C-Afalse\C-A66\C-A178\C-A168\C-Afalse\C-Astatus\C-Bcommand_execution_time\C-Bbackground_jobs\C-Bvirtualenv\C-Banaconda\C-Bpyenv\C-Bnodenv\C-Bnvm\C-Bnodeenv\C-Brbenv\C-Brvm\C-Baws\C-Bcontext\C-Bnordvpn\C-Branger\C-Bnewline\C-A\\uE0B2\C-A\C-A\\uE0B2\C-A%250F\\uE0B3\C-A37\C-Atrue\C-A168\C-Afalse\C-Afalse\C-A\C-A1\C-A(.bzr|.citc|.git|.hg|.node-version|.python-version|.ruby-version|.shorten_folder_marker|.svn|.terraform|CVS|Cargo.toml|composer.json|go.mod|package.json)\C-Atruncate_to_unique\C-Afalse\C-Ared3\C-Atrue\C-Ared3\C-A↵\C-Atrue\C-Ared3\C-A↵\C-A↵\C-Atrue\C-Afalse\C-A70\C-Atrue\C-A70\C-A✔\C-A✔\C-Afalse\C-A38\C-A66\C-A%D{%H:%M:%S}\C-Afalse\C-Agit\C-A \C-Awhite\C-Ared3\C-A-1\C-A-1\C-A-1\C-A${$((my_git_formatter(1)))+${my_git_format}}\C-Atrue\C-A${$((my_git_formatter(0)))+${my_git_format}}\C-A244\C-Awhite\C-Ared3\C-A-1\C-A-1\C-Awhite\C-Ared3\C-A?\C-A-1\C-Ared3\C-A37\C-A\C-A\C-Afalse\C-A${P9K_VISUAL_IDENTIFIER// }\C-A\C-A81\C-A(wg|(.*tun))[0-9]*\C-A${P9K_VISUAL_IDENTIFIER// }'
  local gitstatus_dir=/home/docker/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus
  local gitstatus_header=\#\ 1
  local -i ZLE_RPROMPT_INDENT=1
  local PROMPT_EOL_MARK=%B%S%\#%s%b
  [[ -n $SSH_CLIENT || -n $SSH_TTY || -n $SSH_CONNECTION ]] && local ssh=1 || local ssh=0
  local cr=$'\r' lf=$'\n' esc=$'\e[' rs=$'\x1e' us=$'\x1f'
  local -i height=1
  local prompt_dir=/home/docker/.cache/p10k-docker

  (( _z4h_can_save_restore_screen == 1 )) && height=0
  local real_gitstatus_header
  if [[ -r $gitstatus_dir/install.info ]]; then
    IFS= read -r real_gitstatus_header <$gitstatus_dir/install.info || real_gitstatus_header=borked
  fi
  [[ $real_gitstatus_header == $gitstatus_header ]] || return
  zmodload zsh/langinfo zsh/terminfo zsh/system || return
  if [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]]; then
    local loc_cmd=$commands[locale]
    [[ -z $loc_cmd ]] && loc_cmd=/usr/bin/locale
    if [[ -x $loc_cmd ]]; then
      local -a locs
      if locs=(${(@M)$(locale -a 2>/dev/null):#*.(utf|UTF)(-|)8}) && (( $#locs )); then
        local loc=${locs[(r)(#i)C.UTF(-|)8]:-${locs[(r)(#i)en_US.UTF(-|)8]:-$locs[1]}}
        [[ -n $LC_ALL ]] && local LC_ALL=$loc || local LC_CTYPE=$loc
      fi
    fi
  fi
  (( terminfo[colors] == 256 )) || return
  (( $+terminfo[cuu] && $+terminfo[cuf] && $+terminfo[ed] && $+terminfo[sc] && $+terminfo[rc] )) || return
  local pwd=${(%):-%/}
  [[ $pwd == /* ]] || return
  local prompt_file=$prompt_dir/prompt-${#pwd}
  local key=$pwd:$ssh:${(%):-%#}
  local content
  if [[ ! -e $prompt_file ]]; then
    typeset -gi __p9k_instant_prompt_sourced=39
    return 1
  fi
  { content="$(<$prompt_file)" } 2>/dev/null || return
  local tail=${content##*$rs$key$us}
  if (( ${#tail} == ${#content} )); then
    typeset -gi __p9k_instant_prompt_sourced=39
    return 1
  fi
  local _p9k__ipe
  local P9K_PROMPT=instant
  if [[ -z $P9K_TTY || $P9K_TTY == old && -n ${_P9K_TTY:#$TTY} ]]; then

    typeset -gx P9K_TTY=old
    zmodload -F zsh/stat b:zstat || return
    zmodload zsh/datetime || return
    local -a stat
    if zstat -A stat +ctime -- $TTY 2>/dev/null &&
      (( EPOCHREALTIME - stat[1] < 5.0000000000 )); then
      P9K_TTY=new
    fi
  fi
  typeset -gx _P9K_TTY=$TTY
  local -i _p9k__empty_line_i=3 _p9k__ruler_i=3
  local -A _p9k_display_k=(-2/left 11 2/left 61 -2/right/nodenv 37 1/right/nvm 39 1/right/background_jobs 29 1/right/rvm 45 1/left/kubecontext 21 -1/right 63 -2/right/nvm 39 1/right/nordvpn 51 -2/left/kubecontext 21 -2/right/rvm 45 1/left/dir 17 1/right/rbenv 43 -2/left/terraform 23 -2/right/ranger 53 1/right/nodenv 37 -1/left 61 -2/left/vcs 19 -2/right/anaconda 33 -2/right/context 49 1/right/virtualenv 31 1/right_frame 9 -2/right/rbenv 43 1/right 13 2/right 63 1/right/pyenv 35 -2/right/virtualenv 31 1/right/nodeenv 41 -2/right 13 -2/right/background_jobs 29 2/right_frame 59 -2/right_frame 9 1/right/ranger 53 1/right/aws 47 -2/right/pyenv 35 empty_line 1 2/left/prompt_char 67 1/right/context 49 -1 55 -1/left/prompt_char 67 -2/right/aws 47 1/left 11 -2 5 -1/gap 65 -1/right_frame 59 1/left/vcs 19 -2/gap 15 1/left/terraform 23 1/right/anaconda 33 -2/right/status 25 1/left_frame 7 1 5 ruler 3 2 55 -1/left_frame 57 -2/right/nordvpn 51 1/gap 15 2/gap 65 1/right/command_execution_time 27 2/left_frame 57 -2/left_frame 7 -2/right/command_execution_time 27 1/right/status 25 -2/right/nodeenv 41 -2/left/dir 17)
  local -a _p9k__display_v=(empty_line hide ruler hide 1 show 1/left_frame show 1/right_frame show 1/left show 1/right show 1/gap show 1/left/dir show 1/left/vcs show 1/left/kubecontext show 1/left/terraform show 1/right/status show 1/right/command_execution_time show 1/right/background_jobs show 1/right/virtualenv show 1/right/anaconda show 1/right/pyenv show 1/right/nodenv show 1/right/nvm show 1/right/nodeenv show 1/right/rbenv show 1/right/rvm show 1/right/aws show 1/right/context show 1/right/nordvpn show 1/right/ranger show 2 show 2/left_frame show 2/right_frame show 2/left show 2/right show 2/gap show 2/left/prompt_char show)
  function p10k() {
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'; [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }
    [[ $1 == display ]] || return
    shift
    local -i k dump
    local opt prev new pair list name var
    while getopts ":ha" opt; do
      case $opt in
        a) dump=1;;
        h) return 0;;
        ?) return 1;;
      esac
    done
    if (( dump )); then
      reply=()
      shift $((OPTIND-1))
      (( ARGC )) || set -- "*"
      for opt; do
        for k in ${(u@)_p9k_display_k[(I)$opt]:/(#m)*/$_p9k_display_k[$MATCH]}; do
          reply+=($_p9k__display_v[k,k+1])
        done
      done
      return 0
    fi
    for opt in "${@:$OPTIND}"; do
      pair=(${(s:=:)opt})
      list=(${(s:,:)${pair[2]}})
      if [[ ${(b)pair[1]} == $pair[1] ]]; then
        local ks=($_p9k_display_k[$pair[1]])
      else
        local ks=(${(u@)_p9k_display_k[(I)$pair[1]]:/(#m)*/$_p9k_display_k[$MATCH]})
      fi
      for k in $ks; do
        if (( $#list == 1 )); then
          [[ $_p9k__display_v[k+1] == $list[1] ]] && continue
          new=$list[1]
        else
          new=${list[list[(I)$_p9k__display_v[k+1]]+1]:-$list[1]}
          [[ $_p9k__display_v[k+1] == $new ]] && continue
        fi
        _p9k__display_v[k+1]=$new
        name=$_p9k__display_v[k]
        if [[ $name == (empty_line|ruler) ]]; then
          var=_p9k__${name}_i
          [[ $new == hide ]] && typeset -gi $var=3 || unset $var
        elif [[ $name == (#b)(<->)(*) ]]; then
          var=_p9k__${match[1]}${${${${match[2]//\/}/#left/l}/#right/r}/#gap/g}
          [[ $new == hide ]] && typeset -g $var= || unset $var
        fi
      done
    done
  }

  trap "unset -m _p9k__\*; unfunction p10k" EXIT
  local -a _p9k_t=("${(@ps:$us:)${tail%%$rs*}}")
  if [[ $+VTE_VERSION == 1 || $TERM_PROGRAM == Hyper ]] && (( $+commands[stty] )); then
    if [[ $TERM_PROGRAM == Hyper ]]; then
      local bad_lines=40 bad_columns=100
    else
      local bad_lines=24 bad_columns=80
    fi
    if (( LINES == bad_lines && COLUMNS == bad_columns )); then
      zmodload -F zsh/stat b:zstat || return
      zmodload zsh/datetime || return
      local -a tty_ctime
      if ! zstat -A tty_ctime +ctime -- $TTY 2>/dev/null || (( tty_ctime[1] + 2 > EPOCHREALTIME )); then
        local -F deadline=$((EPOCHREALTIME+0.025))
        local tty_size
        while true; do
          if (( EPOCHREALTIME > deadline )) || ! tty_size="$(command stty size 2>/dev/null)" || [[ $tty_size != <->" "<-> ]]; then
            (( $+_p9k__ruler_i )) || local -i _p9k__ruler_i=1
            local _p9k__g= _p9k__2r= _p9k__2r_frame=
            break
          fi
          if [[ $tty_size != "$bad_lines $bad_columns" ]]; then
            local lines_columns=(${=tty_size})
            local LINES=$lines_columns[1]
            local COLUMNS=$lines_columns[2]
            break
          fi
        done
      fi
    fi
  fi
  typeset -ga __p9k_used_instant_prompt=("${(@e)_p9k_t[-3,-1]}")

  (( height += ${#${__p9k_used_instant_prompt[1]//[^$lf]}} ))
  local _p9k__ret
  function _p9k_prompt_length() {
    local -i COLUMNS=1024
    local -i x y=${#1} m
    if (( y )); then
      while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
        x=y
        (( y *= 2 ))
      done
      while (( y > x + 1 )); do
        (( m = x + (y - x) / 2 ))
        (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
      done
    fi
    typeset -g _p9k__ret=$x
  }
  local out
  if [[ $+VTE_VERSION == 0 && $TERM_PROGRAM != Hyper ]] || (( ! $+_p9k__g )); then
    local mark=${(e)PROMPT_EOL_MARK}
    [[ $mark == "%B%S%#%s%b" ]] && _p9k__ret=1 || _p9k_prompt_length $mark
    local -i fill=$((COLUMNS > _p9k__ret ? COLUMNS - _p9k__ret : 0))
    out+="${(%):-%b%k%f%s%u$mark${(pl.$fill.. .)}$cr%b%k%f%s%u%E}"
  fi
  (( _z4h_can_save_restore_screen == 1 )) || out+="${(pl.$height..$lf.)}$esc${height}A$terminfo[sc]"
  out+=${(%):-"$__p9k_used_instant_prompt[1]$__p9k_used_instant_prompt[2]"}
  if [[ -n $__p9k_used_instant_prompt[3] ]]; then
    _p9k_prompt_length "$__p9k_used_instant_prompt[2]"
    local -i left_len=_p9k__ret
    _p9k_prompt_length "$__p9k_used_instant_prompt[3]"
    local -i gap=$((COLUMNS - left_len - _p9k__ret - ZLE_RPROMPT_INDENT))
    if (( gap >= 40 )); then
      out+="${(pl.$gap.. .)}${(%):-${__p9k_used_instant_prompt[3]}%b%k%f%s%u}$cr$esc${left_len}C"
    fi
  fi
  (( _z4h_can_save_restore_screen == 1 )) && out+="$cr$esc${height}A$terminfo[sc]$out"
  typeset -g __p9k_instant_prompt_output=${TMPDIR:-/tmp}/p10k-instant-prompt-output-${(%):-%n}-$$
  { echo -n > $__p9k_instant_prompt_output } || return
  print -rn -- "$out" || return
  local fd_null
  sysopen -ru fd_null /dev/null || return
  exec {__p9k_fd_0}<&0 {__p9k_fd_1}>&1 {__p9k_fd_2}>&2 0<&$fd_null 1>$__p9k_instant_prompt_output
  exec 2>&1 {fd_null}>&-
  typeset -gi __p9k_instant_prompt_active=1
  if (( _z4h_can_save_restore_screen == 1 )); then
    typeset -g _z4h_saved_screen
    -z4h-save-screen
  fi
  typeset -g __p9k_instant_prompt_dump_file=${XDG_CACHE_HOME:-~/.cache}/p10k-dump-${(%):-%n}.zsh
  if builtin source $__p9k_instant_prompt_dump_file 2>/dev/null && (( $+functions[_p9k_preinit] )); then
    _p9k_preinit
  fi
  function _p9k_instant_prompt_cleanup() {
    (( ZSH_SUBSHELL == 0 && ${+__p9k_instant_prompt_active} )) || return 0
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'
    unset __p9k_instant_prompt_active
    exec 0<&$__p9k_fd_0 1>&$__p9k_fd_1 2>&$__p9k_fd_2 {__p9k_fd_0}>&- {__p9k_fd_1}>&- {__p9k_fd_2}>&-
    unset __p9k_fd_0 __p9k_fd_1 __p9k_fd_2
    typeset -gi __p9k_instant_prompt_erased=1
    if (( _z4h_can_save_restore_screen == 1 && __p9k_instant_prompt_sourced >= 35 )); then
      -z4h-restore-screen
      unset _z4h_saved_screen
    fi
    print -rn -- $terminfo[rc]${(%):-%b%k%f%s%u}$terminfo[ed]
    if [[ -s $__p9k_instant_prompt_output ]]; then
      command cat $__p9k_instant_prompt_output 2>/dev/null
      if (( $1 )); then
        local _p9k__ret mark="${(e)${PROMPT_EOL_MARK-%B%S%#%s%b}}"
        _p9k_prompt_length $mark
        local -i fill=$((COLUMNS > _p9k__ret ? COLUMNS - _p9k__ret : 0))
        echo -nE - "${(%):-%b%k%f%s%u$mark${(pl.$fill.. .)}$cr%b%k%f%s%u%E}"
      fi
    fi
    zshexit_functions=(${zshexit_functions:#_p9k_instant_prompt_cleanup})
    zmodload -F zsh/files b:zf_rm || return
    local user=${(%):-%n}
    local root_dir=${__p9k_instant_prompt_dump_file:h}
    zf_rm -f -- $__p9k_instant_prompt_output $__p9k_instant_prompt_dump_file{,.zwc} $root_dir/p10k-instant-prompt-$user.zsh{,.zwc} $root_dir/p10k-$user/prompt-*(N) 2>/dev/null
  }
  function _p9k_instant_prompt_precmd_first() {
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'; [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }
    function _p9k_instant_prompt_sched_last() {
      (( ${+__p9k_instant_prompt_active} )) || return 0
      _p9k_instant_prompt_cleanup 1
      setopt no_local_options prompt_cr prompt_sp
    }
    zmodload zsh/sched
    sched +0 _p9k_instant_prompt_sched_last
    precmd_functions=(${(@)precmd_functions:#_p9k_instant_prompt_precmd_first})
  }
  zshexit_functions=(_p9k_instant_prompt_cleanup $zshexit_functions)
  precmd_functions=(_p9k_instant_prompt_precmd_first $precmd_functions)
  DISABLE_UPDATE_PROMPT=true
} && unsetopt prompt_cr prompt_sp && typeset -gi __p9k_instant_prompt_sourced=39 ||
  typeset -gi __p9k_instant_prompt_sourced=${__p9k_instant_prompt_sourced:-0}
