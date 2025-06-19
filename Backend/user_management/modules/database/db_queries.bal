import ballerina/sql;

function getUsersQuery() returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `SELECT * FROM users`;
    return query;
}

function getUsersByIdQuery(int Id) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `SELECT * FROM users WHERE ${Id}`;
    return query;
}

function inserUserQuery(User user) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `INSERT INTO users(ID, FristName, LastName, Age) VALUE (${user.ID}, ${user.FristName}, ${user.LastName}, ${user.Age})`;
    return query;
}

function updateUserQuery(UpdateUser user, int ID) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `UPDATE users SET FristName = ${user.FristName}, LastName = ${user.LastName}, Age = ${user.Age} WHERE ID = ${ID}`;
    return query;
}

function deleteUserQuery(int ID) returns sql:ParameterizedQuery{
    sql:ParameterizedQuery query = `DELETE FROM users WHERE ID = ${ID}`;
    return query;
}