load data local inpath '/home/cloudera/project/sample/company.csv' into table company; 
select sectorskill,':',vacancy from company;     
insert overwrite local directory '/home/cloudera/project/skillvacant' row format delimited fields terminated by ':' select sectorskill,':',vacancy from company;

select psect,COUNT(psect) from empsur1 group by psect;    
insert overwrite local directory '/home/cloudera/project/psect' row format delimited fields terminated by ',' select psect,COUNT(psect) from empsur1 group by psect;