# resendbot service

To set up the service copy the script to the `init.d` directory and make all necessary scripts executable:

```bash
sudo cp /root/anonym_resend_bot/scripts/resendbot_service.sh /etc/init.d/run_resendbot
sudo chmod +x /etc/init.d/run_resendbot
sudo chmod +x /root/anonym_resend_bot/scripts/run_resendbot.sh

# Make the service restart after the server is rebooted
sudo update-rc.d run_resendbot defaults
```

The server should be used like this:

```bash
sudo service run_resendbot [start|stop|restart|status]
```

The service runs our `scripts/run_resendbot.sh` script which calls the resendbot rake task

Set up log rotation:

```bash
sudo touch /var/log/run_resendbot.log
sudo chown root /var/log/run_resendbot.log

sudo nano /etc/logrotate.conf
```

Insert the following settings to the very end of the `logrotate.conf`:

```
/var/log/run_resendbot.log {
  daily
  missingok
  rotate 7
  compress
  delaycompress
  notifempty
  copytruncate
}
```
