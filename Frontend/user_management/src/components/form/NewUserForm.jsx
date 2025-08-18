import React, { useState } from 'react';
import "../styles/NewUserForm.css";
import axios from 'axios';
function NewUserForm() {
    const [formData, setFormData] = useState({
        ID: 0,
        FirstName: '',
        LastName: '',
        Age: 0
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        })
        )
    }

    const handleSubmit = async () => {
        console.log(formData.ID);
        console.log(formData.Age);
        const idNum = parseInt(formData.ID, 10);
        const age = parseInt(formData.Age, 10);
        setFormData(prev => ({
            ...prev,
            ID: idNum,
            Age:age
        })
        )
        console.log(formData);
        console.log(idNum);
        console.log(age);
        console.log(formData);
        console.log(`ID:${idNum}, FirstName:${formData.FirstName}, LastName:${formData.LastName}, Age:${age}`);
        const res = await axios.post("http://localhost:8080/manageUser/users/insert", {
            formData
        });
        console.log(res.data);

    }


    return (
        <div className="component">
            <div class="form-container">
                <div class="logo-container">
                    Create New User
                </div>

                <form class="form">
                    <div class="form-group">
                        <label>ID</label>
                        <input type="text" value={formData.ID} onChange={handleChange} name="ID" id='ID' placeholder="Enter Id Number" required=""></input>
                    </div>
                    <div class="form-group">
                        <label >First Name</label>
                        <input type="text" value={formData.FirstName} onChange={handleChange} name="FirstName" id='FristName' placeholder="Enter Your First Name" required=""></input>
                    </div>
                    <div class="form-group">
                        <label >Last Name</label>
                        <input type="text" value={formData.LastName} onChange={handleChange} name="LastName" id='LastName' placeholder="Enter Your Last Name" required=""></input>
                    </div>
                    <div class="form-group">
                        <label >Age</label>
                        <input type="number" value={formData.Age} onChange={handleChange} name="Age" id='Age' placeholder="Enter Your Age" required=""></input>
                    </div>
                </form>
                <button class="form-submit-btn" type="submit" onClick={handleSubmit} onChange={handleChange}>Create</button>
            </div>
        </div>
    )
}

export default NewUserForm