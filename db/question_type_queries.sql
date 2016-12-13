-- 1) Which team has the most of gyms? Tyler
select team_name, members from
	(select trainers.team_name, count(*) as members from trainers
	join teams on teams.team_name=trainers.team_name group by trainers.team_name) as s
	having members = (select max(x.xc) from
		(select t.team_name, count(t.team_name) as xc
		from trainers as t
		group by t.team_name) as x);

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
select avg(amount_healed) avg_healed from healing_items
-- average combat points among all combat items
select avg(cp) avg_cp from combat_items
-- average catch rate among all pokeballs
select avg(catch_rate) avg_catch from pokeballs
-- average healing points among all pokemons
select avg(hp) avg_hp from pokemons
-- average combat points among all pokemons
select avg(cp) avg_cp from pokemons

-- 7) Which members are leading the most gyms (including gym names)? Yisi
select leader_name, count(badge)num_gyms, GROUP_CONCAT(badge) from gyms
group by leader_name
order by num_gyms desc

-- 8) Who owns the most valuable item among all kinds? Yisi
-- who owns the most valuable pokemon(with highest hp)???

select x.pokemon_name, t.trainer_name from trainers t
join pokemons_trainers pt
on pt.trainer_name = t.trainer_name
join
(select p.* from pokemons p join
(select max(hp) as max_hp from pokemons)m
on p.hp = m.max_hp)x
on x.pokemon_name = pt.pokemon_name

-- 9) In which cities can be combat items found? Martin
select ci.item_name, group_concat(distinct city_name,", ", loc separator "; ") cities
from stores_items si, combat_items ci
where ci.item_name = si.item_name
group by ci.item_name;
-- 10) Which trainer catch the most pokemons per day? Erisa
