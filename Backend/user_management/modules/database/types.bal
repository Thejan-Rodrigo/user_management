// import ballerina/http;
//To Store the all the type for get request data and return responce data 

//Type for store database config data
type DatabaseConfig record {|
    int port;
    string host;
    string user;
    string database;
    string password;
    int maxOpenConnections;
|};

//Type for get User and return user
public type User record {|
    int ID;
    string FristName;
    string LastName;
    int Age;
|};

//Type for update the user without the id
public type UpdateUser record {|
    string FristName;
    string LastName;
    int Age;
|};