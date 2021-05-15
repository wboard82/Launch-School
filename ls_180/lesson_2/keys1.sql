DROP SEQUENCE IF EXISTS counter;
CREATE SEQUENCE counter;

SELECT nextval('counter');
DROP SEQUENCE counter;

CREATE SEQUENCE counter INCREMENT BY 2 START WITH 2;
SELECT nextval('counter');
SELECT nextval('counter');
SELECT nextval('counter');

