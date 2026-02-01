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
