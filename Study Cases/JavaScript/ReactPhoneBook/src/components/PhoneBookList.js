const style = {
    container : {
        margin: "10px 10px 10px 10px",
        padding: "0 10px 0 10px",
        border: "1px solid #F0F8FF"
    },
    h1: {
        marginLeft: "-10px",
    }
}

function PhoneBookList( props ){
    const printUserList = ( users ) => {
        return users.sort( (a,b)=> { return a.fname < b.fname ? -1 : a.fname > b.fname ? 1 : 0}).map( (user, id)  => 
            <tr key={id}>
                <td>{user.fname}</td>
                <td>{user.lname}</td>
                <td>{user.phone}</td>
            </tr>);
    }

    return <div style={style.container}>
        <h1 style={style.h1}>Phone Book List</h1>
        <table className="table table-bordered table-hover">
            <thead className="thead-dark">
                <tr>
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">Number</th>
                </tr>
            </thead>
            <tbody>
                {printUserList( props.users )}
            </tbody>
        </table>
    </div>;
}

export default PhoneBookList;