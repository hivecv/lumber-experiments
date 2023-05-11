# Example code for RPi deployment

Requirements:
- RPi 4
- SD card

## OS selection

For this experiment, we'll use Debian 11.

All images from debian for Raspberry Pi can be found here - https://raspi.debian.net/
We will use this image specifically - https://raspi.debian.net/tested/20230102_raspi_4_bullseye.img.xz 

![os.png](https://github.com/hivecv/lumber-sdk/assets/5244214/21accdb8-ba07-4762-9c2b-e437882bb631)

Flash this image to your SD card using

```
xzcat raspi_${RPI_MODEL}_${DEBIAN_RELEASE}.img.xz | dd of=${SD_CARD} bs=64k oflag=dsync status=progress
```

More info [here](https://wiki.debian.org/RaspberryPiImages)

## Enabling WiFi & SSH connection

Once the system boots on your RPi, you will be able to log in as `root` without any 
password. You won't be able to login via SSH to this account though.

- To connect with the WiFi
  - Modify the `/etc/network/interfaces.d/wlan0` file to have the following content
    
    ```
     allow-hotplug wlan0
     iface wlan0 inet dhcp
     iface wlan0 inet6 dhcp
         wpa-ssid <network_ssid>
         wpa-psk <network_pass>
    ```
  - Reboot the RPi
  
    ```
    systemctl reboot
    ```
- To connect with SSH
  - Create a new user with 
  
    ```
    useradd <username>
    ```
  - Add `sudo` command with
  
    ```
    apt update && apt install sudo
    ```
  - Add user to sudo group
  
    ```
    usermod -aG sudo <username>
    ```
  - Check device IP address using
  
    ```
    ip addr
    ```
  - [On your PC] Connect to device over SSH using
  
    ```
    ssh <username>@<ip_address>
    ```

## Start this code

First, let's install `git` with 

```
sudo apt-get install git
```

Now, clone the repository using

```
git clone https://github.com/hivecv/lumber-experiments.git
```

Go to `01-raspi-deployment` directory and run the `install_dependencies.sh` script

```
cd 01-raspi-deployment
./install_dependencies.sh
```

Now, create a virtual environment and install Python dependencies

```
python3.9 -m venv venv
source ./venv/bin/activate
pip install -U pip
pip install --extra-index-url https://www.piwheels.org/simple --prefer-binary -r requirements.txt
```

Finally, run the `main.py` script with

```
python main.py
```