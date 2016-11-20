# apt-history
Inspects dpkg/apt history.

```
Usage:
apt-history.sh [--all] {<dpkg VERB>|<CUSTOM>|full-log}
   dpkg VERB    install|upgrade|remove|rollback
   CUSTOM       pattern matched by grep. For example:
                  * status installed
                  * package name
   log          display recent history
   full-log     display whole history. Includes compressed old files
   --all        enables full log inspection.
```

## Precursors
* Based on original script (2005):
  http://redclay.altervista.org/wiki/doku.php?id=projects:old-projects
* You can also refer to below url to get in context:
  http://linuxcommando.blogspot.com.es/2008/08/how-to-show-apt-log-history.html

## License
* Copyright (c) 2015
* Author: Victor Arribas <v.arribas.urjc@gmail.com>
* License: GPLv3 <http://www.gnu.org/licenses/gpl-3.0.html>
* Master: https://github.com/varhub/apt-history

