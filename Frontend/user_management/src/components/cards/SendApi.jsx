import axios from 'axios';
import { useState } from 'react';

function SendApi() {
    const [users, setUsers] = useState([]);
    //const [showResult, setShowResult] = useState["false"]
    const handleClick = async () => {
        const res = await axios.get("http://localhost:8080/manageUser/users");
        console.log(res.data);
        setUsers(res.data);
        console.log(users);
        console.log(users.length);
        //setShowResult("ture");
    }

  return (
    <div>
        <h1>
            Get All Users By Id
        </h1>
        <button onClick={handleClick}>
            Send
        </button>

        {users.length > 0 && (
                <div>
                {users.map(item => (
                        <li>
                            ID: {item.ID}<br></br>
                            First Name: {item.FristName}<br></br>
                            Last Name: {item.LastName}<br></br>
                            Age: {item.Age}
                        </li> // Adjust based on your data structure
                    ))}
                </div>  
            )}
        
    </div>
  )
}

export default SendApi