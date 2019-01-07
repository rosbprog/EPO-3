configuration input_system_structural_cfg of input_system is
   for structural
      for all: input_buffer use configuration work.input_buffer_structural_cfg;
      end for;
      for all: input_controller use configuration work.input_controller_behavioural_cfg;
      end for;
   end for;
end input_system_structural_cfg;
