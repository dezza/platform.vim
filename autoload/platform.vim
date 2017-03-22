  let g:platform = 0
  let g:distro = 0
  " more distros to detect:
  "https://www.novell.com/coolsolutions/feature/11251.htm://www.novell.com/coolsolutions/feature/11251.html 
  let g:uname = substitute(system('uname'), '\n\+$', '', '')
  let g:slash='/'
  if filereadable('/etc/debian_version')
      let g:platform='Linux'
      if !empty(system("grep 'Microsoft' '/proc/version' 2>/dev/null"))
        " Windows Subsystem for Linux
        let g:distro='WSL'
      else
        let g:distro='Debian'
      endif
  elseif has('mac')
      let g:platform='Darwin'
      let g:distro='OS X'
  elseif exists('g:uname') && g:uname ==# 'FreeBSD'
      let g:platform='FreeBSD'
      let g:distro='FreeBSD'
  elseif has('unix')
      let g:platform='UNIX'
  elseif has('win32') || has('win64') "win32 also matches on win64 so redundant
      let g:platform='Windows'
      let g:slash='\'
  elseif has('win32unix')
      let g:platform='Cygwin'
  else
      let g:platform='Unknown'
  endif
