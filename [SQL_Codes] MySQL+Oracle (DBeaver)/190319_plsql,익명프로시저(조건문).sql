-- 조건문
-- 문장의 논리적 흐름을 변경할 때 사용
-- 조건 따라 처리순서 달리 하고 싶을 때
-- IF [조건] THEN [...] end if;
-- IF [조건] THEN [...] else [...] end if;
-- IF [조건1] THEN [...] ELSIF [조건2] THEN [...] ELSE [...] END IF;

-- 조건문1 : 주문번호를 이용한 남자 구분 
DECLARE
	jumin char(14) := '123456-1234567';
	gender char(1) := '-';
BEGIN
	gender := substr(jumin,8,1);
	IF	gender = '1' THEN 
		dbms_output.put_line('당신은 남자이군요');
	ELSE -- gender가 1이 아니라면
		dbms_output.put_line('당신은 여자이군요');
	END IF;
END;
	

-- 조건문2 : 국/영/수 성적에 대한 학점 계산 (총점, 평균)
DECLARE
	kor		number(3) := 100;
	eng		number(3) := 90;
	mat		number(3) := 80;
	tot		number(3) := 0;
	mean	number(4,1) := 0.0; -- 소수점이하포함 총4자리 중 1자리가 소수점 이하
	grd 	char(3) := '가';
BEGIN
	tot := kor + eng + mat;
	mean := tot/3;
	dbms_output.put_line('국/영/수');
	dbms_output.put_line(kor||'/'||eng||'/'||mat||'/');
	dbms_output.put_line('총/평/급');
	dbms_output.put_line(tot||'/'||mean||'/'||grd);
END;


-- 조건문3 : 국/영/수 성적에 대한 학점 계산 (총점, 평균, 급)
DECLARE
	kor		number(3) := 100;
	eng		number(3) := 90;
	mat		number(3) := 80;
	tot		number(3) := 0;
	mean	number(4,1) := 0.0; -- 소수점이하포함 총4자리 중 1자리가 소수점 이하
	grd 	char(3) := '가';
BEGIN
	tot := kor + eng + mat;
	mean := tot/3;

	IF mean >= 90 THEN grd := '수';
		ELSIF mean >= 80 THEN grd := '우';
		ELSIF mean >= 70 THEN grd := '미';
		ELSIF mean >= 60 THEN grd := '양';
	END IF;

	dbms_output.put_line('국/영/수');
	dbms_output.put_line(kor||'/'||eng||'/'||mat||'/');
	dbms_output.put_line('총/평/급');
	dbms_output.put_line(tot||'/'||mean||'/'||grd);
END;







-- 조건문4 case when
DECLARE
	kor		number(3) := 100;
	eng		number(3) := 90;
	mat		number(3) := 80;
	tot		number(3) := 0;
	mean	number(4,1) := 0.0; -- 소수점이하포함 총4자리 중 1자리가 소수점 이하
	grd 	char(3) := '가';
BEGIN
	tot := kor + eng + mat;
	mean := tot/3;

	CASE WHEN mean BETWEEN 90 AND 100 THEN grd := '수';
		WHEN mean BETWEEN 80 AND 90 THEN grd := '우';
		WHEN mean BETWEEN 70 AND 80 THEN grd := '미';
		WHEN mean BETWEEN 60 AND 70 THEN grd := '양';
	END CASE;

	dbms_output.put_line('국/영/수');
	dbms_output.put_line(kor||'/'||eng||'/'||mat||'/');
	dbms_output.put_line('총/평/급');
	dbms_output.put_line(tot||'/'||mean||'/'||grd);
END;


-- 조건문4 case when2

DECLARE
	kor		number(3) := 100;
	eng		number(3) := 90;
	mat		number(3) := 80;
	tot		number(3) := 0;
	mean	number(4,1) := 0.0; -- 소수점이하포함 총4자리 중 1자리가 소수점 이하
	grd 	char(3) := '가';
BEGIN
	tot := kor + eng + mat;
	mean := tot/3;

	CASE WHEN mean >= 90 THEN grd := '수';
		WHEN mean >= 80 THEN grd := '우';
		WHEN mean >= 70 THEN grd := '미';
		WHEN mean >= 60 THEN grd := '양';
	END CASE;

	dbms_output.put_line('국/영/수');
	dbms_output.put_line(kor||'/'||eng||'/'||mat||'/');
	dbms_output.put_line('총/평/급');
	dbms_output.put_line(tot||'/'||mean||'/'||grd);
END;



-- 조건문5 sungjuk 테이블에 저장하기

CREATE TABLE sungjuk (
	sjno 	NUMBER(5),
	name	VARCHAR2(10),
	kor		NUMBER(3),
	eng		NUMBER(3),
	mat		NUMBER(3),
	tot		NUMBER(3),
	mean	NUMBER(4,1),
	grd 	CHAR(3),
	regdate	DATE	DEFAULT	SYSDATE
);

DECLARE
	name	VARCHAR2(10) := '수지';
	kor		number(3) := 100;
	eng		number(3) := 90;
	mat		number(3) := 80;
	tot		number(3) := 0;
	mean	number(4,1) := 0.0; -- 소수점이하포함 총4자리 중 1자리가 소수점 이하
	grd 	char(3) := '가';
BEGIN
	tot := kor + eng + mat;
	mean := tot/3;

	IF mean >= 90 THEN grd := '수';
		ELSIF mean >= 80 THEN grd := '우';
		ELSIF mean >= 70 THEN grd := '미';
		ELSIF mean >= 60 THEN grd := '양';
	END IF;

	dbms_output.put_line('국/영/수');
	dbms_output.put_line(kor||'/'||eng||'/'||mat||'/');
	dbms_output.put_line('총/평/급');
	dbms_output.put_line(tot||'/'||mean||'/'||grd);
	
	INSERT INTO sungjuk
	(sjno, name, kor, eng, mat, tot, mean, grd)
	VALUES (1, name, kor, eng, mat, tot, mean, grd);
 	
END;

SELECT * FROM sungjuk;













	