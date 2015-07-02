#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cpu="#($CURRENT_DIR/scripts/cpu.sh)"
cpu_interpolation_string="\#{cpu}"

source "${CURRENT_DIR}/scripts/helpers.sh"

do_interpolation() {
  local string="$1"
  local interpolated="${string/$cpu_interpolation_string/$cpu}"

  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"

  set_tmux_option "$option" "$new_option_value"
}

update_tmux_option "status-right"
update_tmux_option "status-left"
