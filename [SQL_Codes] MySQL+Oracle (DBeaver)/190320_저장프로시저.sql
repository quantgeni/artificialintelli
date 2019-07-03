-- 저장 프로시저
-- PL/SQL 블럭 외부에 선언해서 데이터베이스에 저장
-- PL/SQL 블럭을 별도에 작성하므로 프로그램이 단순/모듈화
-- 서버 부하도 줄이고 네트워크 트래픽도 감소 - 효율성 증대
-- PL/SQL, 트리거, 각종 응용프로그램 등에서 호출 가능
-- 재사용성.. 작성한 SQL 질의문을 블럭으로 감출 수 있음 - 보안성 ㅇㅇ
-- 프로그램 관리 용이 // 유지보수성
-- CREATE OR REPLACE PROCEDURE 이름 (IN/OUT/INOUT 매개변수)
-- IS
-- BEGIN
-- END;

-- 매개변수 : 입력/출력/겸용 전용 매개변수를 정의
-- OUT 매개변수는 프로시저 코드 실행 후 결과를 매개변수에 저장해서 프로시저 외부에서 참조할 수 있게 함

CREATE OR REPLACE PROCEDURE sayHell2b(msg IN varchar2)
IS
BEGIN
	dbms_output.put_line('Hello, World!!' ||msg);
END;

CREATE OR REPLACE PROCEDURE sayHell2b2(msg varchar2)
IS
BEGIN
	dbms_output.put_line('Hello, World!!' ||msg);
END;


BEGIN
	sayHell2b2('hoho1');
END;







-- 저장 프로시저 실행 방법
SELECT sayHello2 FROM dual; <- 이거 X (함수는 되지만)

EXECUTE sayHello();


BEGIN
	sayHello2();
END;














-- 프로시저 내에 insert into 구문 넣기 가능 (함수는 안되었음)

CREATE OR REPLACE PROCEDURE
		newSungJuK2(name SUNGJUK.NAME%TYPE, 
				kor SUNGJUK.KOR%TYPE, 
				eng SUNGJUK.ENG%TYPE, 
				mat SUNGJUK.MAT%TYPE) -- 카멜 표기법

IS 
	tot		SUNGJUK.TOT%TYPE;
	mean	SUNGJUK.MEAN%TYPE;
	grd		SUNGJUK.GRD%TYPE;
	results varchar2(100);
BEGIN 
	tot:=kor+eng+mat;
	mean:=tot/3;


	CASE WHEN mean>=90 THEN grd:='수';
	   	WHEN mean>=80 THEN grd:='우';
	   	WHEN mean>=70 THEN grd:='미';
	   	WHEN mean>=60 THEN grd:='양';
	   	ELSE grd:='가';
	END CASE;
	INSERT INTO SUNGJUK
	(sjno,name,kor,eng,mat,tot,mean,grd)
	VALUES
	(1,name,kor,eng,mat,tot,mean,grd);

	results:=name||'/'||kor||'/'||eng||'/'||mat||'/'||tot||'/'||mean||'/'||grd;

	dbms_output.put_line(results); -- return 아님에 유의!!

END;

BEGIN
	newSungJuK2('길동',55,75,87);
END;

SELECT * FROM SUNGJUK;
