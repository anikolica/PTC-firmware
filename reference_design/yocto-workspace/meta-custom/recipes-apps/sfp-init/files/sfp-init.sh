#!/bin/sh

I2C_BUS=3
PHY_ADDR=0x56
SLEEP_TIME=0.2

retry_command() {
    local max_attempts=2
    local delay_seconds=2
    local attempt=1

    while [ $attempt -le $max_attempts ]; do
        echo "Attempt $attempt of $max_attempts..." >&2
        if "$@"; then
            echo "Command succeeded!" >&2
            return 0
        else
            echo "Command failed." >&2
            if [ $attempt -lt $max_attempts ]; then
                echo "Waiting $delay_seconds seconds before retrying..." >&2
                sleep $delay_seconds
            else
                echo "Error: All retry attempts failed." >&2
                return 1
            fi
        fi
        ((attempt++))
    done
}

PHY_ID=$(retry_command i2ctransfer -y $I2C_BUS w1@$PHY_ADDR 0x02 r2 2>/dev/null)
# Check if SFP PHY responds on I2C addr
if [ "$PHY_ID" = "0x01 0x41" ]; then
    echo "Detected Marvell PHY on SFP (I2C bus $I2C_BUS). Initializing..."
    # Ensure correct page is selected
    retry_command i2cset -y $I2C_BUS $PHY_ADDR 0x16 0x0000 w

    sleep $SLEEP_TIME

    # Advertise 1000BASE-T Full Duplex 
    retry_command i2cset -y $I2C_BUS $PHY_ADDR 0x09 0x0003 w

    sleep $SLEEP_TIME

    # Advertise 10/100M Full/Half
    retry_command i2cset -y $I2C_BUS $PHY_ADDR 0x04 0xe10d w

    sleep $SLEEP_TIME

    # Soft Reset the PHY and enable Auto-Neg
    retry_command i2cset -y $I2C_BUS $PHY_ADDR 0x00 0x4091 w

    # Allow PHY PLLs and copper autoneg to stabilize
    # Set link to down so systemd doesn't think it's up
    sleep 6

    # Reconfigure interface so systemd takes over
    networkctl reconfigure end1
    echo "SFP PHY initialization complete."
else
    echo "No Marvell PHY detected on I2C bus $I2C_BUS (ID: '$PHY_ID'). Skipping reset."
fi
