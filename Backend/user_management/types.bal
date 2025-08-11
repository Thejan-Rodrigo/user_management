import ballerina/http;
import user_management.database;
//Type for return user not found massage
public type UserNotFound record {|
    *http:NotFound;

    record {
        string message;
    }body;
|};

//Type for return user already exist massage
public type UserExist record {|
    *http:Conflict;

    record {
        string message;
    }body;
|};

public type Formdata record {|
    database:User formData;
|};