db.zipcode.find({})
   .projection({})
   .sort({_id:-1})
   .limit(100)
   
use "bigdata"

db.zipcode.find()
db.zipcode.find().count()
db.zipcode.find({state:'MA'})
db.zipcode.find({state:'NY',city:'NEW YORK'})
db.zipcode.find({pop:{$gte:100000}})

db.zipcode.find().count()
db.zipcode.aggregate({$group:{'_id':'총인구','count':{$sum:'$pop'}}}) //이건 구체적으로 인원 칼럼 합
db.zipcode.aggregate({$group:{'_id':'','count':{$sum:'$pop'}}}) //이건 구체적으로 인원 칼럼 합
db.zipcode.aggregate({$group:{'_id':'총인구','count':{$sum:1}}}) //이건 단순 전체 카운트
db.zipcode.aggregate({$group:{'_id':'','count':{$sum:1}}}) //이건 단순 전체 카운트

db.zipcode.aggregate({$group:{'_id':'$state','count':{$sum:1}}})

db.zipcode.aggregate({$group:{'_id':'$state','count':{$sum:'$pop'}}},{$sort:{_id:1}})
db.zipcode.aggregate({$group:{'_id':'$state','주별 인구수':{$sum:'$pop'}}},{$sort:{'주별 인구수':1}})
db.zipcode.aggregate({$group:{'_id':'$state','count':{$sum:'$pop'}}}).sort({_id:1})

db.zipcode.aggregate({$group:{'_id':'$city','count':{$sum:1}}})
db.zipcode.aggregate({$group:{_id:'$city',도시별인구수:{$sum:'$pop'}}})
db.zipcode.aggregate({$group:{_id:'$city',도시별인구수:{$sum:1}}})

db.zipcode.find({pop:{$gte:50000}})
db.zipcode.aggregate({$match:{pop:{$gte:50000}}})

db.zipcode.aggregate({$group:{'_id':'$state','주별인구수':{$sum:'$pop'}}},{$match:{'주별인구수':{$gte:10000000}}})

db.zipcode.aggregate({$group:{'_id':'$state','주별인구수':{$sum:'$pop'}}},{$match:{'_id':'NY'}})
db.zipcode.aggregate({$match:{'_id':'NY'}},{$group:{'_id':'$state','주별인구수':{$sum:'$pop'}}})
db.zipcode.aggregate({$match:{'_id':'$state'}},{$group:{'_id':'$state','주별인구수':{$sum:'$pop'}}})


//db.restaurants.aggregate({$group:{'_id':'$borough','count':{$sum:1}}})
//db.restaurants.aggregate({$group:{'_id':'$address.zipcode','count':{$sum:1}}})
//db.restaurants.aggregate({$group:{'_id':'$address.zipcode','count':{$sum:1}}}).sort({'count':-1})


