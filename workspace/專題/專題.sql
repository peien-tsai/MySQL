SELECT * FROM house.renewtaipei
where trade_date > '2011-12-31';

SELECT * FROM house.newtaipei
where trade_date > '2011-12-31'
group by trade_date;

SELECT trade_date, COUNT(*) FROM house.renewtaipei
where trade_date > '2011-12-31'
group by trade_date;



SELECT trade_date, COUNT(DISTINCT(trade_date)) FROM house.renewtaipei
where trade_date > '2011-12-31'
group by trade_date;

SELECT trade_date, COUNT(*) FROM house.renewtaipei
where trade_date = '2012-07-25';


SELECT buildingstate, COUNT(*) FROM house.renewtaipei
where trade_date > '2011-12-31';

