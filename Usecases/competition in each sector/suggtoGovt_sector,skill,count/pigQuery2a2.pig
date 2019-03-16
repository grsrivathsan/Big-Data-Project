a = load 'skillvacant' using PigStorage(':');
b = foreach a generate $1,$2;
c = group b by $0;
d = foreach c generate group,COUNT(b);
dump d;
e = order c by $1 desc;