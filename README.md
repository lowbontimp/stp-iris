# stp-iris.pl
`stp-iris.pl` is a perl script for downloading seismic waveform data in the format of [SAC](http://ds.iris.edu/files/sac-manual/) from http://service.iris.edu on the command-line interface.

## Installation
### 1. Perl library
You should install perl libraries below. 

* Term::ReadLine
* LWP::UserAgent
* HTTP::Request
* Date::Calc::XS
* IO::Uncompress::Unzip
* File::Path

Perl library can be easily installed using `cpan`

```
$) cpan
cpan> install Term::ReadLine
cpan> install LWP::UserAgent 
...
and so on.
```

### 2. Setting the path of `sac`
```
my $sac = "/opt/sac/bin/sac" ;
```

## Tutorial
### Start
Start `stp-iris.pl`.
```
$) chmod +x ./stp-iris.pl
$) ./stp-iris.pl
```
Permit to make a working directory.
```
./.tmpdir.aJyrZ0RjID782P88 will be generated. [y/n]:
```
You might see below.
```
+++++++++++++++++++++++++++
|       stp-iris.pl       |
|(http://service.iris.edu)|
+++++++++++++++++++++++++++

Version 1.00 (Apr. 2021)

Type help(h) to see usage.

---------------------------
```

### Downloading the sac files for an earthquake
```
evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- BHZ
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
### Define the box where the stations are searched
```
my $box ;
$box .= "&minlat=38.8533" ;
$box .= "&maxlat=51.149" ;
$box .= "&minlon=-134.0732" ;
$box .= "&maxlon=-122.3837" ;
```
Use [IRIS's gmap](http://ds.iris.edu/gmap) to find a proper box.


### Changing directory where files are saved
```
dir data01/001
evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- BHZ
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
input filepath
```
where the _filepath_ contains multiple lines of the commands.

An example file is
```
dir data01/001
evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- BHZ
evt 2015/09/08,08:19:53.790 -33.1147 -178.2046 12.77 5.5(mww) O(-200) O(1800) 7D % -- HHZ
dir data01/002
evt 2015/09/09,07:05:44.490 -49.5321 -116.3317 10.0 5.9(mwb) O(-200) O(1800) 7D % -- BHZ
evt 2015/09/09,07:05:44.490 -49.5321 -116.3317 10.0 5.9(mwb) O(-200) O(1800) 7D % -- HHZ
dir data01/003
evt 2015/09/11,21:19:18.000 -5.98 146.66 26.0 5.5(mwc) O(-200) O(1800) 7D % -- BHZ
evt 2015/09/11,21:19:18.000 -5.98 146.66 26.0 5.5(mwc) O(-200) O(1800) 7D % -- HHZ
dir data01/004
evt 2015/09/11,21:19:18.660 -5.9797 146.6564 26.0 5.5(mww) O(-200) O(1800) 7D % -- BHZ
evt 2015/09/11,21:19:18.660 -5.9797 146.6564 26.0 5.5(mww) O(-200) O(1800) 7D % -- HHZ
dir data01/005
evt 2015/09/12,13:38:01.000 41.9 142.65 49.0 5.5(mwc) O(-200) O(1800) 7D % -- BHZ
evt 2015/09/12,13:38:01.000 41.9 142.65 49.0 5.5(mwc) O(-200) O(1800) 7D % -- HHZ
!zip -r data01.zip data01
```
where `!` enables one to run a linux command.

### Quit
```
quit
```

### Help
```
help
```
## Example 1 (many teleseismic earthquakes)
Convert the event file, _cascadia1234.events_ made by the program [JWEED](https://ds.iris.edu/ds/nodes/dmc/software/downloads/jweed/), to an input file of `stp-iris.pl`.
```
$) jweed2stp.pl > cmd01
```
After turning on `stp-iris-pl`,
```
input cmd01
```


## List of to do
- [ ] Option to change 'O' into other phases, such as 'P' or 'S' (using raytracing program)

## Contact
Hobin Lim, PhD, hbim76@gmail.com
_Seoul National University_
