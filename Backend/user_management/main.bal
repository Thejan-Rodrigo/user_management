import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/sql;
import ballerina/io;

configurable int port = 3306;
configurable string host = "localhost";
configurable string user = "root";
configurable string database = "user_management";
configurable string password = "thejan@WSO2";

mysql:Client dbClient = check new (host, user, password, database, 3306, connectionPool = {maxOpenConnections: 5});

function getUsersById(int Id) returns User[]|sql:Error?{
    stream<User, sql:Error?> result = dbClient->query(`SELECT * FROM users WHERE ${Id}`);
    User[] users = [];
        
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    return users;
}

function getAllUsers() returns User[]|sql:Error?{
    stream<User, sql:Error?> result = dbClient->query(`SELECT * FROM users`);

    User[] users = [];
        
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    return users;

}

function inserUser(User user) returns string|error?{
    _= check dbClient->execute(`INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`);
    //stream<User, sql:Error?> result = dbClient->query(`INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`);
    return "Created";
}

function updateUser(UpdateUser user, int ID) returns sql:ExecutionResult|error?{
    sql:ExecutionResult|error? test = check dbClient->execute(`UPDATE users SET FristName = ${user.FristName}, LastName = ${user.LastName}, Age = ${user.Age} WHERE ID = ${ID}`);
    // io:println(user.FristName);
    // io:println(user.LastName);
    // io:println(user.Age);
    return test;
}

function deleteUser(int ID) returns sql:ExecutionResult|error?{
    io:println(ID);
    sql:ExecutionResult|error? delete = check dbClient->execute(`DELETE FROM users WHERE ID = ${ID}`);
    return delete;
}