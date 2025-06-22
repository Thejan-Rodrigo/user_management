import axios from 'axios';
import { useState } from 'react';
import "../styles/SendApi.css";

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
            {/* <table id="customers">
                <tr>
                    <th>Company</th>
                    <th>Contact</th>
                    <th>Country</th>
                </tr>
                <tr>
                    <td>Alfreds Futterkiste</td>
                    <td>Maria Anders</td>
                    <td>Germany</td>
                </tr>
                <tr>
                    <td>Berglunds snabbköp</td>
                    <td>Christina Berglund</td>
                    <td>Sweden</td>
                </tr>
                <tr>
                    <td>Centro comercial Moctezuma</td>
                    <td>Francisco Chang</td>
                    <td>Mexico</td>
                </tr>
                <tr>
                    <td>Ernst Handel</td>
                    <td>Roland Mendel</td>
                    <td>Austria</td>
                </tr>
                <tr>
                    <td>Island Trading</td>
                    <td>Helen Bennett</td>
                    <td>UK</td>
                </tr>
                <tr>
                    <td>Königlich Essen</td>
                    <td>Philip Cramer</td>
                    <td>Germany</td>
                </tr>
                <tr>
                    <td>Laughing Bacchus Winecellars</td>
                    <td>Yoshi Tannamuri</td>
                    <td>Canada</td>
                </tr>
                <tr>
                    <td>Magazzini Alimentari Riuniti</td>
                    <td>Giovanni Rovelli</td>
                    <td>Italy</td>
                </tr>
                <tr>
                    <td>North/South</td>
                    <td>Simon Crowther</td>
                    <td>UK</td>
                </tr>
                <tr>
                    <td>Paris spécialités</td>
                    <td>Marie Bertrand</td>
                    <td>France</td>
                </tr>
            </table> */}



            <div class="card">
                <div class="tools">
                    <div class="circle">
                        <span class="red box"></span>
                    </div>
                    <div class="circle">
                        <span class="yellow box"></span>
                    </div>
                    <div class="circle">
                        <span class="green box"></span>
                    </div>
                </div>
                <div class="card__content">
                    <p class="get_text">
                        Get All Users By Id
                    </p>

                    <button onClick={handleClick}>
                        Send
                    </button>
                </div>
            </div>

            {users.length > 0 && (
                <div>
                    <table id='customers'>
                        <tr>
                            <th>ID</th>
                            <th>Frist Name</th>
                            <th>Last Name</th>
                            <th>Age</th>
                        </tr>

                        {users.map(item => (

                            <tr>
                                <td>{item.ID}</td>
                                <td>{item.FristName}</td>
                                <td>{item.LastName}</td>
                                <td>{item.Age}</td>
                            </tr>
                            // <li>
                            //     ID: {item.ID}<br></br>
                            //     First Name: {item.FristName}<br></br>
                            //     Last Name: {item.LastName}<br></br>
                            //     Age: {item.Age}
                            // </li> // Adjust based on your data structure
                        ))}

                    </table>
                </div>
            )}

        </div>
    )
}

export default SendApi