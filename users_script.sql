--Admin: 

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123'; 
GRANT ALL PRIVILEGES ON `00_ecommerce_esportes`.* TO 'admin'@'localhost'; 


--Cliente: 

CREATE USER 'cliente'@'localhost' IDENTIFIED VIA mysql_native_password USING 'cliente123'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON `00_ecommerce_esportes`.* TO 'cliente'@'localhost';


--Transportadora: 

CREATE USER 'transportadora'@'localhost' IDENTIFIED VIA mysql_native_password USING 'trans123'; 
GRANT SELECT, INSERT, UPDATE ON `00_ecommerce_esportes`.* TO 'transportadora'@'localhost';
