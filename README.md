**Give permissions and run the script**
chmod +x system_monitor.sh
./system_monitor.sh
**Run the script automatically via cron**
crontab -e
**Next, you can verify that cron is running using:**
systemctl status cron
