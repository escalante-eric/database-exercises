USE ada_683;

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL);
INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;

