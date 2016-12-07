-- 1) Which team has the most of gyms? Tyler
select team_name, c from
	(select team_name, count(*) as c from trainers
	join teams on teams.team_name=trainers.team_name group by trainers.team_name) as s
	having c = (select max(x.xc) from
		(select t.team_name, count(t.album_id) as xc
		from trainers as t
		group by trainers.team_name) as x);

-- 2) Which pokemons were caught the most times? Erisa
select p.pokemon_name,image,cp,hp from pokemons p join (select pokemon_name , count(*) most from pokemons_trainers group by pokemon_name)x 
on x.pokemon_name=p.pokemon_name 
where x.most=(select max(most2)from (select count(*) most2 from pokemons_trainers group by pokemon_name)y)

-- 3) Range of price of items? Tyler
select item_name from items where price>=100 and price<=200;

-- 4) Which trainers have the most pokemons? Erisa
select t.trainer_name,t.team_name,x.most_pokemons from trainers t join (select * ,count(*) most_pokemons from pokemons_trainers 
group by trainer_name)x ont.trainer_name=x.trainer_name
where x.most_pokemons=( select max(train) from(select * ,count(*) train from pokemons_trainers group by trainer_name)y)

-- 5) Which pokemons haven't been caught? Martin
select *
from pokemons
where pokemon_name not in (
    select p.pokemon_name
    from pokemons p, pokemons_trainers pt
    where p.pokemon_name = pt.pokemon_name
);
-- 6) What are the average healing points among all healing items? Yisi

-- 7) Which members are leading the most gyms (including gym names)? Yisi

-- 8) Who owns the most valuable item among all kinds? Yisi

-- 9) In which cities can be combat items found? Martin
select ci.item_name, group_concat(distinct city_name,", ", loc separator "; ") cities
from stores_items si, combat_items ci
where ci.item_name = si.item_name
group by ci.item_name;
-- 10) Which trainer catch the most pokemons per day? Erisa
--
