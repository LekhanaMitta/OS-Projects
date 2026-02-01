# OS-Projects
## 1. Batch File Copy Utility (Bash Scripting)
*Built a Bash script to copy files from a source directory to a destination directory based on a filename prefix.
*Implemented input validation, interactive overwrite handling, verbose logging, and file count reporting using Unix utilities like find, cp, and wc.
### How to run the code?
#### Step 1: Save the script
Save the code in a file:
```bash
copy_by_prefix.sh
```

#### Step 2: Give execute permission
In the terminal, go to the directory where the file is saved and run:
```bash
chmod +x copy_by_prefix.sh
```
This makes the script executable.

#### Step 3: Run the script
Run it using one of these ways: 
```bash
./copy_by_prefix.sh
```

#### Step 4: Provide inputs when prompted
The script will ask for:
```
Origin directory path
/home/user/source_folder

Destination directory path
/home/user/destination_folder
```
from the source directory to the destination directory.



## 2. Custom 'cut' Command Implementation (Bash + C)
*Recreated core functionality of the Unix `cut` command with support for custom delimiters and complex field selection (single fields, ranges, mixed formats).
*Implemented robust command-line parsing, input validation, and low-level file processing using system calls such as `open`, `read`, and `write`.


### How to Run the Code?

#### Step 1: Save the files
Save the Bash script as:
```bash
run_mycut.sh
````

Save the C source file as:
```bash
mycut.c
```

> Make sure both files are in the **same directory**.

#### Step 2: Give execute permission to the Bash script
```bash
chmod +x run_mycut.sh
```

#### Step 3: Run the script
From the directory containing both files:
```bash
./run_mycut.sh
```

#### Step 4: Provide inputs when prompted
1. **Origin pathname/filename**
   Full path to the input file:

   ```
   /home/user/data/input.txt
   ```

2. **Destination directory path**
   Directory where the output file will be saved:

   ```
   /home/user/output_folder
   ```

3. **Delimiter (optional)**
   Enter `y` to specify a delimiter, or `n` to use the default (tab).
   Examples:

   * `,` (comma)
   * `|` (pipe)
   * space (press space once)
   * tab (press the Tab key)

4. **Range of fields**
   Examples:

   ```
   1,2,4
   3-6
   1,3-5,8
   ```

---

#### Step 5: Output

The script creates an output file in the destination directory with the name:

```text
output_<original_filename>
```

Example:
```
/home/user/output_folder/output_input.txt
```
## Example Execution

Input file:
```text
/home/user/data/sample.csv
```

Delimiter:
```text
,
```

Fields:
```text
1,3-4
```

Result:
```text
/home/user/output_folder/output_sample.csv
```

## 3. Producer–Consumer Synchronization Using Shared Memory (C)

This project implements the classic **Producer–Consumer problem** using **shared memory** and **Unix signals** for synchronization. The goal is to coordinate two independent processes without busy waiting, ensuring correct access to shared data.
* Implemented a producer and a consumer process that communicate through a shared memory segment.
* Used signal-based blocking and unblocking to synchronize access instead of spin locks or busy waiting.
* Ensured correctness and data consistency across thousands of iterations.

- A shared memory structure stores:
  - Shared counter
  - Process IDs of producer and consumer
  - Synchronization variables (`full` and `empty`)
- The **producer** increments the shared value.
- The **consumer** decrements the shared value.
- Blocking and unblocking are implemented using:
  - `pause()` to block
  - `kill()` with `SIGUSR1` to wake the other process
- This design avoids busy waiting and demonstrates OS-level synchronization.

---

### How to Run the Code?

#### Step 1: Save the files
Save the producer code as:
```bash
producer.c
````

Save the consumer code as:
```bash
consumer.c
```

> Both files must be in the **same directory**.

#### Step 2: Compile the programs

```bash
gcc producer.c -o producer
gcc consumer.c -o consumer
```

---

#### Step 3: Run the programs

 **Important:** Start the consumer first.
```bash
./consumer
```

In a separate terminal:
```bash
./producer
```

* The producer increments a shared variable for a fixed number of iterations.
* The consumer decrements the same variable.
* Final output confirms correct synchronization and shared memory usage.

Example:
```text
Producer Program Started...
Consumer Program Started...
Producer: Final Value of data->x = 0
```

