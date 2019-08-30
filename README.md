# 7crack
multi-threaded 7Zip dictionary tool in bash

7crack breaks apart a wordlist into chunks, which each threads processing its own part of a wordlist. By default, the script runs 5 threads unless thread count is specified. Although the performance difference is heavily dependant on the system itself, from my testing 10 threads is roughly 70% faster than normal single threaded 7Zip cracking.

Although this tool isn't quite complete, it's stable enough for use.

# Usage:

./7crack.sh <archive.7z> </wordlist/to/use>
./7crack.sh <archive.7z> </wordlist/to/use> <threads>

* Depending on system configuration, this may require sudo/root. The thread that finds the correct password will use kill -9 to kill off the other threads.
