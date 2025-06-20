import ballerina/sql;

//Query for Return all the users form the database
function getUsersQuery() returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `SELECT * FROM users`;
    return query;
}

//Query for Get a specific user by id
function getUsersByIdQuery(int Id) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `SELECT * FROM users WHERE ${Id}`;
    return query;
}

//Query for insert a new user for the database 
function inserUserQuery(User user) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`;
    return query;
}

//Query for update a specific user by id
function updateUserQuery(UpdateUser user, int ID) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `UPDATE users SET FristName = ${user.FristName}, LastName = ${user.LastName}, Age = ${user.Age} WHERE ID = ${ID}`;
    return query;
}

//Query for the delete a specific user by Id
function deleteUserQuery(int ID) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `DELETE FROM users WHERE ID = ${ID}`;
    return query;
}