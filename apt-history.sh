#!/bin/bash
#
# Copyright (c) 2015
# Author: Victor Arribas <v.arribas.urjc@gmail.com>
# License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>
#
# Based on original script (2005):
#  http://redclay.altervista.org/wiki/doku.php?id=projects:old-projects
# You can also refer to below url to get in context:
#  http://linuxcommando.blogspot.com.es/2008/08/how-to-show-apt-log-history.html

# Summary:
# inspects dpkg/apt history.
#
# Usage:
# apt-history.sh [--all] {<dpkg VERB>|<CUSTOM>|full-log}
#    dpkg VERB    install|upgrade|remove|rollback
#    CUSTOM       pattern matched by grep. For example:
#                   * status installed
#                   * package name
#    log          display recent history
#    full-log     display whole history. Includes compressed old files
#    --all        enables full log inspection.

function apt-history(){
  function cat_logs(){
    tac /var/log/dpkg.log
    tac /var/log/dpkg.log.[0-9]
  }
  function cat_logs_all(){
    (cat_logs; zcat /var/log/dpkg.log.*.gz) | sort -nr
  }

      MODE=''
      if [ "$1" == "--all" ]; then
	MODE=_all
	shift
      fi

      case "$1" in
        install)
              cat_logs$MODE | grep 'install '
              ;;
        upgrade|remove)
              cat_logs$MODE | grep "$1 "
              ;;
        rollback)
              cat_logs$MODE | \
                  grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        log)
              cat_logs
              ;;
        full-log)
              cat_logs_all
              ;;
        *)
              cat_logs$MODE | grep -- "$*"
              ;;
      esac
}


apt-history $@
