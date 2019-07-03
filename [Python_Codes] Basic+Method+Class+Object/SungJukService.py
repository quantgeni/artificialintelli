from SungJukVO import SungJukVO

class SungJukService:
    def readSungJuk(self):
        name=input('이름은? ')
        kor=int(input('국어는? : '))
        eng=int(input('영어는? : '))
        mat=int(input('수학은? : '))
        return SungJukVO(name,kor,eng,mat)

    def computeSungJuk(self,sj):
        sj.tot=sj.kor+sj.eng+sj.mat
        sj.mean=sj.tot/5
        if sj.mean>=90:sj.grade='A'
        elif sj.mean>=90:sj.grade='B'
        elif sj.mean>=90:sj.grade='C'           
        elif sj.mean>=90:sj.grade='D'
        else:sj.grade='F'
        return sj.tot,sj.mean,sj.grade