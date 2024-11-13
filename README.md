# faulty_battery_bypass

This script allows you to easily toggle the `upower.service` on your Linux system, which can help if you're experiencing issues with battery management.


Features
--------

* Disables/enables the `upower.service` with a single command
* Logs execution messages to console and a log file
* Creates a temporary file to track execution state


## Usage

   **Download the script**

   `git clone `


1. **Make the Script Executable**:

  `chmod +x power.sh`

2. **Run the Script**: You can run the script with the following command:

   `sudo ./power.sh`

3. **Run the Script from Anywhere**: To run the script from any location in the terminal, move it to a directory included in your `PATH`, such as `/usr/local/bin`:

   `sudo mv power.sh /usr/local/bin`

   Now you can execute the script simply by typing:

   `sudo power`




## Execution Flow

    First Execution:
        Disables upower.service by renaming it to upower.service(disabled).
        Reloads the systemd manager configuration.
        Stops the upower.service.
        Creates a temporary file to indicate execution.

    Subsequent Executions:
        Enables upower.service by renaming it back to its original name.
        Reloads the systemd manager configuration.
        Starts the upower.service.
        Removes the temporary file.


## Drawbacks

Please note that toggling the `upower.service` may cause the following issues when on battery:

1. Network card malfunctions
2. Sleep/suspend not working unless the lid is closed
3. Laggy performance
4. High quality videos stuttering

## Script Details
--------------

The script checks if a temporary file exists to determine whether to disable or enable the `upower.service`. If the file does not exist, the script disables the service; otherwise, it enables the service.

The script logs messages to both the console and a log file, and creates a temporary file to track execution.

## Privacy
-------

This script does not collect or transmit any personal information. It only modifies the `upower.service` on your local system.

## License
-------

This script is released under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements
---------------

This script was created based on the user's manual steps to disable the `upower.service`.








































