import { useState } from "react";

const style = {
    container : {
        margin: "10px 10px 10px 10px",
        padding: "0 10px 0 10px",
        width: "400px",
        border: "1px solid #F0F8FF",
    },
    h1: {
        marginLeft: "-10px",
    },
    button: {
        margin: "10px 10px 10px 0",
    }
}

function PhoneBookForm( props ){
    const submitUser = (e) => {
        e.preventDefault();
        if ( e.target[0].value
            && e.target[1].value
            && e.target[2].value) 
            props.addUser(
                {
                    fname: e.target[0].value,
                    lname: e.target[1].value,
                    phone: e.target[2].value,
                }
            );
    }
    return <form style={style.container} onSubmit={submitUser}>
        <h1 style={style.h1}>Phone book form</h1>
        <label htmlFor="fname">First name:</label><br/>
        <input type="text" className="form-control" placeholder="First Name" name="fname"></input>
        {/* <input type="text" id="fname" name="fname" placeholder="First Name"/><br/> */}
        <label htmlFor="lname">Last name:</label><br/>
        <input type="text" className="form-control" placeholder="Last Name" name="lname"></input>
        {/* <input type="text" id="lname" name="lname" placeholder="Last Name"/><br/> */}
        <label htmlFor="phone">Phone:</label><br/>
        <input type="text" className="form-control" placeholder="Phone" name="phone"></input>
        {/* <input type="text" id="phone" name="phone" placeholder="Phone"/><br/> */}
        <button style={style.button} type="submit" className="btn btn-success">Add User</button>
    </form>;
}

export default PhoneBookForm;