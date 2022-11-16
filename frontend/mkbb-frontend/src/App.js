import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter as Router, Route, Routes} from "react-router-dom"
import PartsList from './Components/PartListsPage';
import Home from './Components/Home';
import Login from './Components/Login'
import Register from './Components/Register';
function App() {
  return (
     <Routes>  
        <Route path="/partslist" element={<PartsList />}/>
        <Route path="/" element={<Home />}/>
        <Route path="/login" element={<Login/>}/>
        <Route path="/register" element={<Register/>}/>
      </Routes>
  );
}

export default App;