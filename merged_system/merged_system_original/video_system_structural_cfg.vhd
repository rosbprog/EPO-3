configuration video_system_structural_cfg of video_system is
   for structural
      for all: video_control use configuration work.video_control_behaviour_cfg;
      end for;
      for all: sprites use configuration work.sprites_behaviour_cfg;
      end for;
      for all: shift_system use configuration work.shift_system_structural_cfg;
      end for;
      for all: vga_controll use configuration work.vga_controll_vga_behavioral_cfg;
      end for;
      for all: video_counter use configuration work.video_counter_behaviour_cfg;
      end for;
      for all: score_system use configuration work.score_system_structural_cfg;
      end for;
      for all: screen_controller use configuration work.screen_controller_behavioural_cfg;
      end for;
      for all: gameover_control use configuration work.gameover_control_behaviour_cfg;
      end for;
      for all: character_sprite use configuration work.character_sprite_behavioural_cfg;
      end for;
   end for;
end video_system_structural_cfg;
