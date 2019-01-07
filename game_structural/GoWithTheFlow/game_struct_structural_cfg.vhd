configuration game_struct_structural_cfg of game_struct is
   for structural
      for all: cell_register use configuration work.cell_register_behavioural_cfg;
      end for;
      for all: coin_register use configuration work.coin_register_behaviour_cfg;
      end for;
      for all: coordinate_multiplexer use configuration work.coordinate_multiplexer_behavioural_cfg;
      end for;
      for all: deathcontroller use configuration work.deathcontroller_structural_cfg;
      end for;
      for all: ghost_struct use configuration work.ghost_struct_structural_cfg;
      end for;
      for all: pacman_system use configuration work.pacman_system_structural_cfg;
      end for;
      for all: map_register use configuration work.map_register_behaviour_cfg;
      end for;
      for all: reset_controller use configuration work.reset_controller_behavioural_cfg;
      end for;
      for all: speedcontroller use configuration work.speedcontroller_structural_cfg;
      end for;
      for all: pulse_generator use configuration work.pulse_generator_behavioural_cfg;
      end for;
   end for;
end game_struct_structural_cfg;
