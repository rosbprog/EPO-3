configuration ghost_struct_structural_cfg of ghost_struct is
   for structural
      for all: input_buffer use configuration work.input_buffer_structural_cfg;
      end for;
      for all: input_controller use configuration work.input_controller_behavioural_cfg;
      end for;
      for all: coordinate_adder use configuration work.coordinate_adder_behavioural_cfg;
      end for;
      for all: coordinate_multiplexer use configuration work.coordinate_multiplexer_behavioural_cfg;
      end for;
      for all: coordinate_register use configuration work.coordinate_register_behavioural_cfg;
      end for;
      for all: ghost_cont use configuration work.ghost_cont_behaviour_cfg;
      end for;
   end for;
end ghost_struct_structural_cfg;
