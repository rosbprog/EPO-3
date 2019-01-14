configuration shift_system_structural_cfg of shift_system is
   for structural
      for all: shift_control use configuration work.shift_control_behaviour_cfg;
      end for;
      for all: shift_counter use configuration work.shift_counter_behaviour_cfg;
      end for;
      for all: pacman_position_reg use configuration work.pacman_position_reg_behavioural_cfg;
      end for;
      for all: shift_count_gr use configuration work.shift_count_gr_behaviour_cfg;
      end for;
      for all: gr_pos_reg use configuration work.gr_pos_reg_behaviour_cfg;
      end for;
      for all: shift_ctrl_gr use configuration work.shift_ctrl_gr_behaviour_cfg;
      end for;
      for all: shift_count_gg use configuration work.shift_count_gg_behaviour_cfg;
      end for;
      for all: gg_pos_reg use configuration work.gg_pos_reg_behaviour_cfg;
      end for;
      for all: shift_ctrl_gg use configuration work.shift_ctrl_gg_behaviour_cfg;
      end for;
   end for;
end shift_system_structural_cfg;
