import ballerina/io;
import ballerina/http;
import ballerinax/mysql.driver as _;
import ballerina/sql;
import user_management.database;



listener http:Listener httpListener = new (8080);

service /manageUser on httpListener{
    resource function get users/[int id]() returns database:User[]|sql:Error?|string{
        io:println("[SERVICE] Call to getUsersById fuction");
        database:User[]|sql:Error? result = database:getUsersById(id);

        if result.count() == 0 {
            io:println("[SERVICE] User Array is empty");
            return result;
        }else if result is sql:Error {
            io:println("[SERVICE] Error occured");
            return result;
        }
        

        io:println("[SERVICE] Return Result", result);
        return result;
        
    }

    resource function get users() returns database:User[]|sql:Error? {
        io:println("[SERVICE] Call to getAllUsers fuction");
        database:User[] | sql:Error? result = database:getAllUsers();

        if result is sql:Error {
            io:println("[SERVICE] Error occured");
            return result;
        }

        io:println("[SERVICE] Return Result Successfilly!");
        return result;
    }

    resource function post users/insert(@http:Payload database:User user) returns database:User|error?{
        io:println("[SERVICE] Call to inserUser fuction");
        string|error? result = database:inserUser(user);

        
        if result is error{
            io:println("[SERVICE] Error Occured");
            return result;
        }else {
            io:println("[SERVICE] Return Result Successfilly!");
            return user;
        }
        
    }


    resource function put users/[int ID]/update(@http:Payload database:UpdateUser user) returns database:User|error?{
        io:println("[SERVICE] Call to updateUser fuction");
        sql:ExecutionResult|error? result = database:updateUser(user, ID);

        if result is sql:ExecutionResult{
            io:println("[SERVICE] Return Result Successfilly!");
            database:User response = {ID: ID, FristName: user.FristName, LastName: user.LastName, Age: user.Age};
            return response;
        }else {
            io:println("[SERVICE] Error Occured");
            return result;
        }
    }

    resource function delete users/[int ID]/delete() returns string|error?{
        io:println("[SERVICE] Call to deleteUser fuction");
        sql:ExecutionResult|error? result = database:deleteUser(ID);

        if result is sql:ExecutionResult{
            io:println("[SERVICE] Return Result Successfilly!");
            return "Deleted Successfully!";
        }else {
            io:println("[SERVICE] Error Occured");
            return result;
        }
    }

    


}