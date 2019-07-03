-- 지역변수 vs. 전역변수

-- 프로그램 전체영역에서 사용가능하도록 선언한 변수 (어디서나 호출 가능) : 전역(global) 변수
-- declare블럭(선언부) 내에서 선언한 변수

-- 프로그램 특정영역에서 사용가능하도록 선언한 변수 (특정영역에서만 호출 가능) : 지역(local) 변수
-- begin~end블럭(실행부) 내에서 선언한 변수

-- 지역변수, 전역변수 사용 시 변수의 유효범위(scope)를 잘 파악할 것!

DECLARE
	num	number(5) := 12345; -- 전역변수
BEGIN
	dbms_output.put_line('num 변수 '||num);
	DECLARE num number(5) := 98765; -- 지역변수
	BEGIN
	dbms_output.put_line('num 변수 '||num);
	END;
	dbms_output.put_line('num 변수 '||num);
END;
-- 지역변수는 END; 만나면 소멸!!