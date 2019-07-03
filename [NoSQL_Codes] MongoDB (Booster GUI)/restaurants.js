
db.restaurants.find()
db.restaurants.count()
db.restaurants.find({borough:'Manhattan'})
db.restaurants.find({borough:'Manhattan'}).count()
db.restaurants.find({'address.zipcode':'10075'})
db.restaurants.find({'address.zipcode':'10075'}).sort({restaurant_id:1})
db.restaurants.find({'address.zipcode':'10075'}).sort({cuisine:-1})

//우편번호가 없는 음식점을 조회
db.restaurants.find({'address.zipcode':''})

db.restaurants.find({'grades.grade':'B'})
db.restaurants.find({'grades.grade':'B'}).count()
db.restaurants.find({'grades.0.grade':'B'})
db.restaurants.find({'grades.0.grade':'B'}).count()
db.restaurants.find({'grades.3.grade':'B'}) //4번째 등급값이 'B'
db.restaurants.find({'grades.3.grade':'B'}).count()


db.restaurants.find({'grades.score':{$gt:30}}) //앞에 $ 쓰는 것에 유의!!!
db.restaurants.find({'grades.score':{$gt:30}}).count()
db.restaurants.find({'grades.score':{$lt:10}})
db.restaurants.find({'grades.score':{$lt:10}}).count()
db.restaurants.find({})

db.restaurants.find({'address.zipcode':'10075', cuisine:'Italian'})
db.restaurants.find({'address.zipcode':'10075', cuisine:'Italian'}).count()

db.restaurants.find({$or:[{'address.zipcode':'10075'}, {cuisine:'Italian'}]})
db.restaurants.find({$or:[{'address.zipcode':'10075'}, {cuisine:'Italian'}]}).count()

//db.resaurants.find({name:'Juni'})

//group by 의 noSQL 구현
db.restaurants.aggregate({$group:{'_id':'$borough','count':{$sum:1}}})
db.restaurants.aggregate({$group:{'_id':'$address.zipcode','count':{$sum:1}}})

db.restaurants.aggregate({$group:{'_id':'$address.zipcode','count':{$sum:1}}}).sort({'count':-1})
















