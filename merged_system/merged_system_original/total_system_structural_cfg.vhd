configuration total_system_structural_cfg of total_system is
   for structural
      for all: game_struct use configuration work.game_struct_structural_cfg;
      end for;
      for all: video_system use configuration work.video_system_structural_cfg;
      end for;
   end for;
end total_system_structural_cfg;
