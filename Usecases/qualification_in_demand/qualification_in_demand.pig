//Extracting data from company data set and sorting based on skills
a = load 'ss' using PigStorage (':') as (skill:chararray,sector:chararray);
b = foreach a generate $1,$0;    
c = group b by $0;   
d = foreach c generate group,COUNT(b);  
e = foreach d generate group,COUNT(c);   
f = filter e by $1!=0 and $0!='Sectors And Skills';


  
  
//Extracting data from empsurvey dataset and sorting based on skills 
A = load 'empsurvey1k.csv' using PigStorage(',');
B = foreach A generate $4;    
C = group B by $0;    
D = foreach C generate group,COUNT(B);
E = JOIN D by $0 LEFT OUTER,f by $0;
F = foreach E generate $0,$1,$3;
G = filter F by $1>$2;  
H = filter F by $2>$1;
  
//need-acquired ; students should acquire these skills
I = foreach H generate $0,$2-$1;
//acquired-need=more companies need to be set up to utilize this skill
J = foreach G generate $0,$1-$2;
dump I;

/*Output:
(c#,102)
(cdl,70)
(jsp,51)
(ndt,584)
(psim,1559)
(editing,88)
(labview,555)
(webdesign,49)
(marginal accurity,602)
(petroleum engineering,10)
(management information,88)
*/

dump J;
/*Output:
(c,1405)
(c++,2951)
(cfd,3435)
(fea,2437)
(php,1894)
(plc,2913)
(sap,3018)
(seo,907)
(vmc,983)
(cadd,2013)
(ccna,1844)
(creo,906)
(java,1448)
(keil,1932)
(proe,2897)
(unix,977)
(ansys,914)
(catia,393)
(linux,936)
(nxcad,1373)
(delmia,2920)
(dotnet,1441)
(five s,1462)
(fluent,3392)
(gambit,5998)
(matlab,847)
(oracle,2457)
(piping,838)
(pspice,2428)
(python,494)
(survey,950)
(xilinx,2442)
(abrisal,3860)
(android,1340)
(Java,2434)
(ibm db2,1890)
(mastron,455)
(estimation,1989)
(hydraulics,2468)
(multimedia,2440)
(networking,3388)
(pneumatics,2510)
(rivet-cadd,1951)
(film making,3403)
(food safety,1943)
(gene therpy,473)
(programming,390)
(unigraphics,5424)
(vlsi-xilink,3953)
*/



