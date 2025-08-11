import user_management.database;

import ballerina/http;
import ballerina/io;
import ballerina/sql;
import ballerinax/mysql.driver as _;

# RESTful service for managing users
listener http:Listener httpListener = new (8080);

// Update servies configs to allow all Origins
@http:ServiceConfig {
    cors: {
        //allowOrigins: ["http://localhost:3000"],
        allowOrigins: ["*"], // Allow requests from any origin
        allowMethods: ["GET", "POST", "PUT", "DELETE"], // Specify allowed methods
        allowHeaders: ["Content-Type", "Authorization"], // Specify allowed headers
        allowCredentials: false,
        //allowHeaders: ["CORELATION_ID"],
        exposeHeaders: ["X-CUSTOM-HEADER"],
        maxAge: 84900
    }
}

service /manageUser on httpListener {

    // Get user by id
    // inputs -> User Id
    // returns -> User data or SQL error or User not found error
    resource function get users/[int id]() returns database:User|sql:Error?|UserNotFound {
        io:println("[SERVICE] Call to getUsersById fuction");
        // Call to getUserById fuction
        database:User|sql:Error?|string result = database:getUsersById(id);

        if result is string {
            io:println("[SERVICE] User Array is empty");
            //If there is no use by that id returns user not found error
            return {body: {message: "User Not Found"}};
        } else if result is sql:Error {
            io:println("[SERVICE] Error occured");
            //If it'a a sql error return that
            return result;
        } else {
            io:println("[SERVICE] Return Result", result);
            //else return the user
            return result;
        }

    }

    // Get users
    // returns -> Array of Users data or SQL error
    resource function get users() returns database:User[]|sql:Error? {
        io:println("[SERVICE] Call to getAllUsers fuction");
        //Call to the getAllUsers function
        database:User[]|sql:Error? result = database:getAllUsers();

        if result is sql:Error {
            io:println("[SERVICE] Error occured");
            //If it'a a sql error return that
            return result;
        }

        io:println("[SERVICE] Return Result Successfilly!");
        //If not return the Array of users
        return result;
    }

    // Post User
    // inputs -> User Data
    // returns -> User data or SQL error or User Exists error
    resource function post users/insert(@http:Payload Formdata user) returns database:User|error?|UserExist {
        io:println("[SERVICE] Call to inserUser fuction");
        io:println(user);
        //Call to the insertUser function
        database:User|string|error? result = database:inserUser(user.formData);

        if result is error {
            io:println("[SERVICE] Error Occured");
            //If it'a a sql error return that
            return result;
        } else if result is database:User {
            //If it already existing user id return User already existing message
            return {body: {message: "User already existing."}};
        }
        {
            io:println("[SERVICE] Return Result Successfilly!");
            //If not retun a inserted user
            return user.formData;
        }
    }

    // Update User
    // inputs -> User Data
    // returns -> User data or SQL error
    resource function put users/[int ID]/update(@http:Payload database:UpdateUser user) returns database:User|error?|UserNotFound {
        io:println("[SERVICE] Call to updateUser fuction");
        //Call to the updateUser function
        sql:ExecutionResult|error?|string result = database:updateUser(user, ID);

        if result is sql:ExecutionResult {
            //if successufully update return the updated data
            io:println("[SERVICE] Return Result Successfilly!");
            database:User response = {ID: ID, FirstName: user.FirstName, LastName: user.LastName, Age: user.Age};
            return response;
        } else if result is string {
            return {body: {message: "User Not Found"}};
        } else {
            //If it'a a sql error return that
            io:println("[SERVICE] Error Occured");
            return result;
        }
    }

    // Delete User
    // inputs -> User Id
    // returns -> User data or SQL error or User not found error
    resource function delete users/[int ID]/delete() returns string|error?|UserNotFound|database:User {
        io:println("[SERVICE] Call to deleteUser fuction");
        //Call to the deleteUser function
        database:User|error?|string result = database:deleteUser(ID);

        if result is string {
            io:println("User Not Found!");
            //If there is no use by that id returns user not found error
            return {body: {message: "User Not Found"}};
        } else if result is error {
            //If it'a a sql error return that
            io:println("[SERVICE] Error Occured");
            return result;
        } else {
            //else return the deleted user
            return result;
        }
    }

}
