a = load 'empexchange1k.txt' using PigStorage(',') 
A = load 'empsurvey1k.csv' using PigStorage (',') 
b = JOIN A by $0,a by $0;  
store 'b' into 'combined;

c = load 'combined.json' using JsonLoader('id:int,empstatus:chararray,csect:chararray,psect:chararray,skillsacq:chararray,exp:int,ai:chararray,country:chararray,income:chararray,sect:chararray,tenth:double,twelthf:double,coursef:chararray,age:int,gender:chararray,region:chararray,moi:chararray,twelth:double,course:chararray');

d = filter c by $2 == 'SELF';  
e = group d by $16;  
f = foreach e generate group,COUNT(d); 
