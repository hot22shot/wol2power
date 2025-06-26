# Press down
echo 1 > /sys/class/gpio/gpio503/value

# Wait for 1 second
sleep 1

# Release
echo 0 > /sys/class/gpio/gpio503/value
