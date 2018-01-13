data = load 'top.txt' using PigStorage(',') as (user:chararray, value:chararray, counter:int);
groupUser = GROUP data BY user;
topN = foreach groupUser {
        sorted = order data by counter desc;
        topN    = limit sorted 2;
        generate flatten(topN);
};
dump topN;