-- 1.以不列舉欄位的方式新增一筆食物資料
INSERT INTO food 
VALUES ('DO001', '甜甜圈', '2019/09/18', 'TW', 30, '點心');
-- 2.以列舉欄位的方式新增一筆食物資料
INSERT INTO food (id,name,expiredate,placeid,price,catalog)
VALUES ('BO001', '珍珠奶茶', '2019/12/12', 'TW', 60, '飲料');
-- 3.以不列舉欄位的方式新增多產地資料
INSERT INTO place 
VALUES ('AU', '澳洲'),('KR', '韓國');
-- 4.修改一筆食物資料的價格
UPDATE food
   set price=70
WHERE id='BO001';
-- 5.按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
SET SQL_SAFE_UPDATES = 0 ; -- safe mode 關掉;;...................................................................................................
UPDATE food
SET  price =
    case
        WHEN price <=250 THEN FLOOR(price*1.08)
        WHEN price BETWEEN 250 AND 500 THEN FLOOR(price*1.05)
        WHEN price >500 THEN FLOOR(price*1.03)
    END;
SET SQL_SAFE_UPDATES = 1 ; -- safe mode 開啟

-- 6.刪除一筆食物資料
DELETE FROM food WHERE id='BO001';