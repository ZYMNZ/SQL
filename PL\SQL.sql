--ADDING VALUES
SELECT TABLE_NAME FROM USER_TABLES;

BEGIN
        INSERT INTO Staff VALUES ('SE12', 'JOHN', 'SMITH', NULL, 'M', NULL, 12300, 'B002');
        DBMS_OUTPUT.PUT_LINE('NEW STAFF ADDED');
        
END;

--A ARITHMETIC EXPRESSION + EXCEPTION EX.
DECLARE
    X NUMBER := 5;
    Y VARCHAR(30) := 'A';
    Z NUMBER;
BEGIN 
    Z := X + Y ;
    DBMS_OUTPUT.PUT_LINE ('THE SUM IS:' || Z);
   
EXCEPTION
WHEN OTHERS
THEN
    DBMS_OUTPUT.PUT_LINE ('ERROR');

END;

--USING COUNT
DECLARE
    VCOUNT NUMBER;
BEGIN 
    SELECT COUNT(*) INTO VCOUNT
    FROM STAFF
    WHERE BRANCHNO = 'B003';
    IF(VCOUNT >= 3) THEN
    DBMS_OUTPUT.PUT_LINE ('THE NUMBER OF STAFF IN B003 IS: ' || VCOUNT);
    ELSE
    DBMS_OUTPUT.PUT_LINE('ERROR');
    END IF;
END;


DECLARE 
    vLastName VARCHAR(10) := 'Lee';
    vFirstName VARCHAR(10);
BEGIN
    SELECT fname INTO vFirstName
    FROM staff
    WHERE LName = vLastName;
    DBMS_OUTPUT.PUT_LINE('THE FIRST NAME OF ' ||vLastName|| ' IS ' ||vFirstName||);
END;



DECLARE
    VPOSITION STAFF.POSITION%TYPE;
BEGIN
    -- TO GET THE POSITION OF STAFF SL21
    SELECT POSITION INTO VPOSITION
    FROM STAFF
    WHERE STAFFNO = 'SL21';
    --IF(VPOSITION = 'Manager') THEN
    UPDATE STAFF
    SET SALARY = CASE(VPOSITION) --SALARY * 1.05;
    
        --UPDATE STAFF
        --SET SALARY = 
        WHEN 'Manager' THEN UPDATE STAFF SET SALARY = SALARY * 1.05;

    END CASE;
    END;
    
DECLARE
    n_counter NUMBER := 1;
    
BEGIN
    WHILE n_counter <= 5    LOOP
    DBMS_OUTPUT.PUT_LINE('COUNTER: ' || n_counter);
    n_counter := n_counter + 1;
    END LOOP;
    END;
