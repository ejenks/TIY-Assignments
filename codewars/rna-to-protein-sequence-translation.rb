def protein(rna)
 #your code here
 #you can copy and paste the codons from the description into a hash
 #or use the preloaded $codons hash
 codon_sequence = []
 until rna.size == 0 do
   codon_sequence << rna.slice!(0..2)
 end
   acid_sequence = codon_sequence.map do |codon|
     if codon == 'UAA' || codon == 'UGA' || codon == 'UAG'
       break
     else
       $codons[codon]
     end
   end
 acid_sequence = acid_sequence.join
end
