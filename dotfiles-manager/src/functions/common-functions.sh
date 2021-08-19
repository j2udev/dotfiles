#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh

printStatus() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --status|-s)
        shift
        local DFM_STATUS_PRINT=$1
        shift
        ;;
      --*)
        printf "$DFM_STATUS_RED%s$DFM_STATUS_END_OF_COLOR\n" "Unrecognized Flag"
        exit 1
        ;;
      *)
        DFM_STATUS_PRINT_MESSAGE=$1
        shift
        ;;
    esac
  done

  case $DFM_STATUS_PRINT in
    info|Info|INFO)
      printf "$DFM_STATUS_GREEN%s$DFM_STATUS_END_OF_COLOR\n" "$DFM_STATUS_PRINT_MESSAGE"
      ;;
    warn|Warn|WARN)
      printf "$DFM_STATUS_YELLOW%s$DFM_STATUS_END_OF_COLOR\n" "$DFM_STATUS_PRINT_MESSAGE"
      ;;
    error|Error|ERROR)
      printf "$DFM_STATUS_RED%s$DFM_STATUS_END_OF_COLOR\n" "$DFM_STATUS_PRINT_MESSAGE"
      ;;
    default|Default|DEFAULT)
      printf "%s\n" "$DFM_STATUS_PRINT_MESSAGE"
      ;;
    *)
      printf "$DFM_STATUS_RED%s$DFM_STATUS_END_OF_COLOR\n" "Unrecognized Status"
      ;;
  esac
}

operatingSystemFilter() {
  case $1 in
    darwin|Darwin|mac|macOS|Mac|MacOS)
      export DFM_OPERATING_SYSTEM="darwin"
      ;;
    linux|Linux|ubuntu|Ubuntu)
      export DFM_OPERATING_SYSTEM="linux"
      ;;
    *)
      printStatus "Unrecognized Operating System: $1" --status error
      exit 1
      ;;
  esac
}
