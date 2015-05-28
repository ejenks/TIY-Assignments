require 'active_record'
require 'csv'
require 'csv_hasher'

students = CSVHasher.hashify('./iron_roster.csv')

puts students




