# fluent related
alias systail='tail -f /var/log/system.log'

# td-agent
alias tdstart='sudo launchctl load /Library/LaunchDaemons/td-agent.plist'
alias tdstop='sudo launchctl unload /Library/LaunchDaemons/td-agent.plist'
alias tdrestart='tdstop && tdstart'
alias tdtail='tail -f /var/log/td-agent/td-agent.log'
alias tdtest="curl -X POST -d 'json={\"json\":\"message $RANDOM\"}' http://localhost:8888/debug.test"

# fluentd (as gem)
alias flstart="fluentd -c ~/fluent/fluent.conf -vv"
alias flstop="killall -9 fluentd"
