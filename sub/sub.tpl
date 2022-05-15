#!bash
# ==========================================================================================
# Copyright (C) 2022 Richard DJE
#
# This file is part of simenv
#
# simenv is free software: you can redistribute it and/or modify it under the terms
# of the GNU General Public License as published by the Free Software Foundation, either 
# version 3 of the License, or any later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with this program. 
# If not, see <https://www.gnu.org/licenses/>.
# ==========================================================================================


# Function: main
#
function main
{
  if (($# == 0)); then
    callsub help
    return
  fi

  if [[ -d $(get_subdir)/$1 ]]; then
    callsub "$@"
    return
  fi

  # Collect the options and positional arguments
  opts=$(getopt -a -n "$(get_subpath)" -oh -lhelp -- "$@")
  if (($? && $? < 4)); then
    callsub help
    return
  fi


  eval set -- $opts

  local pos posid
  while (($#)); do
    case $1 in
      -h|--help)
          callsub help 
          return
          ;;

      # Insert your code here to add new options' handling

      --) shift;;

      *)  pos[$((posid++))]=$1 
          shift
          ;;
    esac
  done


  set -- "${pos[@]}"

  # Insert your code here
}


main "$@"
