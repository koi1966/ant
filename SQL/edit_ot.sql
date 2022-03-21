SELECT left(dogovor,2) AS jek,sum(summ) AS SUMM 
from karta where data_r >= '2002.10.01'
AND data_r < '2002.11.01'
group by jek