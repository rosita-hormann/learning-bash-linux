# Run in background

To run something in background (for example, a Python script, a command, Java program, etc) there is some things you can do to achieve it:

```bash
[command] & # converts process on background job
jobs #outputs all current jobs and their statues
disown # disown last job
```
## redirecting outputs
```bash
[command] > file.out # Redirects stdout to file.out
[command] 2> file.err # Redirects stderr to file.err
```