autoload -U +X bashcompinit && bashcompinit

autoload -U +X compinit && compinit
[ -f /Users/hperera/fubectl.source ] && source /Users/hperera/fubectl.source

autoload -Uz compinit && compinit

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

alias ls='ls -GpF'

