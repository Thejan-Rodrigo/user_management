// import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/sql;
import ballerina/io;

//This function will returns the User according to the id 
public function getUsersById(int Id) returns User|sql:Error?|string{
    //exicute the query using getUserByIdQuery to get the user 
    stream<User, sql:Error?> result = dbClient->query(getUsersByIdQuery(Id));
    //Create the users array to store the users
    User[] users = [];

    //Store the user in the array
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    //Check the user is correct or not
    foreach User user in users {
        if user.ID == Id{
            return user;
        }
    }

    //If not return user not found string
    return "User Not Found";
}

//This fuction will return the all the users form the database
public function getAllUsers() returns User[]|sql:Error?{
    //exicute the query using getUsersQuery for get all the users 
    stream<User, sql:Error?> result = dbClient->query(getUsersQuery());

    //Create a users array to store the users 
    User[] users = [];

    //Store all the users in to the array 
    io:println(result.forEach(function(User user){
        users.push(user);
    }));

    //Return all the users
    return users;

}

//This funtion will save a new user to the database
public function inserUser(User user) returns User|string|error?{
    //Check user is already there or not
    User|sql:Error?|string isUser = getUsersById(user.ID);

    //if there is a user return the user
    if isUser is User{
        return isUser;
    }else if isUser is string {
        //else exicute the insert new user query by calling insertUserQuery
        _= check dbClient->execute(inserUserQuery(user));
        //stream<User, sql:Error?> result = dbClient->query(`INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`);
        return "Created";
    }else {
        //If it is a error retun the error 
        return isUser;
    }
}

//this funtion will update a specific user
public function updateUser(UpdateUser user, int ID) returns sql:ExecutionResult|error?|string{
    //Check user is already there or not
    User|sql:Error?|string isUser = getUsersById(ID);

    //If there is no user to found return the user not found string
    if isUser is string{
        return isUser;
    }else {
        //If there is the user the update query will exicute using updateUserQuery
        sql:ExecutionResult|error? test = check dbClient->execute(updateUserQuery(user, ID));
        // io:println(user.FristName);
        // io:println(user.LastName);
        // io:println(user.Age);
        return test;   
    }
}

//This function will delete a user according to the Id
public function deleteUser(int ID) returns error?|User|string{
    io:println(ID);
    //Check the user 
    User|sql:Error?|string isUser = getUsersById(ID);

    //If there is no user to found return the user not found string
    if isUser is string{
        return isUser;
    }else if isUser is sql:Error {
        //If there is sql error return that
        return isUser;
    } else {
        //else exicute the delete query using deleteUserquery
        _ = check dbClient->execute(deleteUserQuery(ID));
        //and retun the user
        return isUser;
    }
}