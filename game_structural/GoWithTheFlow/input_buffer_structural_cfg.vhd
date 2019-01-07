configuration input_buffer_structural_cfg of input_buffer is
   for structural
      for all: d_flip_flop use configuration work.d_flip_flop_behavioural_cfg;
      end for;
   end for;
end input_buffer_structural_cfg;
