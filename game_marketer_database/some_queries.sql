-- 1 The information of games together: 
select *
from Game;


-- 2 Game name and game id with game type: 
select g.Game_name, gt.Game_type 
from Game g
inner JOIN Game_type gt
on g.Game_id= gt.Game_id;


-- 3  developer name and their company names:
select d.Dev_name, c.Company_name
from Developer d
right outer join Company_information c
on d.Dev_name=c.Dev_name
where c.Company_name is not null
order by d.Dev_name;


-- 4 Game name, price and Game's platform: 
select g.game_name, g.Price, p.Platform_name as "Platform"
from Game g, Platform p
where g.Game_id= p.Game_id;

-- 5 Developer name with their games name's versions and companies:
select g.Dev_name, g.Game_name, g.Version, c.Company_name
from Game g, Developer d, Company_information 
where g.Dev_name=d.Dev_name
and d.Dev_name=c.Dev_name;

-- 6  games which have website adress game name, price and their websites:
select g.Game_name ,g.Price, i.Website_address 
from Game g, Payment p, Internet i
where g.Game_id =p.payment_id
and p.payment_id=i.payment_id
and g.Game_id = i.payment_id
and i.selling_in_internet_flag is not false;

-- 7 games and their company name information:
select g.game_name, Company_name
from Game g, Developer d, Company_information c
where g.Game_id = d.Game_id
and d.Dev_name = c.Dev_name
and d.Is_company is true;

-- 8 new developer's names with their homeland
select d.Dev_name, gd.Homeland  
from Developer d
left OUTER join Game_dev_informations gd
on d.Dev_name=gd.Dev_name and gd.Is_new_dev_flag is true
order by d.Dev_name;

-- 9 Game name and Priece with store adress:
select g.Game_name, g.Version ,p.Last_priece as "priece", s.Store_address
from game g,Payment p
inner join Store s 
on s.Payment_id=p.Payment_id and p.Selling_in_store_flag is true and s.Selling_in_store_flag is true
where g.Payment_id = p.Payment_id
order by p.Last_priece;


-- 10 game name with versions and the company which is selling them right now:
select g.Game_name, g.Version, p.Company_name
from Game g
inner join Publisher p
on g.Game_id = p.Game_id;

-- little bit comfused ones:

select g.Dev_name, g.game_name, g.Price, p.Platform_name as "Platform"
from Game g
left outer join Platform p
on g.Game_id= p.Game_id
where g.price = any (select g.Price
                    from game g
                    where g.Price >10)
order by g.Price;


select gt.Game_type as "game types", Count(gt.Game_type) as "how many",max(g.price) as "expensive one", MIN(g.price) as "cheap one" 
from Game g
left outer join Game_type gt
on g.game_id=gt.game_id
group by  gt.Game_type
order by g.price;


select * 
from Game g
left outer join platform p
on p.Game_id=g.game_id
where g.game_id = any (select g.game_id
                    from game g
                    where g.game_id<5);

select g.Game_name as "game name", g.Version ,p.Last_priece as "priece", s.Store_address as "store adress"
from game g,Payment p
inner join Store s 
on s.Payment_id=p.Payment_id and p.Selling_in_store_flag is true and s.Selling_in_store_flag is true
where g.Payment_id = p.Payment_id and s.payment_id = g.Payment_id
order by p.Last_priece ;