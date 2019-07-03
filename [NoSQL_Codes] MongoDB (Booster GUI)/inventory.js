db.createCollection('inventory')

db.inventory.insertMany([
{ item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A", tags: ["blank", "red"], dim_cm: [ 14, 21 ]},
{ item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A", tags: ["red", "blank"], dim_cm: [ 14, 21 ] },
{ item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D", tags: ["red", "blank", "plain"], dim_cm: [ 14, 21 ] },
{ item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D", tags: ["blank", "red"], dim_cm: [ 22.85, 30 ] },
{ item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A", tags: ["blue"], dim_cm: [ 10, 15.25 ] },
{ item: "canvas", qty: 100, size: { h: 28, w: 35.5, uom: "cm" }, status: "A" },
{ item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
{ item: "mat", qty: 85, size: { h: 27.9, w: 35.5, uom: "cm" }, status: "A" },
{ item: "mousepad", qty: 25, size: { h: 19, w: 22.85, uom: "cm" }, status: "P" },
{ item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "P" },
{ item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
{ item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
{ item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" },
{ item: "sketchbook", qty: 80, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
 { item: "sketch pad", qty: 95, size: { h: 22.85, w: 30.5, uom: "cm" }, status: "A" }
])



/**/
db.inventory.remove({})
db.inventory.deleteMany({}) /*위,아래 2개 같음. 컬렉션 내 모든 데이터 삭제*/

db.inventory.find()
db.inventory.find({status:'A'})
db.inventory.find({qty:100})
db.inventory.find({status:{$in:['A','D']}})
db.inventory.find({item:{$in:['journal','notebook']}})
db.inventory.find({status:'A', qty:45})

db.inventory.find({qty:{$lte:45}})
db.inventory.find({qty:{$lt:45}})
db.inventory.find({qty:{$lte:35,$gte:10}})
db.inventory.find({$or:[{satus:'A'},{qty:{$lt:30}}]})
db.inventory.find({status:'A', $or:[{qty:{$lt:30}},{item:/^p/}]})
db.inventory.find().sort({status:1})
db.inventory.find().sort({status:-1})
db.inventory.find().sort({qty:1}) /*qty 오름차순*/
db.inventory.find().sort({status:-1}) /*qty 내림차순*/
db.inventory.find().sort({qty:-1},{status:1})
db.inventory.find().skip(5) /*6번째 문서부터 출력*/
db.inventory.find().limit(5) /*첫 5개만 출력*/
db.inventory.find().skip(3).limit(2) /*4번째에서 5번째까지만 출력*/

db.inventory.find().skip(3).limit(2) /*4번째에서 5번째까지만 출력*/
db.inventory.find({item:/^p/})
db.inventory.deleteOne({item:/^p/})
db.inventory.deleteMany({item:/^p/})
db.inventory.find()

db.inventory.drop()
show collections

/*데이터베이스 제거*/
use "bigdata"
db.dropDatabase()


show dbs





