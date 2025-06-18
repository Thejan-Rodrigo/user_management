import ballerina/io;
import ballerina/http;
import ballerinax/mysql.driver as _;
import ballerina/sql;



listener http:Listener httpListener = new (8080);

service /manageUser on httpListener{
    resource function get users/[int id]() returns User[]|sql:Error?|string{
        io:println("Test");

        User[]|sql:Error? result = getUsersById(id);

        io:println("Test2");
        io:println(result);

        if result.count() == 0 {
            return "User not found";
        }
        

        io:println("Hello, World!");
        return result;
        
    }

    resource function get users() returns User[]|sql:Error? {
        User[] | sql:Error? result = getAllUsers();
        return result;
    }

    resource function post users/insert(@http:Payload User user) returns string|error?{
        string|error? result = inserUser(user);

        if result is error{
            return "Got an erro please check again";
        }

        return result;
        
    }


    resource function put users/[int ID]/update(@http:Payload UpdateUser user) returns User|error?{
        io:println(user.FristName);
        io:println(user.LastName);
        io:println(user.Age);
        sql:ExecutionResult|error? result = updateUser(user, ID);

        if result is sql:ExecutionResult{
            User response = {ID: ID, FristName: user.FristName, LastName: user.LastName, Age: user.Age};
            return response;
        }else {
            return result;
        }
    }

    resource function delete users/[int ID]/delete() returns string|error?{
        sql:ExecutionResult|error? result = deleteUser(ID);

        if result is sql:ExecutionResult{
            return "Deleted Successfully!";
        }else {
            return result;
        }
    }

    


}