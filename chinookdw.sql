/****** Object:  Database ChinookDW    Script Date: 12/9/2019 1:02:14 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE ChinookDW
GO
CREATE DATABASE ChinookDW
GO
ALTER DATABASE ChinookDW
SET RECOVERY SIMPLE
GO
*/
USE ChinookDW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimArtist */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimArtist') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimArtist 
;

/* Create table dbo.DimArtist */
CREATE TABLE dbo.DimArtist (
   [ArtistKey]  int IDENTITY  NOT NULL
,  [ArtistID]  int   NOT NULL
,  [Name]  nvarchar(120)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimArtist] PRIMARY KEY CLUSTERED 
( [ArtistKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimArtist
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Artist', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimArtist
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimArtist
;

SET IDENTITY_INSERT dbo.DimArtist ON
;
INSERT INTO dbo.DimArtist (ArtistKey, ArtistID, Name, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimArtist OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArtistKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArtistID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Alanis Morissette', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Artist', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Artist', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ArtistId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'ArtistID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimArtist', @level2type=N'COLUMN', @level2name=N'Name'; 
;





/* Drop table dbo.DimAlbum */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimAlbum') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimAlbum 
;

/* Create table dbo.DimAlbum */
CREATE TABLE dbo.DimAlbum (
   [AlbumKey]  int IDENTITY  NOT NULL
,  [AlbumID]  int   NOT NULL
,  [Title]  nvarchar(160)   NOT NULL
,  [ArtistId]  int   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimAlbum] PRIMARY KEY CLUSTERED 
( [AlbumKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAlbum
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Album', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAlbum
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAlbum
;

SET IDENTITY_INSERT dbo.DimAlbum ON
;
INSERT INTO dbo.DimAlbum (AlbumKey, AlbumID, Title, ArtistId, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', -1, 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimAlbum OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlbumKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlbumID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArtistId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'For Those About To Rock We Salute You', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Album', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Album', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Artist', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AlbumId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ArtistId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'AlbumID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'Title'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAlbum', @level2type=N'COLUMN', @level2name=N'ArtistId'; 
;





/* Drop table dbo.DimEmployee */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimEmployee') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimEmployee 
;

/* Create table dbo.DimEmployee */
CREATE TABLE dbo.DimEmployee (
   [EmployeeKey]  int IDENTITY  NOT NULL
,  [EmployeeID]  int   NOT NULL
,  [FirstName]  nvarchar(20)   NOT NULL
,  [LastName]  nvarchar(20)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimEmployee] PRIMARY KEY CLUSTERED 
( [EmployeeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Employee', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
;

SET IDENTITY_INSERT dbo.DimEmployee ON
;
INSERT INTO dbo.DimEmployee (EmployeeKey, EmployeeID, FirstName, LastName, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Unk Attribute2', 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimEmployee OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Adams', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Andrew', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmployeeId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LastName'; 
;





/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerID]  int   NOT NULL
,  [FirstName]  nvarchar(40)   NOT NULL
,  [LastName]  nvarchar(20)   NOT NULL
,  [Company]  nvarchar(80)   NULL
,  [State]  nvarchar(40)   NULL
,  [Country]  nvarchar(40)   NULL
,  [SupportRepId]  int   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

SET IDENTITY_INSERT dbo.DimCustomer ON
;
INSERT INTO dbo.DimCustomer (CustomerKey, CustomerID, FirstName, LastName, Company, State, Country, SupportRepId, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Unk Attribute2', 'Unk Attribute3', 'Unk Attribute4', 'Unk Attribute5', -1, 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimCustomer OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SupportRepId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Astrid', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Gruber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Embraer - Empresa Brasileira de Aeronáutica S.A.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'SP', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Brazil', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SupportRepId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Company'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'SupportRepId'; 
;





/* Drop table dbo.DimGenre */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimGenre') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimGenre 
;

/* Create table dbo.DimGenre */
CREATE TABLE dbo.DimGenre (
   [GenreKey]  int IDENTITY  NOT NULL
,  [GenreID]  int   NOT NULL
,  [Name]  nvarchar(120)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimGenre] PRIMARY KEY CLUSTERED 
( [GenreKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimGenre
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Genre', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimGenre
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimGenre
;

SET IDENTITY_INSERT dbo.DimGenre ON
;
INSERT INTO dbo.DimGenre (GenreKey, GenreID, Name, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimGenre OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GenreKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GenreID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Rock', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GenreId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'GenreID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimGenre', @level2type=N'COLUMN', @level2name=N'Name'; 
;





/* Drop table dbo.DimMediaType */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimMediaType') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimMediaType 
;

/* Create table dbo.DimMediaType */
CREATE TABLE dbo.DimMediaType (
   [MediaTypeKey]  int IDENTITY  NOT NULL
,  [MediaTypeID]  int   NOT NULL
,  [Name]  nvarchar(120)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimMediaType] PRIMARY KEY CLUSTERED 
( [MediaTypeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMediaType
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MediaType', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMediaType
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMediaType
;

SET IDENTITY_INSERT dbo.DimMediaType ON
;
INSERT INTO dbo.DimMediaType (MediaTypeKey, MediaTypeID, Name, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimMediaType OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MediaTypeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MediaTypeID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'MPEG audio file', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'MediaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'MediaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MediaTypeId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'MediaTypeID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMediaType', @level2type=N'COLUMN', @level2name=N'Name'; 
;





/* Drop table dbo.DimTrack */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimTrack') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimTrack 
;

/* Create table dbo.DimTrack */
CREATE TABLE dbo.DimTrack (
   [TrackKey]  int IDENTITY  NOT NULL
,  [TrackID]  int   NOT NULL
,  [Name]  nvarchar(200)   NOT NULL
,  [AlbumId]  int   NOT NULL
,  [MediaTypeId]  int   NOT NULL
,  [GenreId]  int   NOT NULL
,  [UnitPrice]  numeric(10, 2)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimTrack] PRIMARY KEY CLUSTERED 
( [TrackKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTrack
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Track', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTrack
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTrack
;

SET IDENTITY_INSERT dbo.DimTrack ON
;
INSERT INTO dbo.DimTrack (TrackKey, TrackID, Name, AlbumId, MediaTypeId, GenreId, UnitPrice, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', -1, -1, -1, 0.99, 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimTrack OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlbumId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MediaTypeId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GenreId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'For Those About To Rock (We Salute You)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Album', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'MediaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TrackId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AlbumId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MediaTypeId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GenreId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'TrackID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'Name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'AlbumId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'MediaTypeId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'GenreId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'numeric(10, 2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTrack', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
;





/* Drop table dbo.DimInvoice */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimInvoice') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimInvoice 
;

/* Create table dbo.DimInvoice */
CREATE TABLE dbo.DimInvoice (
   [InvoiceKey]  int IDENTITY  NOT NULL
,  [InvoiceID]  int   NOT NULL
,  [CustomerId]  int   NOT NULL
,  [InvoiceDate]  datetime   NOT NULL
,  [BillingAdress]  nvarchar(80)   NULL
,  [BillingCity]  nvarchar(40)   NULL
,  [BillingState]  nvarchar(40)   NULL
,  [BillingCountry]  nvarchar(40)   NULL
,  [Total]  numeric(10, 2)   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimInvoice] PRIMARY KEY CLUSTERED 
( [InvoiceKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoice
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoice
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoice
;

SET IDENTITY_INSERT dbo.DimInvoice ON
;
INSERT INTO dbo.DimInvoice (InvoiceKey, InvoiceID, CustomerId, InvoiceDate, BillingAdress, BillingCity, BillingState, BillingCountry, Total, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, -1, '1/1/2000', '69 Salem Street', 'Boston', 'MA', 'USA', 0.99, 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimInvoice OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BillingAdress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BillingCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BillingState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BillingCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Total', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'23', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'69 Salem Street', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Boston', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'MA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'USA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'13.86', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'InvoiceId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'InvoiceDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BillingAdress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BillingCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BillingState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BillingCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Total', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'CustomerId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'InvoiceDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingAdress'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingState'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'BillingCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'numeric(10, 2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoice', @level2type=N'COLUMN', @level2name=N'Total'; 
;





/* Drop table dbo.DimInvoiceLine */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimInvoiceLine') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimInvoiceLine 
;

/* Create table dbo.DimInvoiceLine */
CREATE TABLE dbo.DimInvoiceLine (
   [InvoiceLineKey]  int IDENTITY  NOT NULL
,  [InvoiceLineID]  int   NOT NULL
,  [InvoiceId]  int   NOT NULL
,  [TrackId]  int   NOT NULL
,  [UnitPrice]  numeric(10, 2)   NOT NULL
,  [Quantity]  int   NOT NULL
,  [RowIsCurrent]  nchar(1)  DEFAULT '1' NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)  DEFAULT 'NULL' NOT NULL
, CONSTRAINT [PK_dbo.DimInvoiceLine] PRIMARY KEY CLUSTERED 
( [InvoiceLineKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoiceLine
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoiceLine
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInvoiceLine
;

SET IDENTITY_INSERT dbo.DimInvoiceLine ON
;
INSERT INTO dbo.DimInvoiceLine (InvoiceLineKey, InvoiceLineID, InvoiceId, TrackId, UnitPrice, Quantity, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, -1, -1, 0.99, 1, 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimInvoiceLine OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceLineKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceLineID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Chinook', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'InvoiceLineId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'InvoiceId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TrackId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceLineID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'InvoiceId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'TrackId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'numeric(10, 2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInvoiceLine', @level2type=N'COLUMN', @level2name=N'Quantity'; 
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int IDENTITY  NOT NULL
,  [DateId]  int   NOT NULL
,  [Date]  datetime   NOT NULL
,  [Week]  int   NOT NULL
,  [Month]  int   NOT NULL
,  [Quarter]  int   NOT NULL
,  [Year]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

SET IDENTITY_INSERT dbo.DimDate ON
;
INSERT INTO dbo.DimDate (DateKey, DateId, Date, Week, Month, Quarter, Year)
VALUES (-1, 0, '1/1/2000', -1, -1, -1, -1)
;
SET IDENTITY_INSERT dbo.DimDate OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Week'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateId'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..7', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Week'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3,4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Week'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Week'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
;





/* Drop table dbo.FactInventory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactInventory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactInventory 
;

/* Create table dbo.FactInventory */
CREATE TABLE dbo.FactInventory (
   [TrackKey]  int   NOT NULL
,  [ArtistKey]  int   NOT NULL
,  [AlbumKey]  int   NOT NULL
,  [GenreKey]  int   NOT NULL
,  [MediaTypeKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.FactInventory] PRIMARY KEY NONCLUSTERED 
( [TrackKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactInventory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Inventory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactInventory
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Inventory Information', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactInventory
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArtistKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlbumKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GenreKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MediaTypeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Artist', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Album', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to MediaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimTrack.TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimArtist.ArtistKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimAlbum.AlbumKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimGenre.GenreKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimMediaType.MediaTypeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactInventory', @level2type=N'COLUMN', @level2name=N'MediaTypeKey'; 
;





/* Drop table dbo.FactBilling */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBilling') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBilling 
;

/* Create table dbo.FactBilling */
CREATE TABLE dbo.FactBilling (
   [DateKey]  int   NOT NULL
,  [CustomerKey]  int   NOT NULL
,  [EmployeeKey]  int   NOT NULL
,  [TrackKey]  int   NOT NULL
,  [InvoiceKey]  int   NOT NULL
,  [InvoiceLineKey]  int   NOT NULL
,  [UnitPrice]  numeric(10, 2)   NOT NULL
,  [Quantity]  int   NOT NULL
,  [Total]  numeric(10, 2)   NOT NULL
, CONSTRAINT [PK_dbo.FactBilling] PRIMARY KEY NONCLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBilling
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Billing', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBilling
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Billing Information', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBilling
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceLineKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Total', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'20120108', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 8', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 9', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimDate.DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCustomer.CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimEmployee.EmployeeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimTrack.TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimInvoice.InvoiceKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimInvoiceLine.InvoiceLineKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ChinookDW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ChinookDW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ChinookDW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'UnitPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Total', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'numeric(10, 2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'UnitPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'numeric(10, 2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBilling', @level2type=N'COLUMN', @level2name=N'Total'; 
;





/* Drop table dbo.FactBestSeller */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBestSeller') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBestSeller 
;

/* Create table dbo.FactBestSeller */
CREATE TABLE dbo.FactBestSeller (
   [InvoiceLineKey]  int   NOT NULL
,  [DateKey]  int   NOT NULL
,  [ArtistKey]  int   NOT NULL
,  [AlbumKey]  int   NOT NULL
,  [GenreKey]  int   NOT NULL
,  [TrackKey]  int   NOT NULL
,  [InvoiceKey]  int   NOT NULL
,  [Quantity]  int   NOT NULL
, CONSTRAINT [PK_dbo.FactBestSeller] PRIMARY KEY NONCLUSTERED 
( [InvoiceLineKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBestSeller
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Best_Seller', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBestSeller
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Best Seller Information', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBestSeller
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceLineKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ArtistKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AlbumKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GenreKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InvoiceKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Artist', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Album', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Track', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Invoice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 9', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'20120109', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 8', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimInvoiceLine.InvoiceLineKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceLineKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimDate.DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimArtist.ArtistKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'ArtistKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimAlbum.AlbumKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'AlbumKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimGenre.GenreKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'GenreKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimTrack.TrackKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'TrackKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimInvoice.InvoiceKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'InvoiceKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ChinookDW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'InvoiceLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBestSeller', @level2type=N'COLUMN', @level2name=N'Quantity'; 
;
ALTER TABLE dbo.FactInventory ADD CONSTRAINT
   FK_dbo_FactInventory_TrackKey FOREIGN KEY
   (
   TrackKey
   ) REFERENCES DimTrack
   ( TrackKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactInventory ADD CONSTRAINT
   FK_dbo_FactInventory_ArtistKey FOREIGN KEY
   (
   ArtistKey
   ) REFERENCES DimArtist
   ( ArtistKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactInventory ADD CONSTRAINT
   FK_dbo_FactInventory_AlbumKey FOREIGN KEY
   (
   AlbumKey
   ) REFERENCES DimAlbum
   ( AlbumKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactInventory ADD CONSTRAINT
   FK_dbo_FactInventory_GenreKey FOREIGN KEY
   (
   GenreKey
   ) REFERENCES DimGenre
   ( GenreKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactInventory ADD CONSTRAINT
   FK_dbo_FactInventory_MediaTypeKey FOREIGN KEY
   (
   MediaTypeKey
   ) REFERENCES DimMediaType
   ( MediaTypeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_EmployeeKey FOREIGN KEY
   (
   EmployeeKey
   ) REFERENCES DimEmployee
   ( EmployeeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_TrackKey FOREIGN KEY
   (
   TrackKey
   ) REFERENCES DimTrack
   ( TrackKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_InvoiceKey FOREIGN KEY
   (
   InvoiceKey
   ) REFERENCES DimInvoice
   ( InvoiceKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBilling ADD CONSTRAINT
   FK_dbo_FactBilling_InvoiceLineKey FOREIGN KEY
   (
   InvoiceLineKey
   ) REFERENCES DimInvoiceLine
   ( InvoiceLineKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_InvoiceLineKey FOREIGN KEY
   (
   InvoiceLineKey
   ) REFERENCES DimInvoiceLine
   ( InvoiceLineKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_ArtistKey FOREIGN KEY
   (
   ArtistKey
   ) REFERENCES DimArtist
   ( ArtistKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_AlbumKey FOREIGN KEY
   (
   AlbumKey
   ) REFERENCES DimAlbum
   ( AlbumKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_GenreKey FOREIGN KEY
   (
   GenreKey
   ) REFERENCES DimGenre
   ( GenreKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_TrackKey FOREIGN KEY
   (
   TrackKey
   ) REFERENCES DimTrack
   ( TrackKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBestSeller ADD CONSTRAINT
   FK_dbo_FactBestSeller_InvoiceKey FOREIGN KEY
   (
   InvoiceKey
   ) REFERENCES DimInvoice
   ( InvoiceKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
