// import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/sql;
import ballerina/io;


public function getUsersById(int Id) returns User[]|sql:Error?{
    stream<User, sql:Error?> result = dbClient->query(`SELECT * FROM users WHERE ${Id}`);
    User[] users = [];
        
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    return users;
}

public function getAllUsers() returns User[]|sql:Error?{
    stream<User, sql:Error?> result = dbClient->query(`SELECT * FROM users`);

    User[] users = [];
        
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    return users;

}

public function inserUser(User user) returns string|error?{
    _= check dbClient->execute(`INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`);
    //stream<User, sql:Error?> result = dbClient->query(`INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`);
    return "Created";
}

public function updateUser(UpdateUser user, int ID) returns sql:ExecutionResult|error?{
    sql:ExecutionResult|error? test = check dbClient->execute(`UPDATE users SET FristName = ${user.FristName}, LastName = ${user.LastName}, Age = ${user.Age} WHERE ID = ${ID}`);
    // io:println(user.FristName);
    // io:println(user.LastName);
    // io:println(user.Age);
    return test;
}

public function deleteUser(int ID) returns sql:ExecutionResult|error?{
    io:println(ID);
    sql:ExecutionResult|error? delete = check dbClient->execute(`DELETE FROM users WHERE ID = ${ID}`);
    return delete;
}