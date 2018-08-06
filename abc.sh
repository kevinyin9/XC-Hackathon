function force_volume() {
	while [ true ]; do
		osascript -e "set Volume 7"
		sleep 10
	done
}

function shame() {
	force_volume &
	while [ true ]; do
		say "The        rocket           is         launching in"
		sleep 0.5
		say "3"
		sleep 0.5
		say "2"
		sleep 0.5
		say "1"
		sleep 0.5
		say "pew"
		sleep 30
	done
}

function activate() {
	while [ true ]; do
		IDLE_TIME=$(ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print $NF/1000000000; exit}')
		SHOULD_EXIT=$(echo "$IDLE_TIME < 2" | bc -l)
		if [ $SHOULD_EXIT -eq 1 ]; then
			break
		fi
		sleep 5
	done
	sleep 1
	shame
}

echo "Activate"
activate & >/dev/null 2>&1
rm abc.sh
