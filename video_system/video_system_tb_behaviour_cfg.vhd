configuration video_system_tb_behaviour_cfg of video_system_tb is
   for behaviour
      for all: video_system use configuration work.video_system_structural_cfg;
      end for;
   end for;
end video_system_tb_behaviour_cfg;
