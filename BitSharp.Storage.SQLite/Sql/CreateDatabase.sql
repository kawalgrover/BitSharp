CREATE TABLE IF NOT EXISTS BlockData
(
	BlockHash BINARY(32) NOT NULL,
	RawBytes VARBINARY(100000000) NOT NULL,
	CONSTRAINT PK_Blocks PRIMARY KEY
	(
		BlockHash ASC
	)
);

CREATE TABLE IF NOT EXISTS BlockMetadata
(
	BlockHash BINARY(32) NOT NULL,
	PreviousBlockHash BINARY(32) NOT NULL,
	Work BINARY(64) NOT NULL,
	Height BIGINT NULL,
	TotalWork BINARY(64) NULL,
	IsValid BIT NULL,
	CONSTRAINT PK_BlockMetaData PRIMARY KEY
	(
		BlockHash ASC
	)
);

CREATE INDEX IF NOT EXISTS IX_BlockMetadata_PreviousBlockHash ON BlockMetadata ( PreviousBlockHash );

CREATE INDEX IF NOT EXISTS IX_BlockMetadata_Height ON BlockMetadata ( Height );

CREATE INDEX IF NOT EXISTS IX_BlockMetadata_TotalWork ON BlockMetadata ( TotalWork );

CREATE TABLE IF NOT EXISTS KnownAddresses
(
	IPAddress BINARY(16) NOT NULL,
	Port BINARY(2) NOT NULL,
	Services BINARY(8) NOT NULL,
	Time BINARY(4) NOT NULL,
	CONSTRAINT PK_KnownAddresses PRIMARY KEY
	(
		IPAddress ASC,
		Port ASC
	)
);

CREATE TABLE IF NOT EXISTS TransactionLocators
(
	BlockHash BINARY(32) NOT NULL,
	TransactionHash BINARY(32) NOT NULL,
	TransactionIndex BINARY(4) NOT NULL,
	CONSTRAINT PK_TransactionLocators PRIMARY KEY
	(
		BlockHash,
		TransactionHash
	)
);
