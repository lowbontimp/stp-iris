# stp-iris.pl


## Installation

You should install perl libraries below. 

* Term::ReadLine
* LWP::UserAgent
* HTTP::Request
* Date::Calc::XS
* IO::Uncompress::Unzip
* File::Path

Perl library can be easily installed using 'cpan'

```
$) cpan
cpan> install Term::ReadLine
cpan> LWP::UserAgent 
...
and so on.
```


## Tutorial
Starting `stp-iris.pl`.
```
$) chmod +x ./stp-iris.pl
$) ./stp-iris.pl
```
Permit to make a work directory.
```
./.tmpdir.aJyrZ0RjID782P88 will be generated. [y/n]:
```
You might see below.
```
+++++++++++++++++++++++++++
|   SAC transport tool    |
|(http://service.iris.edu)|
+++++++++++++++++++++++++++

Version 1.00 (Apr. 2021)

Type help(h) to see usage.

---------------------------
```

### Downloading the sac files for an earthquake.
```
STP) evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- BHZ
1   2                       3        4         5     6        7       8       9  1011 12
```
```
1: command name
2: yyyy/mm/dd,hh:mm:ss(.sss)
3: latitude
4: longitude
5: depth
6: magnitude(class of magnitude)
7: Starting time in terms of origin time defined at '2'
8: Ending time in terms of origin time defined at '2'
9: network (wild cards: % = * and _ = ? in Linux)
10: station (same above)
11: location (same above)
12: channel (same above)
```
Output looks like this.
```
saved: ./20150908081953.7D.FS04D.--.BHZ.sac
saved: ./20150908081953.7D.FS08D.--.BHZ.sac
saved: ./20150908081953.7D.FS44D.--.BHZ.sac
saved: ./20150908081953.7D.G10D.--.BHZ.sac
saved: ./20150908081953.7D.G33D.--.BHZ.sac
saved: ./20150908081953.7D.G37D.--.BHZ.sac
saved: ./20150908081953.7D.J20D.--.BHZ.sac
saved: ./20150908081953.7D.M16D.--.BHZ.sac
```

### Changing directory where files are saved
```
STP) dir data01/001
STP) evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- BHZ
```
Output looks like this.
```
saved: ./data01/001/20150908081953.7D.FS04D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.FS08D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.FS44D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.G10D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.G33D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.G37D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.J20D.--.BHZ.sac
saved: ./data01/001/20150908081953.7D.M16D.--.BHZ.sac
```

### Input list of commands
```
STP) input filepath
```
where the filepath contains multiple lines of the commands.

### Quit
```
quit
```

### Help
```
help
```



 5. input filepath
    The file contains the commands of the stp.
  Email me (hbim76@gmail.com) for notification of an update.
