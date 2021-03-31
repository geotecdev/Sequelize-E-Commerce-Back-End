
--Categories - id, category_name
CREATE TABLE [dbo].[Categories] (
	[id][int] NOT NULL IDENTITY,
	[category_name] varchar(100) NOT NULL,
	CONSTRAINT [PK_dbo.Categories] PRIMARY KEY ([id])
);

--Tags - id, tag_name
CREATE TABLE [dbo].[Tags] (
	[id][int] NOT NULL IDENTITY,
	[tag_name] varchar(100),
	CONSTRAINT [PK_dbo.Tags] PRIMARY KEY ([id])
);

--Products - id, product_name, price, stock, category_id
CREATE TABLE [dbo].[Products] (
	[id][int] NOT NULL IDENTITY,
	[product_name] varchar(100) NOT NULL,
	[price][decimal] NOT NULL,
	[stock][int] NOT NULL,
	[category_id][int]
	CONSTRAINT [PK_dbo.Products] PRIMARY KEY ([id])
);

ALTER TABLE [dbo].[Products]
	ADD CONSTRAINT [FK_dbo.Products_CategoryId]
	FOREIGN KEY ([category_id]) REFERENCES [dbo].[Categories]([id])
	ON DELETE CASCADE;


--ProductTags - id, product_id, tag_id
CREATE TABLE [dbo].[ProductTags] (
	[id][int] NOT NULL IDENTITY,
	[product_id][int],
	[tag_id][int]
	CONSTRAINT [PK_dbo.ProductTags] PRIMARY KEY ([id])
);

ALTER TABLE [dbo].[ProductTags]
	ADD CONSTRAINT [FK_dbo.ProductTags_ProductId]
	FOREIGN KEY ([product_id]) REFERENCES [dbo].[Products]([id])
	ON DELETE CASCADE;
	
ALTER TABLE [dbo].[ProductTags]
	ADD CONSTRAINT [FK_dbo.ProductTags_TagId]
	FOREIGN KEY ([tag_id]) REFERENCES [dbo].[Tags]([id])
	ON DELETE CASCADE;


--seed database

--seed categories
INSERT INTO Categories (category_name)
VALUES
	('Shirts'),
	('Shorts'),
	('Music'),
	('Hats'),
	('Shoes');

--seed tags
INSERT INTO Tags (tag_name)
VALUES
	('rock music'),
	('pop music'),
	('blue'),
	('red'),
	('green'),
	('white'),
	('gold'),
	('pop culture');

--seed products
INSERT INTO Products (product_name, price, stock, category_id)
VALUES
	('Plain T-Shirt', 14.99, 14, 1),
	('Running Sneakers', 90, 25, 5),
	('Branded Baseball Hat', 22.99, 12, 4),
	('Top 40 Music Compilation Vinyl Record', 12.99, 50, 3),
	('Cargo Shorts', 29.99, 22, 2);

--seed productTags
INSERT INTO ProductTags (product_id, tag_id)
VALUES
	(1, 6),
	(1, 7),
	(1, 8),
	(2, 6),
	(3, 1),
	(3, 3),
	(3, 4),
	(3, 5),
	(4, 1),
	(4, 2),
	(4, 8),
	(5, 3);



USE penn_lps;  
GO  
EXEC sp_rename 'h13Categories', 'Categories';  
GO  

USE penn_lps;  
GO  
EXEC sp_rename 'h13Products', 'Products';  
GO      

USE penn_lps;  
GO  
EXEC sp_rename 'h13Tags', 'Tags';  
GO  

USE penn_lps;  
GO  
EXEC sp_rename 'h13ProductTags', 'ProductTags';  
GO      