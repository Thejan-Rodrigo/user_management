import axios from 'axios';
import { useState } from 'react';
import { useNavigate } from 'react-router-dom'; // <- Add this
import "../styles/SendApi.css";

function SendApi() {
    const [users, setUsers] = useState([]);
    const navigate = useNavigate(); // <- useNavigate hook

    const handleClick = async () => {
        try {
            const res = await axios.get("http://localhost:8080/manageUser/users");
            setUsers(res.data);
        } catch (error) {
            console.error("Failed to fetch users", error);
        }
    };

    const handleTimeLine = () => {
        navigate('/timeline'); // <- Navigate to /timeline
    };

    return (
        <div>
            <div style={{ marginBottom: "20px" }}>
                <button onClick={handleTimeLine} className="timeline-button">
                    View Timeline
                </button>
            </div>

            <div className="card">
                <div className="tools">
                    <div className="circle"><span className="red box"></span></div>
                    <div className="circle"><span className="yellow box"></span></div>
                    <div className="circle"><span className="green box"></span></div>
                </div>
                <div className="card__content">
                    <p className="get_text">Get All Users By Id</p>
                    <button onClick={handleClick}>Send</button>
                </div>
            </div>

            {users.length > 0 && (
                <div>
                    <table id="customers">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Age</th>
                            </tr>
                        </thead>
                        <tbody>
                            {users.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.ID}</td>
                                    <td>{item.FristName}</td>
                                    <td>{item.LastName}</td>
                                    <td>{item.Age}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}
        </div>
    );
}

export default SendApi;
