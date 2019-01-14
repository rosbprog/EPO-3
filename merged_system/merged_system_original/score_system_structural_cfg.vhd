configuration score_system_structural_cfg of score_system is
   for structural
      for all: score_sprite use configuration work.score_sprite_behavioural_cfg;
      end for;
      for all: score_count use configuration work.score_count_behaviour_cfg;
      end for;
      for all: score_control use configuration work.score_control_behaviour_cfg;
      end for;
   end for;
end score_system_structural_cfg;
