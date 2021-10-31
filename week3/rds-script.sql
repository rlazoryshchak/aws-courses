CREATE DATABASE AWS_COURSE_DB;

CREATE TABLE AWS_COURSE_PRODUCTS (
  PRODUCT_ID INTEGER PRIMARY KEY,
  PRODUCT_NAME VARCHAR(200)
);

INSERT INTO AWS_COURSE_PRODUCTS VALUES (1, 'MacBook');
INSERT INTO AWS_COURSE_PRODUCTS VALUES (2, 'iPhone');

SELECT * FROM AWS_COURSE_PRODUCTS;