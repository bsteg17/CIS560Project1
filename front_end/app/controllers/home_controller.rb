class HomeController < ApplicationController
  layout "application"

  def index
    # professor's instructions were to access all data with raw SQL, which is why these controllers are such eyesores
    @most_gyms = ActiveRecord::Base.connection.execute("select team_name, members from (select trainers.team_name, count(*) as members from trainers join teams on teams.team_name=trainers.team_name group by trainers.team_name) as s having members = (select max(x.xc) from (select t.team_name, count(t.team_name) as xc from trainers as t group by t.team_name) as x);").to_a
    @caught_most = ActiveRecord::Base.connection.execute("select p.pokemon_name,most,image,cp,hp from pokemons p join (select pokemon_name , count(*) most from pokemons_trainers group by pokemon_name)x on x.pokemon_name=p.pokemon_name where x.most=(select max(most2)from (select count(*) most2 from pokemons_trainers group by pokemon_name)y)").to_a
    @price_range = ActiveRecord::Base.connection.execute("select item_name from items where price>=100 and price<=200;").to_a
    @uncaught = ActiveRecord::Base.connection.execute("select * from pokemons where pokemon_name not in ( select p.pokemon_name from pokemons p, pokemons_trainers pt where p.pokemon_name = pt.pokemon_name);").to_a
    @avg_heal = ActiveRecord::Base.connection.execute("select avg(amount_healed) avg_healed from healing_items").to_a
    @avg_combat = ActiveRecord::Base.connection.execute("select avg(cp) avg_cp from combat_items").to_a
    @avg_cr = ActiveRecord::Base.connection.execute("select avg(catch_rate) avg_catch from pokeballs").to_a
    @avg_hp = ActiveRecord::Base.connection.execute("select avg(hp) avg_hp from pokemons").to_a
    @avg_cp = ActiveRecord::Base.connection.execute("select avg(cp) avg_cp from pokemons").to_a
    @leads_most = ActiveRecord::Base.connection.execute("select leader_name, count(badge)num_gyms, GROUP_CONCAT(badge) from gyms group by leader_name order by num_gyms desc").to_a
    @most_pow = ActiveRecord::Base.connection.execute("select x.pokemon_name, t.trainer_name from trainers t join pokemons_trainers pt on pt.trainer_name = t.trainer_name join (select p.* from pokemons p join (select max(hp) as max_hp from pokemons)m on p.hp = m.max_hp)x on x.pokemon_name = pt.pokemon_name").to_a
    @cities = ActiveRecord::Base.connection.execute('select ci.item_name, group_concat(distinct city_name,", ", loc separator "; ") cities from stores_items si, combat_items ci where ci.item_name = si.item_name group by ci.item_name;').to_a
  end
end
