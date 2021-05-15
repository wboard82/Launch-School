DROP TABLE IF EXISTS menu_items;
CREATE TABLE menu_items (
    item varchar(255),
    prep_time int,
    ingredient_cost decimal(4,2),
    sales int,
    menu_price decimal(4,2)
);

INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
VALUES
('omelette', 10, 1.50, 182, 7.99),
('tacos', 5, 2.00, 254, 8.99),
('oatmeal', 1, 0.50, 79, 5.99);

SELECT item, (menu_price - ingredient_cost) AS profit
  FROM menu_items ORDER BY profit DESC limit 1;

SELECT item, menu_price, ingredient_cost,
       round(prep_time / 60.0 * 13.0, 2) AS labor,
       menu_price - ingredient_cost - round(prep_time / 60.0 * 13.0, 2) AS profit
  FROM menu_items
ORDER BY profit DESC;
