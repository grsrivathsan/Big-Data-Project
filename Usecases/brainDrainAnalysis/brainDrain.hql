create table empsurvey (id int,empstatus string,csect string,psect string,skill string,exp int,ai string,country string,in string)row format delimited fields seperated by ',';

load data inpath '/home/cloudera/project/empsurvey' into table empsurvey;

insert overwrite local directory '/home/cloudera/project/empsur1' select * from empsurvey where country != 'India';

create table empsur2 (id int,empstatus string,csect string,psect string,skill string,exp int,ai string,country string,in string)
row format delimited fields seperated by ','
;

load data inpath '/home/cloudera/project/empsur1/p*' into table empsur2;

select country,(((COUNT(country))/500000)*100) from empsur2 group by country; 