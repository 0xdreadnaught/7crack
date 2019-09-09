# 7crack
Multi-threaded 7Zip dictionary tool in bash

7crack breaks apart a wordlist into chunks, with each thread processing its own part of the wordlist. By default, the script runs 5 threads unless thread count is specified. Although the performance difference is heavily dependant on the system itself, from my testing 10 threads is roughly 70% faster than normal single threaded 7Zip cracking.

Although this tool isn't quite complete, it's stable enough for use.

# Usage:

*./7crack.sh <archive.7z> </wordlist/to/use>*

*./7crack.sh <archive.7z> </wordlist/to/use> <thread count>*

* Depending on system configuration, this may require sudo/root. The thread that finds the correct password will use kill -9 to kill off the other threads.

# To-Do:

Add an option for copying the archive for each thread to prevent possible access locks. I have yet to encounter this issue, but I have a hunch that it will also increase performance. This option will be disabled by default since this can greatly increase storage consumption.
