def DNAtoRNA(dna)
  if dna.include?("T")
    dna.gsub!("T", "U")
  else
    return dna
  end
end
