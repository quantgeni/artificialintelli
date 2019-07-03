from pymongo import MongoClient

#mongodb 연결객체 생성
client=MongoClient('mongodb://192.168.74.130:27017')

#접속해제
client.close()