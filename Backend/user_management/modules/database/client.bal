import ballerinax/mysql;
import ballerinax/mysql.driver as _;
// import ballerina/sql;

//Create configurable DatabaseConfig
configurable DatabaseConfig databaseConfig = ?;

//Config using data from config.toml file
configurable int port = databaseConfig.port;
configurable string host = databaseConfig.host;
configurable string user = databaseConfig.user;
configurable string database = databaseConfig.database;
configurable string password = databaseConfig.password;
configurable int maxOpenConnections = databaseConfig.maxOpenConnections;

//Create a MySQL client
mysql:Client dbClient = check new (host, user, password, database, port, connectionPool = {maxOpenConnections: maxOpenConnections});