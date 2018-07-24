if exists("b:did_ftplugin")
  finish
endif

setlocal formatoptions+=tcqln formatoptions-=r formatoptions-=o
setlocal tw=80
