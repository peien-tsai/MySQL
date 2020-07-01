SELECT * from food;
SELECT * from place;
-- 1.查詢所有食物名稱、產地編號、產地名稱和價格
SELECT f.name,f.placeid,p.name,f.price
FROM food f JOIN place p
ON f.placeid = p.id;
-- 2.查詢所有食物名稱和產地名稱，並串接成一個字串，中間以空白隔開，並將表頭重新命為'Food name & place'
SELECT f.name,p.name,concat(f.name,' ',p.name) 'Food name & place'
FROM food f JOIN place p
ON f.placeid = p.id;
-- 3.查詢所有'台灣'生產的食物名稱和價格
SELECT f.name,f.price,p.name
FROM food f JOIN place p
ON f.placeid = p.id
WHERE p.name like '台灣';
-- 4.查詢所有'台灣'和'日本'生產的食物名稱和價格，並以價格做降冪排序
SELECT f.name,f.price, p.name
FROM food f JOIN place p
ON f.placeid = p.id
WHERE p.name like '台灣' OR p.name like'日本'
ORDER BY f.price DESC;

-- WHERE f.placeid = p.id AND p.name IN ('台灣', '日本');   用in

-- 5.查詢前三個價格最高且'台灣'生產的食物名稱、到期日和價格，並以價格做降冪排序
SELECT f.name,f.expiredate,f.price
FROM food f JOIN place p
ON f.placeid = p.id
WHERE p.name like '台灣' 
ORDER BY f.price DESC
LIMIT 3;
-- 6.查詢每個產地(顯示產地名稱)最高、最低、加總和平均價格，表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
SELECT ROUND(MAX(f.price)) 'Max', ROUND(MIN(f.price)) 'Min',ROUND(SUM(f.price)) 'Sum',ROUND(AVG(f.price)) 'Avg',p.name
FROM food f JOIN place p
ON f.placeid = p.id
GROUP BY p.name;
-- 7.查詢不同產地(顯示產地名稱)和每個種類的食物數量
SELECT p.name,f.catalog,count(f.name)
FROM food f JOIN place p
ON f.placeid = p.id
GROUP BY p.name,catalog;