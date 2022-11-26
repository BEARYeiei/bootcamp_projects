-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

 -- Dimtable customers
CREATE TABLE customers (
  	customer_id INT PRIMARY KEY ,
  	FirstName TEXT,
  	LastName TEXT,
  	city TEXT,
    memberships TEXT );
    
   INSERT INTO customers VALUES
    (1,"Jenny","Walker","Newyork","Gold"),
    (2,"Teddy","Bear","Newyork","Diamond"),
    (3,"Romeo","Wang","Newyork","Silver"),
    (4,"Mark","Lee","Boston","Diamond"),
    (5,"Barry","Beckham","Boston","Gold"),
    (6,"Diago","Portman","Newyork","Silver"),
    (7,"Tony","Stark","Newyork","Diamond"),
    (8,"William","Hammington","Florida","Platinum");
    
    -- Dimtable categories
    CREATE TABLE categories (
      categories_id INT PRIMARY KEY,
      categories_name TEXT );
      
      INSERT INTO categories VALUES
      (1,"Main Course"),
      (2,"Appetizer"),
      (3,"Dessert"),
      (4,"Drink") ;
      
    CREATE TABLE employee (
      employee_id INT PRIMARY KEY,
      employee_name TEXT,
      position TEXT );
      
    INSERT INTO employee VALUES
      (1,"Ben","Executive Chef"),
      (2,"Robert","Pastry Chef"),
  	  (3,"Anna","Sous Chef"),
      (4,"Lisa","Server"),
      (5,"Ruby","cashier"); 
    
    -- Dimtable menu 
     CREATE TABLE menu (
        menu_id INT PRIMARY KEY,
        menu_name TEXT,
        price REAL ,
        categories_id INT,
        FOREIGN KEY (categories_id) REFERENCES categories(categories_id) 
     ); 
        
        INSERT INTO menu VALUES
        (1,"Spaghetti Carbonara",20.0,1),	
        (2,"Ribeye Steak",26.25,1),
        (3,"T-Bone",11.50,1),
        (4,"Potato Mashed",9.25,2),
        (5,"Coke",5.50,4),
        (6,"tiramisu",15.30,3); 
        
        -- Dimtable orders
        CREATE TABLE orders (
          order_id INT PRIMARY KEY ,
          customer_id INT ,
          orders_date TEXT,
          FOREIGN Key (customer_id) REFERENCES customers(customer_id)); 
          
          INSERT INTO orders VALUES
        (1,1,'2022-06-29'),
  		(2,1,'2022-06-27'),
  		(3,2,'2022-06-26'),
  		(4,3,'2022-06-26'),
        (5,4,'2022-06-26'),
        (6,5,'2022-06-24'),
        (7,6,'2022-06-25'),
        (8,7,'2022-06-27'),
        (9,8,'2022-06-27'),
        (10,2,'2022-06-22'); 
        
        --facttable sales_details
        CREATE TABLE sales_detials (
          sales_id INT PRIMARY KEY ,
          order_id INT ,
          customer_id INT,
          menu_id INT,
          amount REAL,
          FOREIGN Key (customer_id) REFERENCES customers(customer_id)
          FOREIGN Key (order_id) REFERENCES orders(order_id)
          FOREIGN Key (menu_id) REFERENCES menu(menu_id)); 
          
          INSERT INTO sales_detials VALUES
        (1,1,1,2,26.25),
  		(2,2,1,3,11.50),
  		(3,3,2,3,11.50),
  		(4,4,3,4,5.50),
      	(5,5,4,5,5.50),
        (6,6,5,6,15.30),
        (7,7,6,4,9.25),
        (8,8,7,5,5.50),
        (9,9,8,6,15.30),
        (10,2,3,1,20.0);

.mode table
.header on 
SELECT memberships,
	CASE 
    when memberships IN ('Diamond','Platinum') THEN 'VIP Customers'
    ELSE 'Standard Customers'
    END member
FROM customers ;

-- total daily
SELECT
  orders_date,
  SUM(Price) AS 'Day Total'
FROM(
    SELECT 
    *
    FROM orders
    JOIN sales_detials 
    ON orders.order_id = sales_detials.order_id
    JOIN menu 
    ON sales_detials.menu_id = menu.menu_id
)
GROUP BY orders_date;

-- top menu
SELECT 
	 menu.menu_id,
    menu.menu_name,
    COUNT (*) AS topmmenu
    FROM menu
    JOIN sales_detials
    ON menu.menu_id = sales_detials.menu_id;

-- customer in newyork with diamond , platinum rank

 WITH n_newyork AS (
	SELECT * FROM customers
	WHERE city = 'Newyork'
)

SELECT 
	firstname, 
    city,
    memberships
FROM n_newyork
WHERE memberships IN ('Platinum', 'Diamond');
