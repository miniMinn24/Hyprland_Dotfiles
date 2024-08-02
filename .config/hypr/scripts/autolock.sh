pkill xautolock
xautolock -time 10 -locker "sh ~/.config/hypr/scripts/wlogoutsh/lock.sh" -notify 30 -notifier "notify-send 'Screen will be locked soon.' 'Locking screen in 30 seconds'"