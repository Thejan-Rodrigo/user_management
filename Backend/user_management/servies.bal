import ballerina/io;
import ballerina/http;
import ballerinax/mysql.driver as _;
import ballerina/sql;
import user_management.database;



listener http:Listener httpListener = new (8080);

service /manageUser on httpListener{
    resource function get users/[int id]() returns database:User[]|sql:Error?|string{
        io:println("Test");
        database:User[]|sql:Error? result = database:getUsersById(id);

        io:println("Test2");
        io:println(result);

        if result.count() == 0 {
            return "User not found";
        }
        

        io:println("Hello, World!");
        return result;
        
    }

    resource function get users() returns database:User[]|sql:Error? {
        database:User[] | sql:Error? result = database:getAllUsers();
        return result;
    }

    resource function post users/insert(@http:Payload database:User user) returns string|error?{
        string|error? result = database:inserUser(user);

        if result is error{
            return "Got an erro please check again";
        }

        return result;
        
    }


    resource function put users/[int ID]/update(@http:Payload database:UpdateUser user) returns database:User|error?{
        io:println(user.FristName);
        io:println(user.LastName);
        io:println(user.Age);
        sql:ExecutionResult|error? result = database:updateUser(user, ID);

        if result is sql:ExecutionResult{
            database:User response = {ID: ID, FristName: user.FristName, LastName: user.LastName, Age: user.Age};
            return response;
        }else {
            return result;
        }
    }

    resource function delete users/[int ID]/delete() returns string|error?{
        sql:ExecutionResult|error? result = database:deleteUser(ID);

        if result is sql:ExecutionResult{
            return "Deleted Successfully!";
        }else {
            return result;
        }
    }

    


}