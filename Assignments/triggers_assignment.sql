create table users(
	user_id SERIAL PRIMARY KEY,
	user_name varchar,
	no_of_orders INT NOT NULL
);

create table products(
	product_id SERIAL PRIMARY KEY,
	product_name varchar,
	quantity INT NOT NULL,
	price INT NOT NULL
);
create table orders(
	product_id INT NOT NULL,
	order_at TIMESTAMP NOT NULL
);


insert into users(user_name,no_of_orders) values('lakshya akar',0);
insert into products(product_name,quantity,price) values('toys',2,200);

select * from users;
select * from products;
select * from orders;

CREATE OR REPLACE FUNCTION fn_order_track()  -- updating the quantity in product table as per the query.
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    as 
	$$
      BEGIN
		IF (TG_OP = 'DELETE') THEN
            update products set quantity=quantity+OLD.quantity where product_id= OLD.product_id;
            RETURN NEW;
        ELSIF (TG_OP = 'UPDATE') THEN
			IF OLD.quantity > NEW.quantity THEN
            	update products set quantity=quantity+OLD.quantity-NEW.quantity where product_id= OLD.product_id;
            	RETURN NEW;
			ELSE
				update products set quantity=quantity-NEW.quantity+OLD.quantity where product_id= NEW.product_id;
				RETURN NEW;
			END IF;
        ELSIF (TG_OP = 'INSERT') THEN
            update products set quantity=quantity-NEW.quantity where product_id= NEW.product_id;
            RETURN NEW;
        END IF;
		RETURN NULL;
	  END
    $$
	
CREATE TRIGGER track_order
    AFTER INSERT OR DELETE OR UPDATE
    ON orders
    FOR EACH ROW
      EXECUTE PROCEDURE fn_order_track();
      
select * from products;	  
INSERT into orders(product_id,order_at,quantity) values(1,NOW(),1);	  
DELETE from orders where product_id=1

