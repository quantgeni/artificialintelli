class SungJukVO:
    def __init__(self,name,kor,eng,mat):
        self.name=name 
        self.kor=kor 
        self.eng=eng 
        self.mat=mat
        self.tot=0
        self.mean=0.0
        self.grade='가'
        self.sjno=0
        self.regdate=''
           
    def __str__(self):
        msg='%s,%s,%s,%s,%s,%s,%s,%s,%s' %(self.sjno,self.name, self.kor, self.eng, self.mat,self.tot,self.mean,self.grade,self.regdate)
        return msg
    
    def setEtc(self,sjno,tot,mean,grade,regdate):
        self.sjno=sjno
        self.tot=tot
        self.mean=mean
        self.grade=grade
        self.regdate=regdate
        
    def printList(self):
        msg='%s,%s,%s,%s,%s,%s' %(self.sjno,self.name,self.kor,self.eng,self.mat,str(self.regdate)[0:10]) #regdate 슬라이스 치는거 ㅇㅇ
                                                                                                      # (뒤에 시간 안 보려고)
                                                                                                      # (뒤에 시간 안 보려고)        
        return msg

