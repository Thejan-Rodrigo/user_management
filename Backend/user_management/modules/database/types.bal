import ballerina/http;
type DatabaseConfig record {|
    int port;
    string host;
    string user;
    string database;
    string password;
    int maxOpenConnections;
|};

public type User record {|
    int ID;
    string FristName;
    string LastName;
    int Age;
|};

public type UpdateUser record {|
    string FristName;
    string LastName;
    int Age;
|};

public type UserNotFound record {|
    *http:NotFound;

    record {
        string message;
    }body;
|};
