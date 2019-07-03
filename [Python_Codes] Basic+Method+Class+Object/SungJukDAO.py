from SungJukVO import SungJukVO

class SungJukDAO:
    __insertsql=' insert into SungJuk '\
    ' (name,kor,eng,mat,tot,mean,grade) '\
    ' values (%s,%s,%s,%s,%s,%s,%s) '
    __selectsql=' select sjno,name,kor,eng,mat, '\
    ' regdate from SungJuk order by sjno desc '
    __selectonesql=' select * from SungJuk where sjno=(%s) '
    
    def makeConn(self):
        connstr=['52.79.135.218','bigdata','bigdata0220','utf8']
        conn=pymysql.connect(host=connstr[0],user=connstr[1],password=connstr[2],db=connstr[1],charset=connstr[3])
        return conn
    
    def closeConn(self,conn):
        conn.commit()
        conn.close
        
    def insertSungJuk(self,sj):
        param=(sj.name,sj.kor,sj.eng,sj.mat,sj.tot,sj.mean,sj.grade)
        conn=self.makeConn()
        cursor=conn.cursor()
        cursor.execute(self.__insertsql,param)
        self.closeConn(conn)
    
    def selectSungJuk(self):
        conn=self.makeConn()
        
        cursor=conn.cursor()
        cursor.execute(self.__selectsql)
        
        #for rs in cursor.fetchall():
         #   print(rs)
        #클래스/함수에 너무 많은 기능/책임 부여하지 않음 (심지어 출력 결과도 이상함)
    
        #질의 결과 모든 행 출력 방법. 결과들 뽑아서 리스트 저장 후 출력
        rows=cursor.fetchall()
        sjs=[]
        for rs in rows:
            sj=SungJukVO(rs[1],rs[2],rs[3],rs[4]) #sj인스턴스를 만들어서
            sj.setEtc(rs[0],0,0,0,rs[5]) #쿼리 조회 목적 상 tot,mean,grade 안 쓸거니까 ㅋㅋ
            sjs.append(sj) #sjs리스트에 클래스(멤버변수)를 통째로 넣기?!!
        
        self.closeConn(conn)
        return sjs #루프 돌린 리스트(최종)를 리턴
    
    def selectOneSungJuk(self,sjno):
        param=(sjno)
        conn=self.makeConn()
        cursor=conn.cursor()
        cursor.execute(self.__selectonesql,param)
        
        #for rs in cursor.fetchall():
         #   print(rs)

        
        rows=cursor.fetchall()
        sjs2=[]
        for rs in rows:
            sj2=SungJukVO(rs[1],rs[2],rs[3],rs[4]) #sj인스턴스를 만들어서
            sj2.setEtc(rs[7],rs[4],rs[5],rs[6],rs[8])
            sjs2.append(sj2) #sjs리스트에 클래스(멤버변수)를 통째로 넣기?!!
        self.closeConn(conn)
        return sjs2 #루프 돌린 리스트(최종)를 리턴             
        
    def updateSungJuk(self):
        conn=self.makeConn()
        self.closeConn(conn)
        
    def deleteSungJuk(self):
        conn=self.makeConn()
        self.closeConn(conn)