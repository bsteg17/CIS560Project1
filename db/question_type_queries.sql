-- 1) Which team has the most of gyms? Tyler
select team_name, c from
	(select team_name, count(*) as c from trainers
	join teams on teams.team_name=trainers.team_name group by trainers.team_name) as s
	having c = (select max(x.xc) from
		(select t.team_name, count(t.album_id) as xc
		from trainers as t
		group by trainers.team_name) as x);

-- 2) Which pokemons were caught the most times? Erisa

-- 3) Range of price of items? Tyler
select item_name from items where price>=100 and price<=200;

-- 4) Which trainers have the most pokemons? Erisa

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
