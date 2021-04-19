How to use stp-iris.pl

**Installation**

You should perl libraries below. 

Term::ReadLine
LWP::UserAgent
HTTP::Request
Date::Calc::XS
IO::Uncompress::Unzip
File::Path

Perl library can be easily installed using 'cpan'

$) cpan
cpan> install Term::ReadLine
cpan> LWP::UserAgent 
...
and so on.


**Tutorial**
$) chmod +x ./stp-iris.pl
$) ./stp-iris.pl

+++++++++++++++++++++++++++
| SAC Transfer Protocol   |
|    (----.---.--.--)     |
+++++++++++++++++++++++++++

Type help(h) to see usage.

---------------------------


id: [something you know]
pw: [something you know]

your accessible networks: NN

STP) dir data/001 (change the directory where files are saved)
STP) evt 2020/11/30,13:41:40.0 35.75 129.38 9.0 0.9(ML) O(-200) O(600) NN 030D DPZ (-200 to 600 s to origin time)
STP) evt 2020/11/30,13:41:40.0 35.75 129.38 9.0 0.9(ML) P(-200) S(500) NN 030D DPZ (from P - 200 s to S + 500 s)
STP) dir data/002
STP) evt 2020/11/30,13:41:40.0 35.75 129.38 9.0 0.9(ML) O(-200) S(500) NN 040D DP_ (3 components)
STP) evt 2020/11/30,13:41:40.0 35.75 129.38 9.0 0.9(ML) O(-200) S(500) NN % DPZ (all stations)

STP) quit (to quit)


See also input, help, sta, etc.

--Note--
Using P( ) or S( ) flag slows down the process. O( ) is recommended.


usage:
 1. win NET STA COMP yyyy/mm/dd,hh:mm:ss.ms span(unit)
    NET:
      network code or % for all networks
    STA:
      station code or % for all stations
    COMP:
      component such as BHZ or % for all components.
    span a length of window you want to cut and its unit
	unit can be any one of Y(year), M(month), D(day)
      , h(hour), m(min), s(sec).
    e.g., 
      win % % BHZ 2010/01/01,00:00:00 1h
      win KS GAHB BH_ 2010/01/01,00:00:00 1h
      (% and _ are wild cards that are similar with * and ? in Linux)
 2. win NET STA COMP yyyy/mm/dd,hh:mm:ss.ms yyyy/mm/dd,hh:mm:ss.ms 
   	e.g.,
      win KS GAHB BHZ 2010/01/01,00:00:00 2010/01/01,01:00:00

 3. !(linux command)
    For example, 
      !ls

 4. dir output_directory (.)
    You can change the directory where the output sac files are saved.
    The directory will be automatically made.

 5. input filepath
    The file contains the commands of the stp.

 6. sta
    station information.

 7. seto time_o (in sec)
    The O marker is set to yyyy/mm/dd,hh:mm:ss.ms + time_o
	default=0
    Maybe it works, but I have not tested this command.

 8. evt origin_time lat long depth mag(class) P|S|O(+t1) P|S|O(+t2) net sta chn
    e.g.,
      evt 2010/01/01,12:34:56.5 30 120 123.5 5.6(mb) P(-100) S(200) KS % BHZ
      evt 2010/01/10,00:27:41.85 40.6654 -124.4669 20.6 6.5(MW) P(-50) P(200) K_ % BHZ
      evt 2013/04/20,00:02:47.0 30.31 102.89 14 6.6(MW) P(-100) P(100) K_ % BH_
      evt 2013/04/20,00:02:47.0 30.31 102.89 14 6.6(MW) O(-200) O(500) K_ % BH_
      evt 2016/09/12,10:44:32.0 35.77 129.19 10 5.8(M) O(-200) O(500) KS % HHZ
      evt 2017/11/15,05:29:32.0 36.12 129.36 9 5.4(Mw) O(-200) S(500) KS % HGZ

      'O' denotes origin time. It is useful when you do not want to waste time in ray-tracing (taup).
      If wanting to use other phase, such as PP, you should modify a subroutine 'trvt' below.

 9. dec factor1 [factor2...]     
     downsampling sacfiles by decimate command of the SAC(v101.6a)
     where the factors should be between 2 and 6.
     e.g.,
       dec 2 5     (for downsampling from 100 Hz to 10 Hz)
       dec 2 5 2 5 (for downsampling from 100 Hz to 1 Hz)

 10. skip on|off (off is default)
     If the output file exists at an path for sac file to be saved,
     `stp' is skipped. It works only with `evt'.

 11. quit(q)

  ---------------------------------------------
  Email me (hbim76@gmail.com) for notification of an update.
