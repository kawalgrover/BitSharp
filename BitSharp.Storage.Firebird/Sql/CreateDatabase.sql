CREATE TABLE BlockHeaders
(
	BlockHash CHAR(32) CHARACTER SET OCTETS NOT NULL,
	HeaderBytes CHAR(80) CHARACTER SET OCTETS NOT NULL,
	CONSTRAINT PK_Blocks PRIMARY KEY
	(
		BlockHash
	)
);

CREATE TABLE ChainedBlocks
(
	BlockHash CHAR(32) CHARACTER SET OCTETS NOT NULL,
	PreviousBlockHash CHAR(32) CHARACTER SET OCTETS NOT NULL,
	Height INTEGER NOT NULL,
	TotalWork CHAR(64) CHARACTER SET OCTETS NOT NULL,
	CONSTRAINT PK_ChainedBlocks PRIMARY KEY
	(
		BlockHash
	)
);

CREATE TABLE KnownAddresses
(
	IPAddress CHAR(16) CHARACTER SET OCTETS NOT NULL,
	Port CHAR(2) CHARACTER SET OCTETS NOT NULL,
	Services CHAR(8) CHARACTER SET OCTETS NOT NULL,
	"Time" CHAR(4) CHARACTER SET OCTETS NOT NULL,
	CONSTRAINT PK_KnownAddresses PRIMARY KEY
	(
		IPAddress,
		Port
	)
);

CREATE TABLE BlockTransactions
(
	BlockHash CHAR(32) CHARACTER SET OCTETS NOT NULL,
	TxIndex INTEGER NOT NULL,
	TxHash CHAR(32) CHARACTER SET OCTETS NOT NULL,
	TxBytes BLOB SUB_TYPE BINARY NOT NULL,
	CONSTRAINT PK_TransactionLocators PRIMARY KEY
	(
		BlockHash,
		TxIndex
	)
);

CREATE INDEX IX_BlockTransactions_BlockHash ON BlockTransactions ( BlockHash );

CREATE INDEX IX_BlockTransactions_TxHash ON BlockTransactions ( TxHash );
