db.createCollection('newOne')
db.newOne.insertOne({ x:1 })
db.newOne.insertOne({ x:2 })
db.newOne.insertOne({ x:3})
db.newOne.insertOne({ x:4 })
db.newOne.insertOne({ x:5 })
db.newOne.insertOne({ x:6 })
db.newOne.find().skip(3).limit(2)


db.newOne.remove({})
db.newOne.find()
db.newOne.find({z:10})
db.newOne.count()

show dbs
show collections






