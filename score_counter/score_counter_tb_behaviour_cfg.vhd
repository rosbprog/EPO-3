configuration score_counter_tb_behaviour_cfg of score_counter_tb is
   for behaviour
      for all: score_counter use configuration work.score_counter_behaviour_cfg;
      end for;
   end for;
end score_counter_tb_behaviour_cfg;
