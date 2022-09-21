import 'bootstrap/dist/css/bootstrap.css';
import { useState } from 'react';

import { createRoot } from 'react-dom/client';
import PhoneBookForm from './components/PhoneBookForm';
import PhoneBookList from './components/PhoneBookList';

function App() {
  const [users, setUsers] = useState( [] );

  const addUser = ( user ) => {
    const newUsers = [...users, user];
    setUsers(newUsers);
  };

  return <>
     <PhoneBookForm addUser={addUser}/>
     <hr/>
     <PhoneBookList users={users}/>
  </>;
}

const container = document.getElementById('app');
const root = createRoot(container);
root.render(<App/>);
