configuration pacman_system_structural_cfg of pacman_system is
   for structural
      for all: pacman_cont use configuration work.pacman_cont_behaviour_cfg;
      end for;
      for all: coordinate_multiplexer use configuration work.coordinate_multiplexer_behavioural_cfg;
      end for;
      for all: coordinate_adder use configuration work.coordinate_adder_behavioural_cfg;
      end for;
      for all: coordinate_register use configuration work.coordinate_register_behavioural_cfg;
      end for;
      for all: input_system use configuration work.input_system_structural_cfg;
      end for;
   end for;
end pacman_system_structural_cfg;
