#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/theme-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/common-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/theme-functions.sh

usage() {
  echo "
Dotfiles Manager

Version: $(cat "$DFM_DIR"/VERSION)

Usage:
  dfm theme [options] [flags]

Flags:
  -h, --help                        Show help for the specified command
  -l, --list                        List the available command options"
}

list_options() {
  echo "
Options:
  usa                               Set a USA theme
  wvu                               Set a West Virginia University theme
  minimal                           Set a minimal theme
"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -h|--help)
      usage
      list_options
      exit 1
      ;;
    -l|--list)
      list_options
      exit 1
      ;;
    minimal)
      export DFM_THEME_MINIMAL=true
      shift
      ;;
    usa)
      export DFM_THEME_USA=true
      shift
      ;;
    wvu)
      export DFM_THEME_WVU=true
      shift
      ;;
    *)
      printStatus "Unknown Option: $1" --status error
      usage
      list_options
      exit 1
      ;;
  esac
done

if "$DFM_THEME_MINIMAL" ; then
  themeMinimal
fi
if "$DFM_THEME_USA" ; then
  themeUSA
fi
if "$DFM_THEME_WVU" ; then
  themeWVU
fi