configuration deathcontroller_structural_cfg of deathcontroller is
   for structural
      for all: coordinate_comparator use configuration work.coordinate_comparator_behavioural_cfg;
      end for;
   end for;
end deathcontroller_structural_cfg;
