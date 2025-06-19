import ballerinax/mysql;
import ballerinax/mysql.driver as _;
// import ballerina/sql;


configurable DatabaseConfig databaseConfig = ?;

configurable int port = databaseConfig.port;
configurable string host = databaseConfig.host;
configurable string user = databaseConfig.user;
configurable string database = databaseConfig.database;
configurable string password = databaseConfig.password;
configurable int maxOpenConnections = databaseConfig.maxOpenConnections;

mysql:Client dbClient = check new (host, user, password, database, port, connectionPool = {maxOpenConnections: maxOpenConnections});