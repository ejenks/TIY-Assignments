def pitch_class (note)
  value = note.capitalize
  notes = {
          'C' => 0, 'C#' => 1, 'Cb' => 11,
          'D' => 2, 'D#' => 3, 'Db' => 1,
          'E' => 4, 'E#' => 5, 'Eb' => 3,
          'F' => 5, 'F#' => 6, 'Fb' => 4,
          'G' => 7, 'G#' => 8, 'Gb' => 6,
          'A' => 9, 'A#' => 10,'Ab' => 8,
          'B' => 11,'B#' => 0, 'Bb' => 10,
          }
   notes[value]
end
