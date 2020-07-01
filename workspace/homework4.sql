-- 1.查詢所有比'鳳梨酥'貴的食物名稱、到期日和價格
SELECT f.name,f.expiredate,f.price
FROM food f
WHERE price>(SELECT price
             FROM food
             WHERE name ='鳳梨酥');
-- 2.查詢所有比'曲奇餅乾'便宜且種類是'點心'的食物名稱、到期日和價格
SELECT f.name,f.expiredate,f.price
FROM food f
WHERE price<(SELECT price
             FROM food
             WHERE name ='曲奇餅乾')
AND   catalog='點心';
-- 3.查詢所有和'鳳梨酥'同一年到期的食物名稱、到期日和價格
SELECT f.name,f.expiredate,f.price
FROM food f
WHERE Year(expiredate)=(SELECT Year(expiredate)
                          FROM food
                          WHERE name ='鳳梨酥')
AND f.name not like '鳳梨酥';  -- 去除自己!??!
-- 4.查詢所有比平均價格高的食物名稱、到期日和價格
SELECT f.name,f.expiredate,f.price
FROM food f
WHERE price>(SELECT AVG(price)
			 FROM food);            
-- 5.查詢所有比平均價格低的'台灣'食物名稱、到期日和價格
SELECT f.name,f.price,p.name
FROM food f JOIN place p
ON f.placeid = p.id
WHERE p.name like '台灣'
AND price<(SELECT AVG(price)
		   FROM food);
-- 6.查詢所有種類和'仙貝'相同且價格比'仙貝'便宜的食物名稱、到期日和價格
SELECT f.name,f.expiredate,f.price
FROM food f
WHERE price<(SELECT price
             from food 
             WHERE name='仙貝')
AND   catalog=(SELECT catalog
               from food 
               WHERE name='仙貝');  

-- 7.查詢所有產地和'仙貝'相同且過期超過6個月以上的食物名稱、到期日和價格

-- 過期超過六個月
SELECT name,price,expiredate 
FROM food
WHERE DATEDIFF(expiredate,NOW()-INTERVAL 6 MONTH) <0;

-- 仙貝產地
SELECT p.name
FROM food f JOIN place p
ON f.placeid = p.id
WHERE f.name like '仙貝';

SELECT placeid
FROM food f
WHERE name like '仙貝';


SELECT f.name,f.expiredate,f.price,f.placeid
FROM food f
WHERE DATEDIFF(expiredate,NOW()-INTERVAL 6 MONTH) <0
AND   placeid = (SELECT placeid
                  FROM food f
                  WHERE name like '仙貝');

-- 8.查詢每個產地價格最低的食物名稱、到期日和價格
SELECT name,expiredate,price 
FROM food f
WHERE price in (SELECT MIN(price)
				FROM food
                GROUP BY placeid
                HAVING placeid=f.placeid);  -- 方法1

SELECT name,expiredate,price 
FROM food f
WHERE price in (SELECT MIN(price)
				FROM food
                WHERE placeid=f.placeid);    -- 方法2           
             
-- 9.查詢每個種類的食物價格最高者的食物名稱和價格
SELECT name,expiredate,price 
FROM food f
WHERE price in (SELECT Max(price)
				FROM food
                GROUP BY catalog
                HAVING catalog=f.catalog);  -- 方法1

SELECT name,expiredate,price 
FROM food f
WHERE price = (SELECT Max(price)
				FROM food
                WHERE catalog=f.catalog);    -- 方法2          

-- 10.查詢所有種類不是'點心'但比種類是'點心'貴的食物名稱、種類和價格，並以價格做降冪排序
SELECT name,catalog,price     -- 我的
FROM food f
WHERE catalog not like '點心' 
AND price>(SELECT price 
           FROM food
           GROUP BY catalog
           HAVING catalog='點心')
ORDER BY price desc;


SELECT name,catalog,price    -- 家禎
FROM food f
WHERE catalog not like '點心' 
AND price>any(SELECT price 
           FROM food
           WHERE catalog='點心')
ORDER BY price desc;


SELECT f.name, f.catalog, f.price
FROM food AS f
WHERE f.price > (SELECT MAX(price)
				FROM food
				WHERE catalog LIKE '點心')
AND f.catalog NOT LIKE '點心'
ORDER BY f.price DESC;

-- 11.查詢每個產地(顯示產地名稱)的食物價格最高者的食物名稱和價格
SELECT f.name,f.price,p.name 
FROM food f join place p 
on f.placeid=p.id
WHERE price in
		  (SELECT MAX(price )
           FROM food
           GROUP BY placeid
           HAVING placeid=f.placeid);

