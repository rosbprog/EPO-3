configuration speedcontroller_structural_cfg of speedcontroller is
   for structural
      for all: fsm_counter use configuration work.fsm_counter_behavioural_cfg;
      end for;
      for all: counter use configuration work.counter_behavioural_cfg;
      end for;
      for all: multiplexer use configuration work.multiplexer_behaviour_cfg;
      end for;
      for all: plus_one use configuration work.plus_one_behaviour_cfg;
      end for;
   end for;
end speedcontroller_structural_cfg;
