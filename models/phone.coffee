# require './fixture'

# Phone = db.model 'Phone', mongoose.Schema {
# 	tel_number: { type: Number, index: { unique: true }, required: true },
# 	machine_identifier: { type: String, index: { unique: true }, required: true },
# 	updated_date: { type: Date, default: Date.now },
# }
# iphone = new Phone { tel_number: 123456789, machine_identifier: 'DAFD#@#FJK' }
# iphone.save (err) ->
# 	if err
# 		res.end 'meow'

