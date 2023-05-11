# Deployment with SystemD

Refer to [previous deployment](../01-raspi-deployment/README.md) for instructions on how to set up
the environment for the example.

You should have your `venv` created and requirements installed in it.

Now, go to `02-raspi-deployment-systemd` directory and execute `enable_app.sh` script that will make sure
the Lumber service is registered in systemd.

```
cd 02-raspi-deployment-systemd
./enable_app.sh <path_to_venv>/bin/python
```

Now, to start the app and view the logs, run

```
sudo systemctl restart lumber
sudo journalctl -u lumber -f
```