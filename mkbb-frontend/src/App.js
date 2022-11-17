import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter as Router, Route, Routes} from "react-router-dom"
import PartsList from './Components/PartListsPage';
import Home from './Components/Home';
import Login from './Components/Login'
import Register from './Components/Register';
import Prebuilt from './Components/Prebuilt/Prebuilt';
import PCBList from './Components/PCBList/PCBList';
import Switches from './Components/Switches/Switches';
import Stabilizers from './Components/Stabilizers/Stabilizers';
import Keycaps from './Components/Keycaps/Keycaps';
import Case from './Components/Case/Case';
import ReportedListings from './Components/ReportedListings/ReportedListings';

function App() {
  return (
     <Routes>
        <Route path="/" element={<Home />}/>
        <Route path="/partslist" element={<PartsList />}/>
        <Route path="/login" element={<Login/>}/>
        <Route path="/register" element={<Register/>}/>
        <Route path="/prebuilt" element={<Prebuilt />}/>
        <Route path="/case" element={<Case />}/>
        <Route path="/PCBList" element={<PCBList />}/>
        <Route path="/switches" element={<Switches />}/>
        <Route path="/stabilizers" element={<Stabilizers />}/>
        <Route path="/keycaps" element={<Keycaps />}/>
        <Route path="/browse-prebuilts" element={<div />} />
        <Route path="/advertise" element={<div />}/>
        <Route path="/reported-listings" element={<ReportedListings />} />
      </Routes>
  );
}

export default App;