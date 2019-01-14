configuration total_system_tb_behaviour_cfg of total_system_tb is
   for behaviour
      for all: total_system use configuration work.total_system_structural_cfg;
      end for;
   end for;
end total_system_tb_behaviour_cfg;
