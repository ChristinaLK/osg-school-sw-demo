# OSG School Software Demo

This demo illustrates some of the principles from the "Backpacking with Code" 
presentation for the [Open Science Grid User School](https://osg-htc.org/user-school-2022/). 

## Setup

Clone this repository to a CHTC Access point and to your local computer. 

When ready to teach, prep the following: 
- a local terminal, having sourced the `setup.local.txt` file
- on the CHTC Access Point, submit the `template.submit` file interactively. 
	```
	$ condor_submit -i template.submit
	```
- once the interactive job starts, source the `setup.simple.txt` file and then delete it.
- (Optional): Open another local terminal + navigate to where `R` is installed on 
the local computer. 

I often make the "local" and "remote" terminals different colors, to even more 
clearly distinguish them. 

## Narration

First we show the transition from using a GUI to the command line. 

Show running the script `simple.R` using RStudio. Then switch over 
to the local terminal and show how to run it using the command line: 

```
Local$ Rscript simple.R
```

Next, we switch to a running job, to show how this looks on the OSPool. 

We first try to run the same command that we did on our computer: 

```
Execute$ ls
Execute$ Rscript simple.R
```

This should fail - this means that we don't have the needed R execution 
files on the node and need to get them. Later in the talk we'll talk 
about how to find or create the needed files, but for now, we'll just 
pull a pre-prepared copy from a web server: 

```
Execute$ wget http://proxy.chtc.wisc.edu/SQUID/chtc/R402.tar.gz
Execute$ tar -xzf R402.tar.gz
Execute$ rm R402.tar.gz
Execute$ ls
```

Our R files are contained in the folder called `R`

```
Execute$ ls R
Execute$ ls R/lib64/R/
Execute$ ls R/bin
```

Trying to run again will fail: 

```
Execute$ Rscript simple.R
```

Because we need to explain where the files are! We can do this in two ways. 

We can provide a path to the Rscript file: 

```
Execute$ R/bin/Rscript simple.R
```

The other way is to add the location of the Rscript folder to the PATH: 

```
Execute$ export PATH=$PWD/R/bin:$PATH
```

> Explain this whole command: we are re-setting the PATH, using 
> a shortcut for the current directory, the colon `:` as a separator, 
> and then appending the existing PATH at the end. 

Now I can just run `Rscript` just like on my computer. 

```
Execute$ Rscript simple.R
```

Note that this example doesn't use any packages, but the principle is 
similar -- you need to have the package files and say where they are. 
This example for R can be extended to most scripting languages (Python, Julia) 
and other compiled programs. 