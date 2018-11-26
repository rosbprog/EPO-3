configuration video_system_structural_cfg of video_system is
   for structural
      for all: video_control use configuration work.video_control_behaviour_cfg;
      end for;
      for all: sprite use configuration work.sprite_behaviour_cfg;
      end for;
      for all: vga_controll use configuration work.vga_controll_vga_behavioral_cfg;
      end for;
   end for;
end video_system_structural_cfg;
