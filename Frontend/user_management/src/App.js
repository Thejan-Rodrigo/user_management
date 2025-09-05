import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import SendApi from './components/cards/SendApi';
import NewUserForm from './components/form/NewUserForm';
import TimeLine from './components/timeline/TimeLine'; // <- Create this component

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={
          <>
            <SendApi />
            <NewUserForm />
          </>
        } />
        <Route path="/timeline" element={<TimeLine />} />
      </Routes>
    </Router>
  );
}

export default App;
