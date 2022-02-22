# Close-All-Windows

## Summary
Closes all active windows running. The script gives the user a 5-minute warning
before it runs. The user can keep all the windows open by selecting "Cancel" in
the popup window.

_Note: If you have any questions or comments you can always use GitHub
discussions, or email me at farinaanthony96@gmail.com._

#### Why
Sometimes users forget to close windows when they are done using them. In some
cases this can keep the CPU running at a higher "resting" frequency, which
slows down the whole machine. This script mitigates this issue by closing all
the windows open on the machine.

## Requirements
- PowerShell >= v3

## Usage
- Ideally, this script should be run using the Task Scheduler program. The
  setup for the task should be as follows:
    - General > Check "Run only when user is logged on" and "Run with highest
      privileges"
    - Trigger > Make your own trigger
    - Actions > New... > Action: "Start a program", Program/script:
      "Powershell.exe", Add arguments: "-ExecutionPolicy Bypass
      PATH_TO_SCRIPT\Close-All-Windows.ps1" > OK
    - Conditions > Check "Wake the computer to run this task"
    

- Simply run the script using a PowerShell terminal:
  `./Close-All-Windows.ps1`

## Compatibility
This has only been tested on Windows and most likely will only work on Windows. 
It should be possible to support PowerShell Core on Linux with only minor
adjustments so leave a feature request if there is any interest in that.

## Disclaimer
The code provided in this project is an open source example and should not
be treated as an officially supported product. Use at your own risk. If you
encounter any problems, please log an
[issue](https://github.com/CC-Digital-Innovation/Close-All-Windows/issues).

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request ツ

## History
- version 1.0.3 - 2022/02/22
    - Actually removed license from README.md
    - Updated LICENSE to 2022
    - Added comment-based help section to script
- version 1.0.2 - 2022/02/22
    - Updated README.md with correct issue tracking link
    - Removed license from README.md
    - Added / edited comments
- version 1.0.1 - 2021/06/11
    - Updated README.md to explain Task Scheduler setup
- version 1.0.0 - 2021/06/10
    - Initial release

## Credits
Anthony Farina <<farinaanthony96@gmail.com>>
