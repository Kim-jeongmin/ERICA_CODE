\c cse3010

CREATE TABLE order_details(
	order_detail_id int PRIMARY KEY NOT NULL,	
    order_id int NOT NULL,
	order_date DATE,
	quantity int,
	notes varchar(200)
);



\dt;

\d order_details


alter TABLE order_details ALTER column notes SET DEFAULT 'Standard Shipping';

\d order_details

alter TABLE order_details add order_uuid uuid;

\d order_details

alter TABLE order_details add CHECK (quantity > 0);

\d order_details

alter TABLE order_details rename column notes to memo;

\d order_details

alter TABLE order_details alter column order_id drop not null;

\d order_details

drop table order_details;

\dt;