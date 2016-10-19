# AndroidScripts
Some useful scripts for Android.
# Usage
Find below some details how to use the scripts.
## Utils
Useful scripts for application developer (software).
### 1. genimgs
Easy way to generate images to all resolutions.

**Pre condition:**

1. You must have ImageMagick installed in your computer. More details about ImageMagick [here](http://www.imagemagick.org/script/index.php).
2. The script uses images from 3 folders:
  * resources - contains all xxhdpi resources
  * actionbar - contains all xxhdpi resources releated to action bar
  * actionbar_land - contains all xxhdpi landscape resources related to action bar

**HOW TO USE**

Move the script to folder that contains 3 folders mentioned before and run:
```
~$ ./genimgs
```
And voilà, the script will generate images to all resolutions. So, you just need move all folder from out to your Android project.
### 2. getwifi
Easy way to get WI-FI password from Android phone.

**Attention:** Only works when android phone is rooted. 

**HOW TO USE**
```
~$ ./getwifi
```
### 3. monkey
Easy way to run monkey test. If you are interested to know more about monkey test, please see this [link](https://developer.android.com/studio/test/monkey.html).

**HOW TO USE**

Commands:
```
~$ ./monkey [PACKAGE] [optional: NUMBER_OF_EVENTS (default: 720000)] [optional: ROUND (default: 1)] [optional: SEED]
```
Example :
```
~$ ./monkey com.itspen.app
~$ ./monkey com.itspen.app 5000000 3 345
```
### 4. screenshoot
Easy way to take Android phone screenshoot and grab in your computer.

**HOW TO USE**
```
~$ ./screenshot
```
### 5. todate
Easy way to convert Unix time (seconds) to UTC time.

**HOW TO USE**

Commands:
```
~$ ./todate [seconds]
```
Example:
```
~$ ./todate 1476676336
```
### 6. tomdate
Easy way to convert Unix time (milliseconds) to UTC time.

**HOW TO USE**

Commands:
```
~$ ./todate [milliseconds]
```
Example:
```
~$ ./todate 1476676336400
```
### 7. tohex
Easy way to convert decimal number to hexadecimal. I usually use to convert alpha to hex.

**HOW TO USE**

Commands:
```
~$ ./tohex [0-100]
```
Example :
```
~$ ./tohex 67
```
### 8. tojpg
Easy way to convert all png files to jpg in a folder

**HOW TO USE**

Commands:
```
~$ ./tojpg [folder_path] [optinal: output_folder_path]
```

Example :
```
~$ ./tojpg resources
~$ ./tojpg resources resources_jpg
```
### 9. unlock
Easy way unlock your Android phone.

**Attention:** You phone must allow install unknown source.

**HOW TO USE**

```
~$ ./unlock
```
## Framework
Useful scripts for framework developer (middleware).
### 1. setlocalprop
Easy way to enable log on device with verbose priority. If you are interested to know more about monkey test, please see this [link](http://stackoverflow.com/questions/4126815/android-logging-levels).

**HOW TO USE**

Commands:
```
~$ ./setlocalprop.sh [TAG] [TAG] [TAG]..
```
Example :
```
~$ ./setlocalprop.sh ZenModeHelper ZenModePanel ZenModeController VolumeUI ManagedServices
```
### 2. systemuilog
Easy way to enable log on systemui without reboot.

**HOW TO USE**

TAG - tag name, e.g. ZenModePanel, usually it is class name.
priority - the priority of log, could be (default: V):
* v - Verbose (lowest priority)
* d - Debug
* i - Info
* w - Warning
* e - Error
* f - Fatal
* s - Silent (highest priority, on which nothing is ever printed)
Commands:
```
~$ ./systemuilog.sh [TAG] [priority]
```
Example 1:
```
~$ ./systemuilog.sh ZenModePanel
```
Example 2:
```
~$ ./systemuilog.sh ZenModePanel w
```
### 3. sysui
Translate sysui log codes into strings. Following the filters:
* sysui_view_visibility
* sysui_action
* sysui_count
* sysui_histogram

**HOW TO USE**

Return all filters:
```
~$ ./sysui.sh [aplogcat-events.txt path]
~$ adb logcat -b events | ./sysui.sh
```
Return a specific filter:
```
~$ ./sysui.sh [aplogcat-events.txt path] | grep sysui_view_visibility Filtered by sysui_view_visibility
~$ ./sysui.sh [aplogcat-events.txt path] | grep sysui_action          Filtered by sysui_action
~$ ./sysui.sh [aplogcat-events.txt path] | grep sysui_count           Filtered by sysui_count
~$ ./sysui.sh [aplogcat-events.txt path] | grep sysui_histogram       Filtered by sysui_histogram
```
# Setup
Download the scripts and add bash script folder to path. Please see below the steps:

1. Open .bashrc file, for example:

  ```
  zhenlei@zenbook:~$ nano .bashrc
  ```
2. Add bash script folder to path:

  ```
  export PATH=$PATH:/home/zhenlei/git/AndroidScripts
  ```

And voilà! All script in AndroidScripts folder will be recognized by command line.

**ATTENTION**

Bear in mind that genimgs script must be moved to specific folder that contains 3 folders mentioned (resources, actionbar, actionbar_land) before to run. The reason to do that is, the script was used for UI/UX team that does not know using script well, and by that just click in the script to run.
# License
	Copyright 2016 Zhenlei Ji

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
