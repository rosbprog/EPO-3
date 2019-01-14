configuration speedcontroller_structural_cfg of speedcontroller is
   for structural
      for all: fsm_counter use configuration work.fsm_counter_behavioural_cfg;
      end for;
      for all: new_counter use configuration work.new_counter_behaviour_cfg;
      end for;
   end for;
end speedcontroller_structural_cfg;
