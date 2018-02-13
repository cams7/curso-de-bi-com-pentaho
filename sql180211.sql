
select o.orderid, d.productid, o.customerid, d.unitprice, d.quantity, d.discount 
from order_details d 
inner join orders o on d.orderid=o.orderid;


select o.orderid, o.customerid, to_char(o.orderdate, 'yyyyMMdd') as orderdate from orders o order by o.orderid asc;

select d.orderid, d.productid, d.unitprice, d.quantity, d.discount from order_details d order by d.orderid asc;


select d.unitprice as preco_unitario, d.quantity as quantidade, d.discount as desconto, d.productid as produto_id, o.customerid as cliente_id, to_char(o.orderdate, 'yyyyMMdd') as data_pedido 
from order_details d inner join orders o on d.orderid=o.orderid order by o.orderid asc;

