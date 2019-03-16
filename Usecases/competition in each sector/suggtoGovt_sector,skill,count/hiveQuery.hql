load data local inpath 'homeclouderaprojectsamplecompany.csv' into table company; 
select sectorskill,'',vacancy from company;     
insert overwrite local directory 'homeclouderaprojectskillvacant' row format delimited fields terminated by '' select sectorskill,'',vacancy from company;
select psect,COUNT(psect) from empsur1 group by psect;    
insert overwrite local directory 'homeclouderaprojectpsect' row format delimited fields terminated by ',' select psect,COUNT(psect) from empsur1 group by psect; 