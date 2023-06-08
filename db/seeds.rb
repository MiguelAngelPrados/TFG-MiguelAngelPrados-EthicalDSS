# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Diagnosis.destroy_all

MimicRecord.table_name = "d_icd_diagnoses"

MimicRecord.pluck(:LONG_TITLE).each do |diagnosis|
   Diagnosis.create(description: diagnosis)
end



#d = Diagnosis.new

#result = MimicRecord.connection.exec_query('SELECT ROW_ID, SHORT_TITLE FROM d_icd_diagnoses WHERE ROW_ID=174')

#result.rows.to_h

#d.description = result.rows.to_s

#result.rows.to_h.each do |row|
   #d.description = row['174']
#end

#d.description = result.rows.to_h["174"]
 
#d.save