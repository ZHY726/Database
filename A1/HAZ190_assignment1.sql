USE haz190;
CREATE TABLE customers(
	customer_number int(11) primary key not null auto_increment,
    customer_last_name varchar(50) not null,
    customer_first_name varchar(50) not null,
    phone varchar(50) not null,
    address_line_1 varchar(50) not null,
    address_line_2 varchar(50),
    city varchar(50) not null,
    state varchar(50),
    zip varchar(15)
);
CREATE TABLE employees(
	employee_number int(11) primary key not null auto_increment,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    extension varchar(10) not null,
    email varchar(100) not null,
    job_title varchar(50) not null
);
CREATE TABLE products(
	product_code varchar(15) primary key not null,
    product_name varchar(70) not null,
    product_vendor varchar(150) not null,
    product_description text not null,
    quantity_in_stock smallint(6) not null,
    buy_price double not null,
    msrp double not null
);
CREATE TABLE orders(
	order_number int(11) primary key not null auto_increment,
    order_date date not null,
    required_date date not null,
    shipped_date date,
    status varchar(15) not null,
    fk_customer_number int(11) not null,
    fk_employee_number int(11) not null,
    foreign key(fk_customer_number)
    references customers(customer_number)
    on delete cascade on update cascade,
    foreign key(fk_employee_number)
    references employees(employee_number)
    on delete cascade on update cascade
);
CREATE TABLE orderdetails(
	fk_order_number int(11) not null,
    fk_product_code varchar(15) not null,
    quantity_ordered int(11) not null,
    price_each double not null,
    primary key(fk_order_number, fk_product_code),
    foreign key(fk_order_number)
    references orders(order_number)
    on delete cascade on update cascade,
    foreign key(fk_product_code)
    references products(product_code)
    on delete cascade on update cascade
);
INSERT INTO customers(customer_last_name, customer_first_name, phone, address_line_1, city, state, zip)
VALUES
	('Zeng', 'Haoyang', '8782560844', 'Forbes Avenue', 'Pittsburgh', 'Pennysylvania', '15213'),
    ('Harry', 'James', '1234567890', 'Sky Street', 'Pittsburgh', 'Pennysylvania', '15200'),
    ('Jason', 'John', '0123456789', 'Fifth Avenue', 'Los Angeles', 'California', '13456');
    
INSERT INTO employees(last_name, first_name, extension, email, job_title)
VALUES
	('Kyrie', 'Irving', '123', 'abc123@gmail.com', 'manager'),
    ('Kevin', 'Durant', '456', 'efg456@gmail.com', 'manager'),
    ('Smith', 'Joe', '789', 'hij789@gmail.com', 'CEO');
    
INSERT INTO products(product_code, product_name, product_vendor, product_description, quantity_in_stock, buy_price, msrp)
VALUES
	('a1', 'phone', 'abcd', 'It is a phone.', 100, 500, 450),
    ('b1', 'laptop', 'efgh', 'It is a laptop', 200, 1000, 900),
    ('c1', 'desk', 'wxyz', 'It is a desk', 400, 50, 45);

INSERT INTO orders(order_date, required_date, shipped_date, status, fk_customer_number, fk_employee_number)
VALUES
	('2023-01-02', '2023-03-04', '2023-03-01', 'not shipped', 1, 2),
    ('2023-05-13', '2023-05-20', '2023-05-18', 'not shipped', 2, 2),
    ('2023-02-20', '2023-02-28', '2023-02-26', 'on delivering', 3, 3);
    
INSERT INTO orderdetails(fk_order_number, fk_product_code, quantity_ordered, price_each)
VALUES
	('1', 'a1', 2, 500),
    ('1', 'b1', 1, 1000),
    ('2', 'a1', 1, 500),
    ('2', 'c1', 3, 50),
    ('3', 'b1', 2, 1000),
    ('3', 'c1', 1, 50);
    