select * from products;

select * from categories;

select c.categoryname, p.productname, p.unitprice 
FROM products p 
inner join categories c on p.categoryid=c.categoryid;

select c.categoryname, (
	select p1.productname from products p1 where p1.unitprice=max(p.unitprice) and p1.categoryid=c.categoryid
) as produto1, max(p.unitprice) as maior_preco, (
	select p2.productname from products p2 where p2.unitprice=min(p.unitprice) and p2.categoryid=c.categoryid
) as produto2, min(p.unitprice) as menor_preco 
FROM products p 
inner join categories c on p.categoryid=c.categoryid
group by c.categoryid, c.categoryname;

select * from orders;

select * from employees;

select * from customers;

select * from order_details;

select od.quantity, od.discount, od.unitprice as order_unitprice, o.orderdate, e.firstname, e.lastname, cu.companyname, cu.contactname, p.productname, p.unitprice, ca.categoryname
from order_details od
inner join orders o on od.orderid=o.orderid
inner join employees e on o.employeeid=e.employeeid
inner join customers cu on o.customerid=cu.customerid
inner join products p on od.productid=p.productid
inner join categories ca on p.categoryid=ca.categoryid;

select ca.categoryname as "categoria", (p.productname || ' - R$ '|| trim(to_char(p.unitprice, 'L9G999G990D99'))) as "produto", 
count(o.orderid) as "pedidos", ('R$ '||trim(to_char(sum(od.quantity *(od.unitprice - od.discount)), 'L9G999G990D99'))) as "vendidos" 
from order_details od
inner join orders o on od.orderid=o.orderid
inner join customers cu on o.customerid=cu.customerid
inner join products p on od.productid=p.productid
inner join categories ca on p.categoryid=ca.categoryid
group by p.productid, p.productname, p.unitprice, ca.categoryname
having p.unitprice >= 20
order by ca.categoryname, p.unitprice;

select cu.country as "país", cu.contactname as "cliente", 
count(o.orderid) as "pedidos", ('R$ '||trim(to_char(sum(od.quantity *(od.unitprice - od.discount)), 'L9G999G990D99'))) as "vendidos" 
from order_details od
inner join orders o on od.orderid=o.orderid
inner join customers cu on o.customerid=cu.customerid
group by cu.customerid, cu.contactname, cu.country
having lower(cu.country) in ('brazil', 'portugal', 'mexico' , 'usa', 'canada')
order by cu.country, cu.contactname;

select e.country as "país", count(o.orderid) as "pedidos", ('R$ '||trim(to_char(sum(od.quantity *(od.unitprice - od.discount)), 'L9G999G990D99'))) as "vendidos" 
from order_details od
inner join orders o on od.orderid=o.orderid
inner join employees e on o.employeeid=e.employeeid
group by e.country
order by e.country;

select * from suppliers;

select count(orderid) as "pedidos" from order_details;

select count(productid) as "produtos" from (select distinct productid from order_details) as productid;
select count(customerid) as "clientes" from (select distinct customerid from orders) as customerid;

select s.companyname as "fornecedor", 
count(o.orderid) as "pedidos", ('R$ '||trim(to_char(sum(od.quantity *(od.unitprice - od.discount)), 'L9G999G990D99'))) as "vendidos" 
from order_details od
inner join orders o on od.orderid=o.orderid
inner join customers cu on o.customerid=cu.customerid
inner join products p on od.productid=p.productid
inner join suppliers s on p.supplierid=s.supplierid
group by s.supplierid, s.companyname
order by s.companyname;

select customerid, contactname, phone, city, country from customers;

select productid, productname, unitprice from products;

select o.orderid, d.productid, o.customerid, d.unitprice, d.quantity, d.discount from order_details d inner join orders o on d.orderid=o.orderid;












